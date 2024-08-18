# outputs.tf

output "eks_cluster_role_arn" {
  description = "ARN del rol IAM para el clúster EKS"
  value       = aws_iam_role.eks_cluster_role.arn
}

output "eks_fargate_pod_execution_role_arn" {
  description = "ARN del rol IAM para la ejecución de pods en Fargate"
  value       = aws_iam_role.eks_fargate_pod_execution_role.arn
}
