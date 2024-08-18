# variables.tf en el módulo CloudFront

variable "s3_bucket_domain_name" {
  description = "El dominio del bucket S3 que servirá como origen para CloudFront."
  type        = string
}

variable "origin_id" {
  description = "ID del origen para CloudFront."
  type        = string
}

variable "tags" {
  description = "Etiquetas para los recursos."
  type        = map(string)
}
