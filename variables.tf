variable "aws_region" {
  description = "Região da AWS"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Tipo da instância EC2 para o servidor web"
  type        = string
}

variable "db_instance_class" {
  description = "Classe da instância para o RDS"
  type        = string
}

variable "rds_multi_az" {
  description = "Habilitar Multi-AZ para o banco de dados"
  type        = bool
}