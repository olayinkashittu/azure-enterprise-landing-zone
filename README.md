# Azure Enterprise Landing Zone — NovaSol Enterprise

A governed Azure Enterprise Landing Zone architecture and implementation project designed for NovaSol Enterprise.

## Project Overview

This project demonstrates the design and implementation of a governed Azure Enterprise Landing Zone for a fictional organization.

The architecture focuses on centralized governance, security, identity, resource organization, monitoring, and Infrastructure as Code.

## Organization

**Organization:** NovaSol Enterprise

**Environment:** Azure Cloud

**Testing Domain:** novasol.test

## Project Objectives

- Design a scalable Azure management-group hierarchy
- Define an enterprise subscription strategy
- Implement Azure Policy and governance controls
- Design Role-Based Access Control (RBAC)
- Establish Azure resource naming conventions
- Implement resource tagging standards
- Design security and monitoring controls
- Define workload isolation between environments
- Implement Infrastructure as Code using Terraform
- Document architectural decisions and implementation steps

## Architecture Scope

The landing zone will include:

- Management Groups
- Azure Subscriptions
- Resource Groups
- Microsoft Entra ID
- Azure RBAC
- Azure Policy
- Resource Tags
- Azure Monitor
- Log Analytics
- Microsoft Defender for Cloud
- Terraform
- Azure networking and security foundations

## Management Group Hierarchy

```bash
Tenant Root
│
└── NovaSol Enterprise
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
```

## Subscription Strategy

The proposed environment separates workloads and platform services into dedicated subscriptions.

| Subscription | Purpose |
|---|---|
| Management | Central monitoring and management services |
| Security | Security and security-management services |
| Production | Production workloads |
| Development | Development workloads |
| Sandbox | Testing and experimentation |

## Governance

Azure governance will be implemented using:

- Azure Policy
- Management Groups
- RBAC
- Resource Tags
- Naming Standards
- Subscription Boundaries
- Cost Management

## Azure Policy

Example governance policies include:

- Restrict Azure resource locations
- Require mandatory resource tags
- Restrict unsupported resource types
- Enforce organizational standards
- Monitor policy compliance

## RBAC Strategy

Access will follow the principle of least privilege.

### Example Roles

| Role | Purpose |
|---|---|
| Global Administrator | Microsoft Entra tenant administration |
| Owner | Full Azure resource management |
| Contributor | Resource deployment and management |
| Reader | Read-only access |
| Security Reader | Security monitoring and investigation |

## Resource Naming Convention

Resources will follow a standardized naming pattern.

### Examples

```bash
rg-ns-prod-app
rg-ns-dev-app
vnet-ns-prod-01
snet-ns-prod-app
kv-ns-prod-01
log-ns-prod-01
stnsprod01
```

```bash
Environment Codes
prod = Production
dev  = Development
test = Testing
sbx  = Sandbox
sec  = Security
mgmt = Management
```

### Resource Tagging Strategy

The following tags will be used to improve governance, ownership, cost tracking, and resource management.

### Mandatory Tags

```bash
Environment
Department
Application
Owner
CostCenter
Criticality
```

### Example

```bash
Environment = Production
Department  = IT
Application = CustomerPortal
Owner       = CloudTeam
CostCenter  = IT-001
Criticality = High
```

### Security Architecture

Security controls will include:

- Microsoft Entra ID
- Azure RBAC
- Azure Policy
- Microsoft Defender for Cloud
- Network Security Groups
- Managed identities
- Azure Key Vault
- Least-privilege access
- Monitoring

The architecture will use Azure monitoring services to provide centralized visibility.

### Planned Components

- Azure Monitor
- Log Analytics
- Activity Logs
- Security monitoring
- Resource health monitoring
- Policy compliance monitoring

### Infrastructure as Code

Terraform will be used to demonstrate Infrastructure as Code and support repeatable infrastructure deployment.

### Planned Structure

```bash
terraform/
├── main.tf
├── variables.tf
├── outputs.tf
└── README.md
```

### Project Architecture

The final Azure Enterprise Landing Zone architecture diagram will be stored in:

```bash
architecture/
└── azure-enterprise-landing-zone.png
```

### Project Documentation

Detailed implementation documentation will be maintained in:

```bash
docs/
├── 01-requirements.md
├── 02-management-groups.md
├── 03-subscription-strategy.md
├── 04-resource-organization.md
├── 05-azure-policy.md
├── 06-rbac.md
├── 07-tagging-strategy.md
├── 08-monitoring.md
└── 09-design-decisions.md
```

### Learning Objectives

This project is designed to demonstrate practical knowledge aligned with the Microsoft Azure Solutions Architect Expert (AZ-305) learning objectives.

### Key Areas

- Azure governance
- Identity and access
- Azure infrastructure
- Resource organization
- Security
- Monitoring
- High availability
- Infrastructure as Code
- Architecture decision-making

### Project Status

### 🚧 In Progress

### Roadmap

 * Create GitHub repository
 Define project organization
 Define initial architecture scope
 Design management-group hierarchy
 Define subscription strategy
 Define resource-group strategy
 Implement Azure Policy
 Implement RBAC
 Implement tagging standards
 Design monitoring
 Create architecture diagram
 Implement Terraform
 Test and validate architecture
 Complete documentation
