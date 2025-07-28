output "ecs_cluster_name" {
  value = aws_ecs_cluster.strapi.name
}

output "ecs_service_name" {
  value = aws_ecs_service.strapi.name
}

output "log_group_name" {
  value = aws_cloudwatch_log_group.strapi_logs.name
}
