# variables.tf
# variables.tf

variable "fargate_profile_name" {
  description = "Nombre del perfil de Fargate en EKS."
  type        = string
}

variable "cluster_name" {
  description = "Nombre del clúster EKS."
  type        = string
}

variable "cluster_role_arn" {
  description = "ARN del rol IAM para el clúster EKS."
  type        = string
}

variable "subnet_ids" {
  description = "Lista de IDs de las subnets donde se desplegará EKS."
  type        = list(string)
}

variable "security_group" {
  description = "ID del Security Group para EKS."
  type        = string
}

variable "node_role_arn" {
  description = "ARN del rol IAM para los pods en Fargate."
  type        = string
}

variable "node_group_name" {
  description = "Nombre del grupo de nodos en EKS."
  type        = string
}

variable "desired_capacity" {
  description = "Capacidad deseada del grupo de nodos."
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Tamaño máximo del grupo de nodos."
  type        = number
  default     = 3
}

variable "min_size" {
  description = "Tamaño mínimo del grupo de nodos."
  type        = number
  default     = 1
}

variable "instance_types" {
  description = "Lista de tipos de instancias para los nodos EKS."
  type        = list(string)
  default     = ["t3.medium"]
}

variable "namespace" {
  description = "Namespace en EKS donde los pods serán desplegados."
  type        = string
  default     = "default"
}
