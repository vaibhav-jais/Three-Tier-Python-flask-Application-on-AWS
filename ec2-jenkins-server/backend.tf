terraform {
  backend "s3" {
    bucket = "three-tier-application_aws-tfstate"
    key    = "jenkins-ec2/terraform.tfstate"
    region = "us-east-1"
  }
}
