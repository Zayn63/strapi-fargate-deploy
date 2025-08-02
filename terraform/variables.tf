variable "security_group_id" {
  description = "ID of the security group to associate"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs to use"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID where the resources will be deployed"
  type        = string
}
