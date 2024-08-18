# main.tf

module "secretsmanager" {
  source = "./modules/secretsmanager"
  # Define las variables necesarias para manejar los secretos
}