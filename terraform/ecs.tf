# Reference existing ECS Cluster
data "aws_ecs_cluster" "strapi_cluster" {
  cluster_name = "strapi-cluster"
}

# Reference existing ALB
data "aws_lb" "strapi_alb" {
  name = "strapi-alb"
}

# Reference existing Target Group
data "aws_lb_target_group" "strapi_tg" {
  name = "strapi-tg"
}

# Reference existing IAM Role
 "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole"
}

# Reference existing CloudWatch log group
data "aws_cloudwatch_log_group" "strapi_logs" {
  name = "/ecs/strapi"
}

# ECS Task Definition
resource "aws_ecs_task_definition" "strapi_task" {
  family                   = "strapi-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "512"
  memory                   = "1024"
  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn


  container_definitions = jsonencode([{
    name  = "strapi"
    image = var.image_url
    portMappings = [{
      containerPort = 1337
      hostPort      = 1337
    }],
    logConfiguration = {
      logDriver = "awslogs",
      options = {
        awslogs-group         = data.aws_cloudwatch_log_group.strapi_logs.name,
        awslogs-region        = var.aws_region,
        awslogs-stream-prefix = "strapi"
      }
    }
  }])
}

# ECS Service
resource "aws_ecs_service" "strapi_service" {
  name            = "strapi-service"
  cluster         = data.aws_ecs_cluster.strapi_cluster.id
  task_definition = aws_ecs_task_definition.strapi_task.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets         = var.subnet_ids
    security_groups = [var.security_group_id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = data.aws_lb_target_group.strapi_tg.arn
    container_name   = "strapi"
    container_port   = 1337
  }

  depends_on = [aws_ecs_task_definition.strapi_task]
}
