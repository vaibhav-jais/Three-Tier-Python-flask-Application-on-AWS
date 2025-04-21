variable "subnet_id" {
  description = "Subnet ID for Jenkins EC2"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.medium"
}

variable "key_name" {
  description = "EC2 Key Pair name"
  type        = string
}
/*
variable "jenkins_version" {
  description = "Jenkins version to install"
  type        = string
  default     = "2.414.2"
}
*/
variable "ami_id" {
  description = "AMI ID for EC2"
  type        = string
}

variable "enable_public_ip_address" {
  description = "whether to enable a public IP address to EC2 instances"
  type        = bool
  default     = true
}
