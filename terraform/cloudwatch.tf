resource "aws_cloudwatch_log_group" "zstrapi_logs" {
  name              = "/ecs/zstrapi"
  retention_in_days = 7
}
