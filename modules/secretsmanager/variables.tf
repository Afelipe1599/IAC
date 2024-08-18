# variables.tf en el módulo Secrets Manager

variable "secret_name" {
  description = "Nombre del secreto en Secrets Manager"
  type        = string
}

variable "db_username" {
  description = "Nombre de usuario para la base de datos"
  type        = string
}

variable "db_password" {
  description = "Contraseña para la base de datos"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Etiquetas para los recursos"
  type        = map(string)
}
