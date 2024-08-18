# variables.tf en el módulo Network Load Balancer

variable "name" {
  description = "Nombre del Network Load Balancer"
  type        = string
}

variable "subnet_ids" {
  description = "Lista de IDs de las subnets donde se desplegará el NLB"
  type        = list(string)
}

variable "vpc_id" {
  description = "ID de la VPC donde se desplegará el NLB"
  type        = string
}

variable "target_group_name" {
  description = "Nombre del grupo de destino para el NLB"
  type        = string
}

variable "port" {
  description = "Puerto de destino del grupo"
  type        = number
}

variable "listener_port" {
  description = "Puerto donde el listener del NLB escuchará"
  type        = number
}

variable "tags" {
  description = "Etiquetas para los recursos"
  type        = map(string)
}
