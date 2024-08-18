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
  fargate_profile_name = "mi-fargate-profile"  # Asigna un nombre aquí
  namespace           = "default"
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id  # Asegúrate de que module.vpc.vpc_id esté correctamente exportado
}

output "vpc_id" {
  value = module.vpc.vpc_id
}




