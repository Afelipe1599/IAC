# variables.tf en el módulo ElastiCache

variable "cluster_id" {
  description = "ID del clúster ElastiCache."
  type        = string
}

variable "engine" {
  description = "Motor de ElastiCache (redis o memcached)."
  type        = string
  default     = "redis"
}

variable "node_type" {
  description = "Tipo de instancia para los nodos de ElastiCache."
  type        = string
}

variable "num_cache_nodes" {
  description = "Número de nodos en el clúster ElastiCache."
  type        = number
}

variable "parameter_group_name" {
  description = "Nombre del grupo de parámetros de ElastiCache."
  type        = string
  default     = "default.redis7"
}

variable "port" {
  description = "Puerto para acceder al clúster ElastiCache."
  type        = number
  default     = 6379
}

variable "subnet_ids" {
  description = "Lista de subnets donde ElastiCache será desplegado."
  type        = list(string)
}

variable "security_group_id" {
  description = "ID del Security Group para ElastiCache."
  type        = string
}

variable "tags" {
  description = "Etiquetas para los recursos."
  type        = map(string)
}
