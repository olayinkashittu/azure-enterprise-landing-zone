# NovaSol Enterprise — Azure Landing Zone Requirements

## 1. Project Overview

NovaSol Enterprise is a fictional organization planning to adopt Microsoft Azure for its cloud workloads.

The organization requires a governed, secure, scalable, and standardized Azure foundation that can support multiple departments and environments.

This project demonstrates the design and implementation of an Azure Enterprise Landing Zone aligned with Azure architecture and governance principles.

## 2. Business Requirements

NovaSol Enterprise requires an Azure environment that provides:

- Centralized governance
- Secure identity and access management
- Separation of production and development environments
- Standardized resource organization
- Consistent security controls
- Cost management and accountability
- Centralized monitoring
- Regulatory and organizational policy enforcement
- Scalability for future Azure workloads
- Repeatable infrastructure deployment

## 3. Organizational Structure

NovaSol Enterprise has the following departments:

| Department | Primary Responsibility |
|---|---|
| IT | Infrastructure and cloud operations |
| Security | Security, compliance, and risk management |
| Development | Application development |
| Finance | Financial management and cost control |
| HR | Human resources applications and services |

## 4. Azure Environments

The Azure environment will support the following environments:

| Environment | Purpose |
|---|---|
| Production | Hosts business-critical workloads |
| Development | Application development and engineering |
| Testing | Application and infrastructure testing |
| Sandbox | Learning, experimentation, and proof of concepts |


## 5. Architecture Requirements

The landing zone architecture must provide:

### Governance

- Management group hierarchy
- Subscription organization
- Azure Policy
- Resource tagging
- Naming standards
- Cost management

### Identity and Access

- Microsoft Entra ID
- Azure RBAC
- Least-privilege access
- Separation of identity administration and Azure resource authorization

### Security

- Centralized security management
- Microsoft Defender for Cloud
- Network security controls
- Managed identities
- Azure Key Vault

### Monitoring

- Azure Monitor
- Log Analytics
- Activity Logs
- Resource health monitoring
- Policy compliance monitoring

### Infrastructure as Code

Terraform will be used to demonstrate repeatable and automated infrastructure deployment.

## 6. Naming and Domain Requirements

The fictional organization will use:

**Organization:**

`NovaSol Enterprise`

**Testing domain:**

`novasol.test`

The `.test` domain is reserved for testing and documentation purposes.

Example test identities:

```bash
admin@novasol.test
developer@novasol.test
security@novasol.test
```
