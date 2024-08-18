# variables.tf en el módulo API Gateway y Lambda

variable "lambda_function_name" {
  description = "Nombre de la función Lambda."
  type        = string
}

variable "lambda_handler" {
  description = "Handler de la función Lambda."
  type        = string
}

variable "lambda_runtime" {
  description = "Runtime de la función Lambda."
  type        = string
}

variable "lambda_role_arn" {
  description = "ARN del rol IAM para la función Lambda."
  type        = string
}

variable "lambda_s3_filename" {
  description = "Nombre del archivo ZIP que contiene el código Lambda."
  type        = string
}

variable "lambda_s3_bucket" {
  description = "Nombre del bucket S3 donde se almacena el código Lambda."
  type        = string
}

variable "lambda_s3_key" {
  description = "Clave S3 del archivo ZIP que contiene el código Lambda."
  type        = string
}

variable "lambda_source_code_hash" {
  description = "Hash del código fuente de la función Lambda."
  type        = string
}

variable "lambda_environment_variables" {
  description = "Variables de entorno para la función Lambda."
  type        = map(string)
  default     = {}
}

variable "api_gateway_name" {
  description = "Nombre del API Gateway."
  type        = string
}

variable "api_gateway_description" {
  description = "Descripción del API Gateway."
  type        = string
}

variable "api_gateway_resource_path" {
  description = "Ruta del recurso en el API Gateway."
  type        = string
}

variable "tags" {
  description = "Etiquetas para los recursos."
  type        = map(string)
}
