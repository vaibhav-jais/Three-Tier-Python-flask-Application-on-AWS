module "networking" {
  source         = "./modules/networking"
  vpc_cidr       = var.vpc_cidr
  public_subnets = var.public_subnets
  azs            = var.azs
}

module "security" {
  source = "./modules/security"
  vpc_id = module.networking.vpc_id
}

module "ec2_jenkins" {
  source            = "./modules/ec2-jenkins"
  subnet_id         = module.networking.public_subnet_ids[0]
  security_group_id = module.security.jenkins_sg_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  ami_id            = var.ami_id
}

module "route53" {
  source      = "./modules/route53"
  domain_name = var.domain_name
}

module "acm" {
  source      = "./modules/acm"
  domain_name = var.domain_name
  zone_id     = module.route53.zone_id
}

resource "aws_route53_record" "jenkins" {
  zone_id = module.route53.zone_id
  name    = "jenkins.${var.domain_name}"
  type    = "A"
  ttl     = 300
  records = [module.ec2_jenkins.jenkins_public_ip]
}
