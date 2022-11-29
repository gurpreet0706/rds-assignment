# Master1

output "master1_db_instance_address" {
  description = "The address of the RDS instance"
  value       = module.master1.db_instance_address
}

output "master1_db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = module.master1.db_instance_arn
}

output "master1_db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = module.master1.db_instance_availability_zone
}

output "master1_db_instance_endpoint" {
  description = "The connection endpoint"
  value       = module.master1.db_instance_endpoint
}

output "master1_db_instance_engine" {
  description = "The database engine"
  value       = module.master1.db_instance_engine
}

output "master1_db_instance_engine_version_actual" {
  description = "The running version of the database"
  value       = module.master1.db_instance_engine_version_actual
}

output "master1_db_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
  value       = module.master1.db_instance_hosted_zone_id
}

output "master1_db_instance_id" {
  description = "The RDS instance ID"
  value       = module.master1.db_instance_id
}

output "master1_db_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = module.master1.db_instance_resource_id
}

output "master1_db_instance_status" {
  description = "The RDS instance status"
  value       = module.master1.db_instance_status
}

output "master1_db_instance_name" {
  description = "The database name"
  value       = module.master1.db_instance_name
}

output "master1_db_instance_username" {
  description = "The master username for the database"
  value       = module.master1.db_instance_username
  sensitive   = true
}

output "master1_db_instance_password" {
  description = "The database password (this password may be old, because Terraform doesn't track it after initial creation)"
  value       = module.master1.db_instance_password
  sensitive   = true
}

output "master1_db_instance_port" {
  description = "The database port"
  value       = module.master1.db_instance_port
}

output "master1_db_subnet_group_id" {
  description = "The db subnet group name"
  value       = module.master1.db_subnet_group_id
}

output "master1_db_subnet_group_arn" {
  description = "The ARN of the db subnet group"
  value       = module.master1.db_subnet_group_arn
}

output "master1_db_instance_cloudwatch_log_groups" {
  description = "Map of CloudWatch log groups created and their attributes"
  value       = module.master1.db_instance_cloudwatch_log_groups
}

# Master2
output "master2_db_instance_address" {
  description = "The address of the RDS instance"
  value       = module.master2.db_instance_address
}

output "master2_db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = module.master2.db_instance_arn
}

output "master2_db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = module.master2.db_instance_availability_zone
}

output "master2_db_instance_endpoint" {
  description = "The connection endpoint"
  value       = module.master2.db_instance_endpoint
}

output "master2_db_instance_engine" {
  description = "The database engine"
  value       = module.master2.db_instance_engine
}

output "master2_db_instance_engine_version_actual" {
  description = "The running version of the database"
  value       = module.master2.db_instance_engine_version_actual
}

output "master2_db_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
  value       = module.master2.db_instance_hosted_zone_id
}

output "master2_db_instance_id" {
  description = "The RDS instance ID"
  value       = module.master2.db_instance_id
}

output "master2_db_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = module.master2.db_instance_resource_id
}

output "master2_db_instance_status" {
  description = "The RDS instance status"
  value       = module.master2.db_instance_status
}

output "master2_db_instance_name" {
  description = "The database name"
  value       = module.master2.db_instance_name
}

output "master2_db_instance_username" {
  description = "The master username for the database"
  value       = module.master2.db_instance_username
  sensitive   = true
}

output "master2_db_instance_password" {
  description = "The database password (this password may be old, because Terraform doesn't track it after initial creation)"
  value       = module.master2.db_instance_password
  sensitive   = true
}

output "master2_db_instance_port" {
  description = "The database port"
  value       = module.master2.db_instance_port
}

output "master2_db_subnet_group_id" {
  description = "The db subnet group name"
  value       = module.master2.db_subnet_group_id
}

output "master2_db_subnet_group_arn" {
  description = "The ARN of the db subnet group"
  value       = module.master2.db_subnet_group_arn
}

output "master2_db_instance_cloudwatch_log_groups" {
  description = "Map of CloudWatch log groups created and their attributes"
  value       = module.master2.db_instance_cloudwatch_log_groups
}

# Replica
output "replica_db_instance_address" {
  description = "The address of the RDS instance"
  value       = module.replica.db_instance_address
}

output "replica_db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = module.replica.db_instance_arn
}

output "replica_db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = module.replica.db_instance_availability_zone
}

output "replica_db_instance_endpoint" {
  description = "The connection endpoint"
  value       = module.replica.db_instance_endpoint
}

output "replica_db_instance_engine" {
  description = "The database engine"
  value       = module.replica.db_instance_engine
}

output "replica_db_instance_engine_version_actual" {
  description = "The running version of the database"
  value       = module.replica.db_instance_engine_version_actual
}

output "replica_db_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
  value       = module.replica.db_instance_hosted_zone_id
}

output "replica_db_instance_id" {
  description = "The RDS instance ID"
  value       = module.replica.db_instance_id
}

output "replica_db_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = module.replica.db_instance_resource_id
}

output "replica_db_instance_status" {
  description = "The RDS instance status"
  value       = module.replica.db_instance_status
}

output "replica_db_instance_name" {
  description = "The database name"
  value       = module.replica.db_instance_name
}

output "replica_db_instance_username" {
  description = "The replica username for the database"
  value       = module.replica.db_instance_username
  sensitive   = true
}

output "replica_db_instance_port" {
  description = "The database port"
  value       = module.replica.db_instance_port
}

output "replica_db_instance_cloudwatch_log_groups" {
  description = "Map of CloudWatch log groups created and their attributes"
  value       = module.replica.db_instance_cloudwatch_log_groups
}
