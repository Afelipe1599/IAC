# outputs.tf en el módulo S3 Bucket

output "bucket_domain_name" {
  description = "El nombre de dominio del bucket S3."
  value       = aws_s3_bucket.bucket.bucket_domain_name
}
