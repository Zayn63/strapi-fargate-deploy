resource "aws_ecs_cluster" "zstrapi" {
  name = "zstrapi-cluster"
}

resource "aws_ecs_task_definition" "zstrapi" {
  family                   = "zstrapi-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn = data.aws_iam_role.ecs_task_execution_role.arn
  container_definitions = jsonencode([
    {
      name  = "zstrapi"
      image = "zayn63/strapi:latest"
      portMappings = [
        {
          containerPort = 1337
          hostPort      = 1337
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = aws_cloudwatch_log_group.zstrapi_logs.name
          awslogs-region        = var.aws_region
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])
}

resource "aws_ecs_service" "zstrapi" {
  name            = "zstrapi-service"
  cluster         = aws_ecs_cluster.zstrapi.id
  task_definition = aws_ecs_task_definition.zstrapi.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = var.subnet_ids
    security_groups = [var.security_group_id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.zstrapi_tg.arn
    container_name   = "zstrapi"
    container_port   = 1337
  }

  depends_on = [aws_lb_listener.zstrapi_listener]
}

