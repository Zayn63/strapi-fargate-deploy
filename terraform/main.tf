provider "aws" {
  region = var.aws_region
}

resource "aws_ecs_cluster" "strapi_cluster" {
  name = "strapi-cluster"
}

/* Add more resources here like task definition, service, security groups, etc.
   Let me know if you'd like me to generate that full code again. */
