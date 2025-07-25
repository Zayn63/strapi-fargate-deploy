output "ecs_cluster_name" {
  value = aws_ecs_cluster.strapi_cluster.name
}

output "strapi_app_url" {
  value = "http://${aws_lb.strapi_alb.dns_name}"
}
