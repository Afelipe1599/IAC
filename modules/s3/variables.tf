# variables.tf en el módulo S3 Bucket

variable "bucket_name" {
  description = "El nombre del bucket S3."
  type        = string
}

variable "acl" {
  description = "La política de acceso al bucket (por defecto: privado)."
  type        = string
  default     = "private"
}

variable "versioning_enabled" {
  description = "Si el versionado de objetos en el bucket S3 está habilitado."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Etiquetas para los recursos."
  type        = map(string)
}
