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

  # Uma boa prática de arquiteto é taguear tudo!
  # Isso ajuda muito em FinOps para identificar de onde vem o custo.
  default_tags {
    tags = {
      Project   = "FinOps-Infracost-Study"
      Owner     = "CommunityBuilder"
      ManagedBy = "Terraform"
    }
  }
}