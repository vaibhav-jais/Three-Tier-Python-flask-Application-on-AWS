vpc_cidr = "10.0.0.0/16"
vpc_name = "jenkins-vpc"

public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
azs            = ["us-east-1a", "us-east-1b"]
instance_type  = "t2.medium"
key_name       = "Jenkins-ec2-3TierAppProject_KP"
#ami_id         = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI in us-east-1
domain_name = "vaibhavcloud.info"

