# variables.tf en el módulo Cognito

variable "user_pool_name" {
  description = "Nombre del User Pool de Cognito"
  type        = string
}

variable "user_pool_client_name" {
  description = "Nombre del App Client en el User Pool de Cognito"
  type        = string
}

variable "generate_secret" {
  description = "Si el App Client de Cognito debe generar un secreto"
  type        = bool
  default     = false
}

variable "user_pool_domain" {
  description = "Dominio personalizado para el User Pool"
  type        = string
}

variable "identity_pool_name" {
  description = "Nombre del Identity Pool de Cognito"
  type        = string
}

variable "tags" {
  description = "Etiquetas para los recursos"
  type        = map(string)
}
