# outputs.tf en el módulo Cognito

output "user_pool_id" {
  description = "ID del User Pool de Cognito"
  value       = aws_cognito_user_pool.user_pool.id
}

output "user_pool_client_id" {
  description = "ID del App Client en el User Pool de Cognito"
  value       = aws_cognito_user_pool_client.user_pool_client.id
}

output "identity_pool_id" {
  description = "ID del Identity Pool de Cognito"
  value       = aws_cognito_identity_pool.identity_pool.id
}
