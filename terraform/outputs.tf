output "alb_dns" {
  value = aws_lb.strapi_alb.dns_name
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.strapi_cluster.name
}
