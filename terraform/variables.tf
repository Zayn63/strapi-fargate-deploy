variable "vpc_id" {
  default = "vpc-065cf6d69ad9fbf22"
}

variable "subnet_ids" {
  type    = list(string)
  default = ["subnet-086c3ae98cdde3671", "subnet-0da2d6106d23b40c7"]
}

variable "security_group_id" {
  default = "sg-0449336e4644cdbb3"
}

variable "docker_image" {
  default = "zayn63/strapi:latest"
}
