engine_name              = "mysql"
engine_version           = "8.0.27"
db_name                  = "ngmuthrds"
user_name                = "admin"
pass                     = "Redhat123"
multi_az_deployment      = false
public_access            = false
skip_finalSnapshot       = true
delete_automated_backup  = true
instance_class           = "db.t3.micro"
family                = "mysql8.0" # DB parameter group
major_engine_version  = "8.0"      # DB option group
deletion_protection   = false