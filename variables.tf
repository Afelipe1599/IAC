# variables.tf en la raíz

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  default = "cfn-workshop-vpc"
}

variable "availability_zones" {
  default = ["us-east-1a", "us-east-1b"]
}

variable "public_subnet_1_cidr" {
  default = "10.0.0.0/24"
}

variable "public_subnet_2_cidr" {
  default = "10.0.1.0/24"
}

variable "private_subnet_1_cidr" {
  default = "10.0.2.0/23"
}

variable "private_subnet_2_cidr" {
  default = "10.0.4.0/23"
}
