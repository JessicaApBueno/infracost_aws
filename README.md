# 🚀 FinOps Hands-On: AWS Infrastructure with Infracost & Terraform

Este repositório contém um laboratório prático focado em **FinOps** e **Infraestrutura como Código (IaC)**. O objetivo é demonstrar como integrar a visibilidade de custos e emissões de carbono diretamente no ciclo de vida de desenvolvimento (Shift-Left), utilizando Terraform para provisionamento e Infracost para análise em tempo real dentro do GitHub Actions.

[![Dev.to](https://img.shields.io/badge/Dev.to-0A0A0A?style=for-the-badge&logo=devto&logoColor=white)](https://dev.to/jessicaapbueno/finops-hands-on-aws-costs-co-e-in-every-pr-with-infracost-terraform-4hjj)
[![Medium](https://img.shields.io/badge/Medium-12100E?style=for-the-badge&logo=medium&logoColor=white)](https://medium.com/@buenojessicaaparecida/finops-hands-on-custos-aws-co%E2%82%82e-em-todo-pr-com-infracost-terraform-760583674ecf)

---

## 🛠️ Tecnologias Utilizadas

*   **Terraform**: Orquestração de infraestrutura multicloud.
*   **Infracost**: Estimativas de custos de nuvem e emissões de CO2e para Terraform.
*   **AWS (Amazon Web Services)**: Provedor de nuvem utilizado.
*   **GitHub Actions**: Automação do pipeline de CI/CD.
*   **OIDC (OpenID Connect)**: Autenticação segura via Workload Identity Federation (sem chaves estáticas).

## 🏗️ Estrutura do Projeto

O projeto é modularizado para garantir escalabilidade e organização:
``

*   **`modules/network`**: Criação da VPC, Subnets e conectividade básica.
*   **`modules/compute`**: Instâncias EC2, Banco de Dados RDS (PostgreSQL) e S3 Buckets.
*   **`.github/workflows`**: Pipeline de automação com Infracost em 3 estágios (Baseline, Diff e Post-Comment).

## 🔒 Segurança

Este projeto utiliza **Workload Identity Federation (OIDC)** para se comunicar com a AWS. Isso elimina a necessidade de armazenar `AWS_ACCESS_KEY_ID` e `AWS_SECRET_ACCESS_KEY` no GitHub Secrets, utilizando tokens temporários e permissões granulares de IAM Role.

## 📊 Fluxo de Trabalho (FinOps)

Sempre que um **Pull Request** é aberto:
1.  O workflow captura o custo da infraestrutura atual na branch `main` (Baseline).
2.  Calcula a diferença de custo e impacto ambiental (Diff) com as novas alterações sugeridas.
3.  Posta uma tabela detalhada diretamente no PR, permitindo o ajuste de rota antes do deploy.

   <img width="1392" height="507" alt="Captura de tela 2026-05-01 211253" src="https://github.com/user-attachments/assets/4d7871a2-92f9-4aa0-84e7-362ada53b004" />



## 📝 Artigos Detalhados

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
