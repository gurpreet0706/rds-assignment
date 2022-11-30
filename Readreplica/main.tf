################################################################################
# Master DB
################################################################################

module "master1" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "${local.name}-master1"

  engine               = var.engine_name
  engine_version       = var.engine_version
  family               = var.family
  major_engine_version = var.major_engine_version
  instance_class       = var.instance_class

  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_storage

  db_name  = var.db_name
  username = var.user_name
  password = var.pass
  port     = var.port

  multi_az               = var.multi_az_deployment
  db_subnet_group_name   = module.vpc.database_subnet_group_name
  vpc_security_group_ids = [module.security_group.security_group_id]

  maintenance_window              = "Mon:00:00-Mon:03:00"
  backup_window                   = "03:00-06:00"
  
  # Backups are required in order to create a replica
  backup_retention_period = 1
  skip_final_snapshot     = var.skip_finalSnapshot
  deletion_protection     = var.deletion_protection

  tags = local.tags
}

################################################################################
# Replica DB
################################################################################

module "replica" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "${local.name}-replica"

  # Source database. For cross-region use db_instance_arn
  replicate_source_db    = module.master1.db_instance_id
  create_random_password = false

  engine               = var.engine_name
  engine_version       = var.engine_version
  family               = var.family
  major_engine_version = var.major_engine_version
  instance_class       = var.instance_class
  
  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_storage

  port = var.port

  multi_az               = var.multi_az_deployment
  vpc_security_group_ids = [module.security_group.security_group_id]

  maintenance_window              = "Tue:00:00-Tue:03:00"
  backup_window                   = "03:00-06:00"
  
  backup_retention_period = 0
  skip_final_snapshot     = var.skip_finalSnapshot
  deletion_protection     = var.deletion_protection

  tags = local.tags
}

################################################################################
# Supporting Resources
################################################################################

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"

  name = local.name
  cidr = "10.99.0.0/18"

  azs              = ["${local.region}a", "${local.region}b", "${local.region}c"]
  public_subnets   = ["10.99.0.0/24", "10.99.1.0/24", "10.99.2.0/24"]
  private_subnets  = ["10.99.3.0/24", "10.99.4.0/24", "10.99.5.0/24"]
  database_subnets = ["10.99.7.0/24", "10.99.8.0/24", "10.99.9.0/24"]

  create_database_subnet_group = true

  tags = local.tags
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = local.name
  description = "Replica MySQL example security group"
  vpc_id      = module.vpc.vpc_id

  # ingress
  ingress_with_cidr_blocks = [
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      description = "MySQL access from within VPC"
      cidr_blocks = module.vpc.vpc_cidr_block
    },
  ]

  tags = local.tags
}
