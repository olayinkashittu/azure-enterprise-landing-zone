# Terraform Infrastructure as Code

## Overview

This directory contains the Terraform configuration for the NovaSol Enterprise Azure Landing Zone project.

The configuration is designed to support a governed Azure environment using Infrastructure as Code (IaC).

## Terraform Files

| File | Purpose |
|---|---|
| `main.tf` | Configures Terraform and the Azure provider |
| `variables.tf` | Defines reusable project configuration variables |
| `outputs.tf` | Defines useful Terraform output values |

## Configuration

The Terraform configuration currently defines the following project settings:

| Variable | Example Value |
|---|---|
| `project_name` | `NovaSol` |
| `environment` | `Production` |
| `location` | `West Europe` |
| `owner` | `CloudTeam` |
| `department` | `IT` |
| `cost_center` | `IT-001` |

## Environment Configuration

Terraform variables can be provided through a `.tfvars` file.

A sample production configuration is provided as:

`production.tfvars.example`

To create a local production configuration:

```powershell
Copy-Item production.tfvars.example production.tfvars

## Architecture Alignment

The Terraform configuration supports the overall Azure Enterprise Landing Zone design documented in this repository.

The target architecture includes:

```bash
Tenant Root
    │
    ▼
NovaSol Enterprise
    │
    ├── Platform
    │   ├── Management
    │   └── Security
    │
    ├── Landing Zones
    │   ├── Corp
    │   └── Online
    │
    └── Sandbox
            │
            ▼
      Azure Subscriptions
            │
            ▼
       Resource Groups
            │
            ▼
       Azure Workloads
```

### Infrastructure as Code Principles

The Terraform implementation follows these principles:

- Reusable configuration
- Consistent naming
- Parameterized variables
- Infrastructure as Code
- Version-controlled infrastructure
- Separation of configuration and deployment
- Alignment with Azure governance requirements
- Least-privilege access
- Cost-conscious deployment

### Current Status

The Terraform configuration currently provides the foundation for the Azure Landing Zone implementation.

No Azure resources are deployed by this documentation-only stage.

### Future Implementation

Future Terraform development may include:

- Resource groups
- Azure Policy assignments
- Role-based access control
- Networking resources
- Log Analytics
- Monitoring configuration
- Diagnostic settings
- Additional landing-zone governance components

Any actual Azure deployment will be performed only after validating the Terraform configuration and confirming the required Azure subscription and cost implications.
