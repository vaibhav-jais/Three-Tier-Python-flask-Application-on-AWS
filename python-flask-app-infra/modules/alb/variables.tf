variable "vpc_id" {}
variable "public_subnet_ids" { type = list(string) }
variable "alb_sg_id" {}
variable "target_port" { default = 5000 }
