terraform {
  backend "s3" {
    bucket         = "strapi-terraform-state-zayn"
    key            = "state/strapi.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
