output "user_pool_id" {
  value = aws_cognito_user_pool.default.id
  description = "cognito pool id"
}

output "user_pool_arn" {
  value = aws_cognito_user_pool.default.arn
  description = "cognito pool arn"
}

output "pool_client_id" {
  value = aws_cognito_user_pool_client.default.*.id
  description = "cognito pool client id"
}

output "pool_client_secret" {
  value = aws_cognito_user_pool_client.default.*.id
  description = "cognito pool client id"
}