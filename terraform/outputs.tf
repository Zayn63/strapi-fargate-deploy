output "alb_dns" {
  value = data.aws_lb.strapi_alb.dns_name
}

output "ecs_cluster_name" {
  value = data.aws_ecs_cluster.strapi_cluster.cluster_name
}

output "log_group_name" {
  value = data.aws_cloudwatch_log_group.strapi_logs.name
}
