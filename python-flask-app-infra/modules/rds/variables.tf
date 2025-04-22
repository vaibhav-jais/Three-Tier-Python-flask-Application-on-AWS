variable "db_subnet_ids" { type = list(string) }
variable "rds_sg_id" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {}
variable "db_instance_class" { default = "db.t3.micro" }
variable "engine" { default = "mysql" }
variable "engine_version" { default = "8.0" }
