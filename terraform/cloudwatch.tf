data "aws_cloudwatch_log_group" "strapi_logs" {
  name = "/ecs/strapi"
}
