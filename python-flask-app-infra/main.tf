module "networking" {
  source               = "./modules/networking"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs                  = var.azs
}

module "security" {
  source             = "./modules/security"
  vpc_id             = module.networking.vpc_id
  public_subnet_ids  = module.networking.public_subnet_ids
  private_subnet_ids = module.networking.private_subnet_ids
}

module "alb" {
  source            = "./modules/alb"
  vpc_id            = module.networking.vpc_id
  public_subnet_ids = module.networking.public_subnet_ids
  alb_sg_id         = module.security.alb_sg_id
  target_port       = 5000
}

module "asg" {
  source             = "./modules/asg"
  private_subnet_ids = module.networking.private_subnet_ids
  ec2_sg_id          = module.security.ec2_sg_id
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  target_group_arn   = module.alb.target_group_arn
}

module "rds" {
  source        = "./modules/rds"
  db_subnet_ids = module.networking.private_subnet_ids
  rds_sg_id     = module.security.rds_sg_id
  db_name       = var.db_name
  db_username   = var.db_username
  db_password   = var.db_password
}
