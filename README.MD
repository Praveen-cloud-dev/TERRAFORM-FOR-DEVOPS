# Terraform Hands-On

## Overview
This repository contains hands-on exercises and examples for learning Terraform, an Infrastructure as Code (IaC) tool.

## Prerequisites
- Terraform installed ([Download](https://www.terraform.io/downloads.html))
- Cloud provider credentials (AWS, Azure, GCP, etc.)
- Basic command-line knowledge

## Getting Started
1. Clone or navigate to this directory
2. Initialize Terraform: `terraform init`
3. Review configuration files
4. Plan changes: `terraform plan`
5. Apply configuration: `terraform apply`

## Structure
- `main.tf` - Primary configuration
- `variables.tf` - Variable definitions
- `outputs.tf` - Output values
- `terraform.tfvars` - Variable values

## Common Commands
```bash
terraform init      # Initialize working directory
terraform plan      # Preview changes
terraform apply     # Apply configuration
terraform destroy   # Remove resources
terraform validate  # Validate configuration
```

## Resources
- [Terraform Documentation](https://www.terraform.io/docs)
- [Official Registry](https://registry.terraform.io)

## Notes
Update provider and variable configurations as needed for your environment.