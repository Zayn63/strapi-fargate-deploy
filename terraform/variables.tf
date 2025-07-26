variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-north-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
  default     = ["subnet-086c3ae98cdde3671", "subnet-0da2d6106d23b40c7"]
}

variable "docker_image" {
  description = "Docker image for the Strapi app"
  type        = string
  default     = "zayn63/strapi:latest"
}
