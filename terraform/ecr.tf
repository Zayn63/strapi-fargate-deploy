resource "aws_ecr_repository" "strapi_repo" {
  name = var.ecr_repo_name
}
