# main.tf en la raíz

provider "aws" {
  region = "us-east-1"  # Define la región según tu necesidad
}

module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = var.vpc_cidr
  vpc_name            = var.vpc_name
  availability_zones  = var.availability_zones
  public_subnet_1_cidr = var.public_subnet_1_cidr
  public_subnet_2_cidr = var.public_subnet_2_cidr
  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id  
}

module "iam" {
  source = "./modules/iam"
}

module "ecs_eks" {
  source              = "./modules/ecs_eks"
  cluster_name        = "mi-cluster"
  cluster_role_arn    = module.iam.eks_cluster_role_arn
  subnet_ids          = module.vpc.private_subnets
  security_group      = module.security_group.eks_sg
  node_role_arn       = module.iam.eks_fargate_pod_execution_role_arn
  node_group_name     = "mi-node-group"
  desired_capacity    = 2
  max_size            = 3
  min_size            = 1
  instance_types      = ["t3.medium"]
  fargate_profile_name = "mi-fargate-profile" 
  namespace           = "default"
}

module "nlb" {
  source             = "./modules/nlb"
  name               = "mi-nlb"
  subnet_ids         = module.vpc.public_subnets
  vpc_id             = module.vpc.vpc_id
  target_group_name  = "mi-tg"
  port               = 80
  listener_port      = 80
  tags               = {
    Name = "mi-nlb"
  }
}

module "elasticache" {
  source              = "./modules/elasticache"
  cluster_id          = "mi-elasticache-cluster"
  engine              = "redis"
  node_type           = "cache.t3.micro"
  num_cache_nodes     = 1
  parameter_group_name = "default.redis3.2"
  port                = 6379
  subnet_ids          = module.vpc.private_subnets
  security_group_id   = module.security_group.eks_sg
  tags                = {
    Name = "elasticache-cluster"
  }
}

module "aurora" {
  source              = "./modules/aurora"
  cluster_identifier  = "mi-aurora-cluster"
  database_name       = "mi_database"
  master_username     = "admin"
  master_password     = "password"
  subnet_ids          = module.vpc.private_subnets
  security_group_id   = module.security_group.eks_sg
  proxy_role_arn      = module.iam.rds_proxy_role_arn
  secret_arn          = module.secretsmanager.db_secret_arn
  tags                = {
    Name = "mi-aurora-cluster"
  }
}

module "secretsmanager" {
  source      = "./modules/secretsmanager"
  secret_name = "db-credentials"
  db_username = "admin"
  db_password = "password"
  tags = {
    Name = "db-credentials"
  }
}


output "vpc_id" {
  value = module.vpc.vpc_id
}




