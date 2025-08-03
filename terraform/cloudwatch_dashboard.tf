resource "aws_cloudwatch_dashboard" "strapi_dashboard" {
  dashboard_name = "StrapiServiceDashboard"
  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric",
        x    = 0,
        y    = 0,
        width = 12,
        height = 6,
        properties = {
          metrics = [
            [ "AWS/ECS", "CPUUtilization", "ClusterName", aws_ecs_cluster.strapi_cluster.name, "ServiceName", aws_ecs_service.strapi_service.name ],
            [ ".", "MemoryUtilization", ".", ".", ".", "." ]
          ],
          view    = "timeSeries",
          stacked = false,
          region  = "eu-north-1",
          title   = "CPU & Memory Utilization"
        }
      }
    ]
  })
}
