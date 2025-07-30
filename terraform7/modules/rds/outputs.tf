output "db_endpoint" {
  value = aws_db_instance.strapi_db.address
}

output "db_name" {
  value = aws_db_instance.strapi_db.db_name
}
