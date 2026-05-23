# Azure Terraform Enterprise Landing Zone

## Goal

Build an enterprise Azure landing zone with repeatable Terraform modules for networking, identity, security, logging, and shared services.

## Azure Services

- Azure Virtual Network
- Azure Firewall
- Azure Bastion
- Azure Key Vault
- Azure Monitor
- Log Analytics Workspace
- Azure Policy
- Managed Identity

## DevOps Skills Demonstrated

- Infrastructure as Code with Terraform
- Remote state design
- Modular cloud architecture
- Environment separation
- Security baseline automation
- Azure governance

## Suggested Structure

```text
modules/
  networking/
  security/
  monitoring/
  key-vault/
envs/
  dev/
  stage/
  prod/
.github/workflows/
```

## Commands

```powershell
terraform init
terraform validate
terraform plan
terraform apply
```

