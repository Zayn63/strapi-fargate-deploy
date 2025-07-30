resource "aws_db_subnet_group" "strapi_db_subnet_group" {
  name       = "strapi-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "strapi-db-subnet-group"
  }
}

resource "aws_db_instance" "strapi_db" {
  identifier         = "strapi-db"
  allocated_storage  = 20
  storage_type       = "gp2"
  engine             = "postgres"
  engine_version     = "14.3"
  instance_class     = "db.t3.micro"
  username           = var.db_user
  password           = var.db_password
  db_name            = var.db_name
  port               = 5432
  publicly_accessible = true

  db_subnet_group_name = aws_db_subnet_group.strapi_db_subnet_group.name
  vpc_security_group_ids = [var.db_sg]

  skip_final_snapshot = true
  deletion_protection = false

  tags = {
    Name = "strapi-db"
  }
}
