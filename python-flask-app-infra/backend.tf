terraform {
  backend "s3" {
    bucket = "three-tier-application-aws-tfstate"
    key    = "python-flask-app-infra/terraform.tfstate"
    region = "eu-central-1"
  }
}
