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
  parameter_group_name = "default.redis7"
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

module "s3" {
  source        = "./modules/s3"
  bucket_name   = "mi-bucket-s3111418082024"
  acl           = "private"
  tags = {
    Name = "S3 Bucket"
  }
}


module "cloudfront" {
  source                = "./modules/cloudfront"
  s3_bucket_domain_name = module.s3.bucket_domain_name
  origin_id             = "s3-origin-id"
  tags = {
    Name = "CloudFront Distribution"
  }
}

module "api_gateway_lambda" {
  source = "./modules/api_gateway_lambda"

  lambda_function_name       = "mi-lambda-function"
  lambda_handler             = "index.handler"
  lambda_runtime             = "nodejs18.x"
  lambda_role_arn            = module.iam.lambda_role_arn
  lambda_s3_filename         = "lambda.zip"
  lambda_s3_bucket           = "mi-bucket-s3"
  lambda_s3_key              = "lambda/lambda.zip"
  lambda_source_code_hash    = filebase64sha256("lambda.zip")
  lambda_environment_variables = {
    ENV_VAR_1 = "value1"
    ENV_VAR_2 = "value2"
  }

  api_gateway_name           = "mi-api-gateway"
  api_gateway_description    = "API Gateway para mi Lambda"
  api_gateway_resource_path  = "mi-recurso"

  tags = {
    Name = "API Gateway y Lambda"
  }
}

module "cognito" {
  source                 = "./modules/cognito"
  user_pool_name         = "mi-user-pool"
  user_pool_client_name  = "mi-app-client"
  generate_secret        = false
  user_pool_domain       = "mi-domain"
  identity_pool_name     = "mi-identity-pool"
  tags = {
    Name = "Cognito Setup"
  }
}




output "vpc_id" {
  value = module.vpc.vpc_id
}




