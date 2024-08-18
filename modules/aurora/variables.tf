# variables.tf en el módulo Aurora

variable "cluster_identifier" {
  description = "Identificador del clúster Aurora"
  type        = string
}

variable "database_name" {
  description = "Nombre de la base de datos"
  type        = string
}

variable "master_username" {
  description = "Nombre de usuario principal"
  type        = string
}

variable "master_password" {
  description = "Contraseña del usuario principal"
  type        = string
  sensitive   = true
}

variable "subnet_ids" {
  description = "Lista de IDs de las subnets donde se desplegará Aurora"
  type        = list(string)
}

variable "security_group_id" {
  description = "ID del Security Group para Aurora"
  type        = string
}

variable "proxy_role_arn" {
  description = "ARN del rol IAM para RDS Proxy"
  type        = string
}

variable "secret_arn" {
  description = "ARN del secreto que contiene las credenciales de la base de datos"
  type        = string
}

variable "tags" {
  description = "Etiquetas para los recursos"
  type        = map(string)
}
