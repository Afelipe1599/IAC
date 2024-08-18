# outputs.tf en el módulo CloudFront

output "cloudfront_domain_name" {
  description = "El dominio asignado a la distribución de CloudFront."
  value       = aws_cloudfront_distribution.distribution.domain_name
}
