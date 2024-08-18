# outputs.tf en el módulo Secrets Manager

output "db_secret_arn" {
  description = "ARN del secreto de la base de datos"
  value       = aws_secretsmanager_secret.db_credentials.arn
}
