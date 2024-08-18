# variables.tf

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
}

variable "availability_zones" {
  description = "List of Availability Zones."
  type        = list(string)
}

variable "public_subnet_1_cidr" {
  description = "CIDR block for the public subnet 1."
  type        = string
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for the public subnet 2."
  type        = string
}

variable "private_subnet_1_cidr" {
  description = "CIDR block for the private subnet 1."
  type        = string
}

variable "private_subnet_2_cidr" {
  description = "CIDR block for the private subnet 2."
  type        = string
}
