# 1. Security Group para a EC2
resource "aws_security_group" "ec2_sg" {
  name        = "ec2-security-group"
  description = "Permite trafego do ALB"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 2. Instancia EC2 (Na Private Subnet)
resource "aws_instance" "web_server" {
  ami                    = "ami-0c7217cdde317cfec" # Amazon Linux 2023 em us-east-1
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = { Name = "finops-web-server" }
}

# 3. Banco de Dados RDS (O "peso pesado" do FinOps)
resource "aws_db_instance" "database" {
  allocated_storage    = 20
  db_name              = "finopsdb"
  engine               = "postgres"
  engine_version       = "16.1"
  instance_class       = var.db_instance_class
  username             = "admin"
  password             = "mudar_em_producao_123"
  skip_final_snapshot  = true
  multi_az             = var.rds_multi_az
  db_subnet_group_name = aws_db_subnet_group.main.name

  tags = { Name = "finops-rds" }
} # <--- Chave de fechamento do RDS restaurada

# 4. Subnet Group (Referenciado no RDS)
resource "aws_db_subnet_group" "main" {
  name       = "main-db-subnet-group"
  subnet_ids = [var.private_subnet_id, var.public_subnet_id]

  tags = { Name = "db-subnet-group" }
}

# 5. Bucket S3 (Armazenamento de objetos)
resource "aws_s3_bucket" "assets" {
  bucket        = "finops-project-assets-${random_id.suffix.hex}"
  force_destroy = true
}

# 6. Gerador de sufixo aleatório para o Bucket (Garante nome único global)
resource "random_id" "suffix" {
  byte_length = 4
}