# modules/security_group/outputs.tf

output "eks_sg" {
  description = "ID del Security Group para EKS"
  value       = aws_security_group.eks_sg.id
}
