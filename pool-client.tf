resource "aws_cognito_user_pool_client" "default" {
  count = length(var.pool_clients)
  name = var.pool_clients[count.index].name

  user_pool_id = aws_cognito_user_pool.default.id

  generate_secret     = var.pool_clients[count.index].generate_secret
  explicit_auth_flows = var.pool_clients[count.index].explicit_auth_flows
}