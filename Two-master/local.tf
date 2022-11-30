locals {
  name   = "rds-mysql"
  region = "us-east-1"

  tags = {
    Name       = local.name
    Example    = local.name
    Repository = "https://github.com/terraform-aws-modules/terraform-aws-rds"
  }
}
 