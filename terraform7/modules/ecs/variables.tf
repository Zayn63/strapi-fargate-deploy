https://chatgpt.com/g/g-B3hgivKK9-write-for-mevariable "subnets" {
  description = "Subnets for ECS tasks"
  type        = list(string)
}

variable "ecs_sg" {
  description = "Security group ID for ECS"
  type        = string
}

variable "target_group_arn" {
  description = "ARN of ALB Target Group"
  type        = string
}

variable "db_host" {
  description = "Database host"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_user" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}
