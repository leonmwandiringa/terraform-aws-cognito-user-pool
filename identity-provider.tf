resource "aws_cognito_identity_provider" "default" {
  count = length(var.var.identity_providers)
  user_pool_id  = aws_cognito_user_pool.default.id
  provider_name = var.identity_providers[count.index].provider_name
  provider_type = var.identity_providers[count.index].provider_type

  provider_details = {
    authorize_scopes = var.identity_providers[count.index].provider_details.authorize_scopes
    client_id        = var.identity_providers[count.index].provider_details.client_id
    client_secret    = var.identity_providers[count.index].provider_details.client_secret
  }

  attribute_mapping = {
    email    = var.identity_providers[count.index].attribute_mapping.email
    username = var.identity_providers[count.index].attribute_mapping.username
  }
}