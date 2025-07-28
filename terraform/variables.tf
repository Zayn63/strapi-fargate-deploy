variable "aws_region" {
  default = "eu-north-1"
}

variable "vpc_id" {
  default = "vpc-065cf6d69ad9fbf22"
}

variable "subnet_ids" {
  type    = list(string)
  default = ["subnet-086c3ae98cdde3671", "subnet-0da2d6106d23b40c7"]
}

variable "strapi_image" {
  default = "zayn63/strapi:latest"
}

variable "key_name" {
  default = "zayn-key"
}
