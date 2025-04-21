variable "vpc_cidr" {}
variable "vpc_name" {}
variable "public_subnets" { type = list(string) }
variable "azs" { type = list(string) }
variable "instance_type" { default = "t2.medium" }
variable "key_name" {}
variable "domain_name" {
  type = string
}
variable "ami_id" {
  type    = string
  default = ""
}

