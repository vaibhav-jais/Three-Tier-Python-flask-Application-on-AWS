variable "private_subnet_ids" { type = list(string) }
variable "ec2_sg_id" {}
variable "ami_id" {}
variable "instance_type" { default = "t3.micro" }
variable "key_name" {}
variable "target_group_arn" {}
