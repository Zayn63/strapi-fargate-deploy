variable "aws_region" {
  default = "eu-north-1"
}

variable "ecr_repo_name" {
  default = "strapi-fargate"
}

variable "subnet_ids" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}
