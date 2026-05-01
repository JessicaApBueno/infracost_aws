variable "vpc_id" {
  description = "ID da VPC onde os recursos serão criados"
  type        = string
}

variable "private_subnet_id" {
  description = "ID da subnet privada para EC2 e RDS"
  type        = string
}

variable "public_subnet_id" {
  description = "ID da subnet pública (necessária para o DB Subnet Group)"
  type        = string
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
  default     = "t3.micro"
}

variable "db_instance_class" {
  description = "Classe da instância do RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "rds_multi_az" {
  description = "Habilitar Multi-AZ para o RDS"
  type        = bool
  default     = false
}