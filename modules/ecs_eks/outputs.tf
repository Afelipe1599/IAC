# outputs.tf

output "eks_cluster_name" {
  description = "Nombre del clúster EKS."
  value       = aws_eks_cluster.main.name
}

output "fargate_profile_arn" {
  description = "ARN del perfil Fargate."
  value       = aws_eks_fargate_profile.fargate.arn
}
