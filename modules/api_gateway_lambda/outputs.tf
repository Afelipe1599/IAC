# outputs.tf en el módulo API Gateway y Lambda

output "api_gateway_invoke_url" {
  description = "URL para invocar el API Gateway"
  value       = "${aws_api_gateway_rest_api.api_gateway.execution_arn}/stage"
}

output "lambda_function_arn" {
  description = "ARN de la función Lambda"
  value       = aws_lambda_function.lambda_function.arn
}
