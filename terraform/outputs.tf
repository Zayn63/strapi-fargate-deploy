output "strapi_url" {
  value = aws_lb.zstrapi_alb.dns_name
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.zstrapi.name
}

output "log_group_name" {
  value = aws_cloudwatch_log_group.zstrapi_logs.name
}
