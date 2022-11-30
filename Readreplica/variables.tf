variable "engine_name" {
  description = "Enter the DB engine"
  type        = string
  default     = "mysql"
}

variable "family" {
  description = "Enter the DB parameter group"
  type        = string
  default     = "mysql8.0"
}

variable "major_engine_version" {
  description = "Enter the DB option group"
  type        = string
  default     = "8.0"
}



variable "engine_version" {
  description = "Enter the DB engine version"
  type        = string
  default     = "8.0.27"
}

variable "db_name" {
  description = "Enter the name of the database to be created inside DB Instance"
  type        = string
  default     = "assignment"
}
variable "user_name" {
  description = "Enter the username for DB"
  type        = string
  default     = "admin"
}
variable "pass" {
  description = "Enter the username for DB"
  type        = string
  default     = "Redhat123"
}
variable "multi_az_deployment" {
  description = "Enable or disable multi-az deployment"
  type        = bool
  default     = false
}
variable "public_access" {
  description = "Whether public access needed"
  type        = bool
  default     = false
}
variable "skip_finalSnapshot" {
  type    = bool
  default = true
}

variable "deletion_protection" {
  type    = bool
  default = false
}

variable "delete_automated_backup" {
  type    = bool
  default = true
}
variable "instance_class" {
  type    = string
  default = "db.t2.micro"
}

variable "allocated_storage"{
   type = number
   default = 20
}
variable "max_storage"{
    type = number
     default = 100
}
variable "port"{
    type = number
     default = 3306
}