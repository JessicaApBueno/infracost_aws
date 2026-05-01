output "ec2_public_ip" {
  description = "IP Público da EC2 (se houver)"
  value       = aws_instance.web_server.public_ip
}

output "rds_endpoint" {
  description = "Endpoint do banco de dados"
  value       = aws_db_instance.database.endpoint
}

output "s3_bucket_name" {
  value = aws_s3_bucket.assets.id
}