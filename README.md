
# FinOps Hands-On: Custos AWS + CO₂e em Todo PR com Infracost & Terraform

[![Dev.to](https://img.shields.io/badge/Dev.to-0A0A0A?style=for-the-badge&logo=devto&logoColor=white)](https://dev.to/jessicaapbueno/finops-hands-on-aws-costs-co-e-in-every-pr-with-infracost-terraform-4hjj)
[![Medium](https://img.shields.io/badge/Medium-12100E?style=for-the-badge&logo=medium&logoColor=white)](https://medium.com/@buenojessicaaparecida/finops-hands-on-custos-aws-co%E2%82%82e-em-todo-pr-com-infracost-terraform-760583674ecf)


Este repositório contém um laboratório prático de **FinOps na AWS** usando **Terraform**, **GitHub Actions** e **Infracost**.

A proposta é trazer visibilidade de custos para mais perto do desenvolvimento, permitindo que cada Pull Request mostre o impacto financeiro da mudança antes do deploy.

## Objetivo

O projeto demonstra como integrar:

- **Terraform** para provisionamento de infraestrutura.
- **Infracost** para estimativa de custos antes da implantação.
- **GitHub Actions** para automação do fluxo de CI/CD.
- **OIDC** para autenticação segura na AWS sem chaves de longa duração.
- **Tags padronizadas** para governança e rastreabilidade.
- **CO₂e** como apoio a decisões mais sustentáveis.

## Arquitetura

A infraestrutura está organizada em módulos:

- `modules/network`: cria a base de rede com VPC, subnets e componentes de conectividade.
- `modules/compute`: cria os recursos de aplicação e banco.
- `.github/workflows/infracost.yml`: executa o fluxo de custo no Pull Request.
- `providers.tf`: define o provider AWS e os `default_tags`.
- `main.tf`: faz a orquestração entre os módulos.
- `variables.tf` e `terraform.tfvars`: separam contrato e valores.

## Fluxo do projeto

1. Um Pull Request é aberto no GitHub.
2. O GitHub Actions executa o Terraform plan.
3. O Infracost calcula o custo estimado da mudança.
4. O resultado é publicado como comentário no PR.
5. O time consegue avaliar custo e impacto antes do merge.

## Estrutura do repositório

```bash
infracost_aws/
├── .github/
│   └── workflows/
│       └── infracost.yml
├── modules/
│   ├── network/
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── compute/
│       ├── recursos.tf
│       ├── outputs.tf
│       └── variables.tf
├── main.tf
├── outputs.tf
├── providers.tf
├── terraform.tfvars
├── variables.tf
└── README.md
```

## Pré-requisitos

- Conta na AWS.
- Repositório no GitHub.
- Terraform instalado.
- Conta no Infracost e API key configurada como secret.
- Configuração de OIDC entre GitHub Actions e AWS.

## Como usar

### 1. Configure as variáveis

Ajuste o arquivo `terraform.tfvars` conforme seu ambiente:

```hcl
aws_region        = "us-east-1"
instance_type     = "c6g.2xlarge"
db_instance_class = "db.t4g.medium"
```

### 2. Inicialize o Terraform

```bash
terraform init
```

### 3. Verifique o plano

```bash
terraform plan
```

### 4. Aplique a infraestrutura

```bash
terraform apply
```

### 5. Configure o GitHub Actions

Garanta que os secrets e permissões estejam definidos para o workflow do Infracost funcionar corretamente.

## Boas práticas aplicadas

- `default_tags` no provider para padronização e rastreabilidade.
- Separação entre `variables.tf` e `terraform.tfvars`.
- Modularização da infraestrutura.
- Uso de OIDC em vez de credenciais permanentes.
- Estimativa de custos antes do merge.

## Recursos principais

- EC2
- RDS PostgreSQL
- S3

## Observações

- A senha do RDS não deve ficar hardcoded em ambientes reais.
- Em produção, use AWS Secrets Manager ou outro gerenciador de segredos.
- Ajuste as classes de instância conforme sua necessidade de custo e performance.

## Artigo relacionado

Para um guia passo a passo sobre como replicar este laboratório, acesse os artigos:

*   [Versão em Português (Medium)](https://medium.com/@buenojessicaaparecida/finops-hands-on-custos-aws-co%E2%82%82e-em-todo-pr-com-infracost-terraform-760583674ecf)
*   [Versão em Inglês (Dev.to)](https://dev.to/jessicaapbueno/finops-hands-on-aws-costs-co-e-in-every-pr-with-infracost-terraform-4hjj)


---
## Resultado

### No terminal:

<img width="1905" height="918" alt="Captura de tela 2026-05-01 204233" src="https://github.com/user-attachments/assets/480ace1f-36c0-4d13-8cd8-e0c87d25fe26" />

### No PR

<img width="903" height="887" alt="Captura de tela 2026-05-01 204807" src="https://github.com/user-attachments/assets/2d409802-fb5c-4bdc-b80a-9a2aad56a473" />

<img width="776" height="449" alt="image" src="https://github.com/user-attachments/assets/0449653b-a82d-4732-99d1-fb9c8d6600d6" />


**Desenvolvido por Jessica Aparecida Bueno.**
---
## Licença

Projeto educacional e de estudo.
