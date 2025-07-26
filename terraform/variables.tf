variable "image_tag" {
  type        = string
  description = "Docker image tag for ECS deployment"
  default     = "latest"
}

variable "image_repo" {
  type        = string
  default     = "zayn63/strapi"
  description = "Docker image repository"
}
