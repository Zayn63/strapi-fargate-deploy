resource "aws_cloudwatch_log_group" "strapi" {
  name              = "/ecs/strapi"
  retention_in_days = 7
}

resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "strapi-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = 60
  statistic           = "Average"
  threshold           = 70

  dimensions = {
    ClusterName = aws_ecs_cluster.strapi.name
    ServiceName = aws_ecs_service.strapi.name
  }

  alarm_description = "Triggered when ECS CPU usage exceeds 70%"
}

resource "aws_cloudwatch_metric_alarm" "high_memory" {
  alarm_name          = "strapi-high-memory"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = 60
  statistic           = "Average"
  threshold           = 80

  dimensions = {
    ClusterName = aws_ecs_cluster.strapi.name
    ServiceName = aws_ecs_service.strapi.name
  }

  alarm_description = "Triggered when ECS memory usage exceeds 80%"
}
