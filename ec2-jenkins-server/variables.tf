variable "vpc_cidr" {}
variable "vpc_name" {}
variable "public_subnets" { type = list(string) }
variable "azs" { type = list(string) }
variable "instance_type" { default = "t2.medium" }
variable "key_name" {}
variable "ami_id" {}
variable "domain_name" {
  type = string
}

