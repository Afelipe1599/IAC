resource "aws_cognito_user_pool" "user_pool" {
  name = var.user_pool_name

  password_policy {
    minimum_length    = 8
    require_uppercase = true
    require_lowercase = true
    require_numbers   = true
    require_symbols   = true
  }

  auto_verified_attributes = ["email"]

  # Tags here are fine
  tags = var.tags
}

resource "aws_cognito_user_pool_client" "user_pool_client" {
  name         = var.user_pool_client_name
  user_pool_id = aws_cognito_user_pool.user_pool.id

  explicit_auth_flows = ["ALLOW_USER_SRP_AUTH", "ALLOW_REFRESH_TOKEN_AUTH"]

  generate_secret = var.generate_secret

}

resource "aws_cognito_user_pool_domain" "user_pool_domain" {
  domain       = var.user_pool_domain
  user_pool_id = aws_cognito_user_pool.user_pool.id

  # Remove tags here
}

resource "aws_cognito_identity_pool" "identity_pool" {
  identity_pool_name               = var.identity_pool_name
  allow_unauthenticated_identities = false

  cognito_identity_providers {
    client_id   = aws_cognito_user_pool_client.user_pool_client.id
    provider_name = aws_cognito_user_pool.user_pool.endpoint
  }

  # Remove tags here
}
