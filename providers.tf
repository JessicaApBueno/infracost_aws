terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

  # O bloco default_tags aplica essas etiquetas a TODOS os recursos 
  # criados por este provider automaticamente.
  default_tags {
    tags = {
      Project     = "FinOps-Infracost-Study"
      Owner       = "CommunityBuilder"
      ManagedBy   = "Terraform"
      # Novas tags para satisfazer as políticas de FinOps:
      Environment = "Dev"
      Service     = "FinOps-Project"
    }
  }
}