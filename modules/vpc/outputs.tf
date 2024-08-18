# outputs.tf en el módulo VPC

output "private_subnets" {
  description = "IDs de las subnets privadas"
  value       = [aws_subnet.private_1.id, aws_subnet.private_2.id]
}

output "public_subnets" {
  description = "IDs de las subnets públicas"
  value       = [aws_subnet.public_1.id, aws_subnet.public_2.id]
}

# outputs.tf en el módulo VPC

output "vpc_id" {
  description = "ID de la VPC"
  value       = aws_vpc.main.id
}
