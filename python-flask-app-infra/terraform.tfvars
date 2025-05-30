vpc_cidr             = "10.10.0.0/16"
public_subnet_cidrs  = ["10.10.1.0/24", "10.10.2.0/24"]
private_subnet_cidrs = ["10.10.3.0/24", "10.10.4.0/24"]
azs                  = ["eu-central-1a", "eu-central-1b"]
ami_id               = "ami-0d8d11821a1c1678b"
instance_type        = "t3.micro"
key_name             = "python-flask-app-infra_KP"
db_name              = "flaskdb"
db_username          = "admin"
db_password          = "supersecret"
