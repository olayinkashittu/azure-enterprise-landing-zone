# Terraform Infrastructure as Code

## Overview

This directory contains the Terraform configuration for the NovaSol Enterprise Azure Landing Zone.

The configuration uses Infrastructure as Code (IaC) to model Azure platform governance, security, resource organization, policy, access control, monitoring, and cost governance.

The current implementation is intentionally **cost-free and deployment-safe**. Terraform configuration is developed and validated locally without creating or modifying Azure resources.

## Terraform Files

| File                    | Purpose                                                                             |
| ----------------------- | ----------------------------------------------------------------------------------- |
| `main.tf`               | Configures Terraform, the Azure provider, resource groups, and common resource tags |
| `variables.tf`          | Defines reusable project configuration variables and validation rules               |
| `outputs.tf`            | Defines Terraform output values                                                     |
| `management-groups.tf`  | Defines the NovaSol Enterprise management group hierarchy                           |
| `subscriptions.tf`      | Documents the subscription strategy and landing-zone organization                   |
| `naming-standards.tf`   | Defines Azure naming conventions                                                    |
| `security-baseline.tf`  | Documents the security baseline and governance controls                             |
| `policies.tf`           | Defines Azure Policy definitions as code                                            |
| `policy-assignments.tf` | Defines management-group policy assignments                                         |
| `rbac.tf`               | Defines the planned role-based access control model                                 |
| `monitoring-logging.tf` | Defines the monitoring and logging governance design                                |
| `cost-governance.tf`    | Defines the cost governance design                                                  |
| `terraform-graph.dot`   | Terraform dependency graph generated from the configuration                         |

## Configuration

The Terraform configuration currently defines the following project settings:

| Variable       | Example Value |
| -------------- | ------------- |
| `project_name` | `NovaSol`     |
| `environment`  | `Production`  |
| `location`     | `West Europe` |
| `owner`        | `CloudTeam`   |
| `department`   | `IT`          |
| `cost_center`  | `IT-001`      |

## Environment Configuration

Terraform variables can be provided through a `.tfvars` file.

A sample production configuration is provided as:

`production.tfvars.example`

To create a local production configuration:

```powershell
Copy-Item production.tfvars.example production.tfvars
```

The local `production.tfvars` file is excluded from version control.

## Policy as Code

The project includes Azure Policy definitions developed and validated locally.

Current policy controls include:

* Allowed Azure regions
* Required resource tags

The current allowed Azure regions are:

* `northeurope`
* `westeurope`

Required resource tags include:

* `Environment`
* `Owner`
* `CostCenter`

Policy assignments are modeled at the NovaSol Enterprise root management-group level.

No policy assignments are currently deployed to Azure.

## Governance Areas

The Terraform configuration supports the following Azure landing-zone governance areas.

### Management Groups

The target hierarchy includes:

```text
Tenant Root
|
+-- NovaSol Enterprise
    |
    +-- Platform
    |   +-- Management
    |   +-- Security
    |
    +-- Landing Zones
    |   +-- Corp
    |   |   +-- Production
    |   |   +-- Development
    |   +-- Online
    |
    +-- Sandbox
```

### Subscription Strategy

The target subscription model includes:

* Management - Platform
* Security - Platform
* Production - Landing Zones / Corp
* Development - Landing Zones / Corp
* Sandbox - Sandbox

### Resource Organization

The Terraform configuration models resource-group organization for application, networking, data, and landing-zone resources.

Example naming pattern:

```text
rg-<project>-<environment>
rg-<project>-<environment>-network
rg-<project>-<environment>-app
rg-<project>-<environment>-data
```

### Security

The security baseline documents planned governance controls including identity, access control, security monitoring, and least-privilege principles.

### RBAC

The RBAC configuration documents the planned role-based access control model and separation of administrative responsibilities.

Microsoft Entra ID roles and Azure RBAC roles are treated as separate authorization systems.

### Monitoring and Logging

The monitoring and logging design includes:

* Azure Activity Logs
* Azure Resource Logs
* Log Analytics
* Azure Monitor alerts
* Monitoring dashboards

These components are currently represented as design and governance definitions rather than deployed Azure resources.

### Cost Governance

The cost governance design includes:

* Cost Center tagging
* Resource ownership
* Environment classification
* Azure Cost Management budgets
* Cost analysis
* Regular cost governance reviews

These controls are currently marked as planned and are not deployed.

## Infrastructure as Code Principles

The Terraform implementation follows these principles:

* Reusable configuration
* Consistent naming
* Parameterized variables
* Infrastructure as Code
* Version-controlled infrastructure
* Separation of configuration and deployment
* Azure governance alignment
* Least-privilege access
* Cost-conscious design
* Local validation before deployment

## Validation

Terraform configuration is validated locally before any Azure deployment.

Example:

```powershell
terraform -chdir=terraform fmt
terraform -chdir=terraform validate
```

The current project stage does not require `terraform apply`.

## Current Status

The Terraform configuration provides the governance and Infrastructure as Code foundation for the NovaSol Enterprise Azure Landing Zone.

The configuration has been developed and validated locally.

**No Azure resources have been deployed at this stage.**

This approach allows the architecture, policies, governance controls, and Terraform configuration to be reviewed before introducing Azure subscription costs or production changes.

## Future Implementation

Future phases may include deployment of the validated configuration to an appropriate Azure subscription after:

1. Confirming Azure subscription availability
2. Reviewing expected costs
3. Confirming the target tenant and management-group structure
4. Reviewing Terraform plans
5. Validating security and governance requirements
6. Obtaining the required authorization for deployment

Potential future deployment areas include:

* Management groups
* Subscriptions
* Resource groups
* Azure Policy assignments
* RBAC assignments
* Networking
* Log Analytics
* Monitoring
* Diagnostic settings
* Additional landing-zone governance controls

Any actual Azure deployment will be performed only after the required subscription, permissions, and cost implications have been confirmed.
