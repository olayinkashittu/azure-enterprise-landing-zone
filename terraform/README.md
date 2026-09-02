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
