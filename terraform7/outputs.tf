output "strapi_url" {
  value = module.ecs.strapi_url
}

output "db_endpoint" {
  value = module.rds.db_endpoint
}

output "cloudwatch_log_group" {
  value = module.cloudwatch.log_group
}
