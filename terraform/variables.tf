variable "aws_region" {
  default = "eu-north-1"
}

variable "vpc_id" {
  default = "vpc-065cf6d69ad9fbf22"
}

variable "subnet_ids" {
  description = "List of subnet IDs for ECS tasks"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security Group ID for ECS tasks"
  type        = string
}


variable "strapi_image" {
  default = "zayn63/strapi:latest"
}

variable "key_name" {
  default = "zayn-key"
}
