variable "user_pool_name" {
  description = "user pool name"
  type = string
}

variable "mfa_enabled" {
  type = bool
  description = "cognito bool"
}

variable "alias_attributes" {
  type = list(string)
  description = "aliases" 
}

variable "sms_authentication_message" {
  type = string
  description = "sms_authentication_message"
}

variable "schema" {
  type = list(map(string))
  description = "cognito schema"
}

variable "min_password_length" {
  type = number
  description = "password length"
}

variable "identity_providers" {
  type = list(object({
    provider_name = string
    provider_type = string
    provider_details = object({
      authorized_scopes = string
      client_id = string
      client_secret = string
    })
    attribute_mapping = object({
      email = string
      username = string
    })
  }))
  description = "identity provider for the cognito pool to support"
  default = []
}

variable "pool_clients" {
  type = list(object({
    name = string
    generate_secret = bool
    explicit_auth_flows = list(string) #allowed ADMIN_NO_SRP_AUTH, ALLOW_ADMIN_USER_PASSWORD_AUTH, ALLOW_CUSTOM_AUTH, ALLOW_USER_PASSWORD_AUTH, ALLOW_USER_SRP_AUTH,ALLOW_REFRESH_TOKEN_AUTH 
  }))
  description = "user pool clients"
}
variable "global_tags" {
  type = object({
    Author      = string
    Environment = string
    Provisioner = string
    Region      = string
  })
  description = "base tags required in every resource"
}
