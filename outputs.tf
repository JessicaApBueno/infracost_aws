output "web_server_ip" {
  description = "IP Público do servidor criado na AWS"
  value       = module.compute.ec2_public_ip
}

output "database_endpoint" {
  description = "Endereço de conexão do RDS"
  value       = module.compute.rds_endpoint
}

output "bucket_name" {
  description = "Nome do bucket S3 gerado"
  value       = module.compute.s3_bucket_name
}