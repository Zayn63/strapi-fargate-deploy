variable "aws_region" {
  default = "eu-north-1"
}

variable "image_url" {
  default = "zayn63/strapi:latest"
}

variable "db_name" {
  default = "strapi"
}

variable "db_user" {
  default = "admin"
}

variable "db_password" {
  default = "StrapiPass123!" # Store securely in CI/CD secrets
}
