module "vpc" {
  source = "./modules/vpc"
}

module "cloudwatch" {
  source = "./modules/cloudwatch"
  region = var.aws_region
}

module "rds" {
  source = "./modules/rds"
  db_name     = var.db_name
  username    = var.db_user
  password    = var.db_password
  subnet_ids  = module.vpc.private_subnets
  vpc_id      = module.vpc.vpc_id
  sg_id       = module.vpc.db_sg_id
}

module "ecs" {
  source              = "./modules/ecs"
  region              = var.aws_region
  vpc_id              = module.vpc.vpc_id
  subnets             = module.vpc.public_subnets
  alb_arn             = module.vpc.alb_arn
  alb_tg_arn          = module.vpc.alb_tg_arn
  sg_id               = module.vpc.ecs_sg_id
  image_url           = var.image_url
  cloudwatch_log_group = module.cloudwatch.log_group
  db_url              = module.rds.db_url
}
