data "aws_lb" "strapi_alb" {
  name = "strapi-alb"
}

data "aws_lb_target_group" "strapi_tg" {
  name = "strapi-tg"
}

data "aws_lb_listener" "http" {
  load_balancer_arn = data.aws_lb.strapi_alb.arn
  port              = 80
}

