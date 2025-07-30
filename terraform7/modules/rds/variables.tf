variable "subnet_ids" {
  description = "List of subnet IDs for RDS"
  type        = list(string)
}

variable "db_sg" {
  description = "Security group ID for RDS"
  type        = string
}

variable "db_name" {
  description = "Name of the database"
  type        = string
}

variable "db_user" {
  description = "Master username for the database"
  type        = string
}

variable "db_password" {
  description = "Master password for the database"
  type        = string
  sensitive   = true
}
