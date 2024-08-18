# main.tf en el módulo EKS

resource "aws_eks_cluster" "main" {
  name     = var.cluster_name
  role_arn = var.cluster_role_arn

  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = [var.security_group]
  }
}

resource "aws_eks_fargate_profile" "fargate" {
  cluster_name          = aws_eks_cluster.main.name
  pod_execution_role_arn = var.node_role_arn
  subnet_ids            = var.subnet_ids  # Aquí se debe usar 'subnet_ids' en lugar de 'subnets'
  fargate_profile_name  = var.fargate_profile_name

  selector {
    namespace = var.namespace
  }
}
