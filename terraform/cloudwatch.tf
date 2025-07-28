resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = "HighCPUUtilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = 60
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "This metric monitors high CPU usage"
  actions_enabled     = false

  dimensions = {
    ClusterName = aws_ecs_cluster.strapi.name
    ServiceName = aws_ecs_service.strapi.name
  }
}

resource "aws_cloudwatch_log_group" "strapi_logs" {
  name              = "/ecs/strapi"
  retention_in_days = 7
}

resource "aws_cloudwatch_metric_alarm" "memory_alarm" {
  alarm_name          = "HighMemoryUtilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = 60
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "This metric monitors high memory usage"
  actions_enabled     = false

  dimensions = {
    ClusterName = aws_ecs_cluster.strapi.name
    ServiceName = aws_ecs_service.strapi.name
  }
}
