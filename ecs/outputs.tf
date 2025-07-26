output "service_name" {
  value = aws_ecs_service.strapi_service.name
}

output "cluster_name" {
  value = aws_ecs_cluster.ecs.name
}
