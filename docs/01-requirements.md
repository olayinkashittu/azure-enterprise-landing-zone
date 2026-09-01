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

These identities are fictional and must not be used as real public identities.

## 7. Governance Requirements

Azure governance must ensure that resources follow organizational standards.

The landing zone should enforce:

- Approved Azure regions
- Required resource tags
- Standard naming conventions
- Approved resource types
- Appropriate RBAC assignments
- Environment separation
- Security standards
  
## 8. Security Requirements

NovaSol Enterprise will follow the principle of least privilege.

Access will be separated between:

### Microsoft Entra ID administration

and

### Azure resource authorization

Azure RBAC will be applied at the appropriate management group, subscription, resource group, or resource scope.

## 9. Cost Management Requirements

The architecture should provide visibility and accountability for Azure spending.

Resources should use standardized tags such as:

```bash
Environment
Department
Application
Owner
CostCenter
Criticality
```

These tags will help identify resource ownership, environment, and cost allocation.

## 10. Scalability Requirements

The landing zone must allow NovaSol Enterprise to:

- Add new subscriptions
- Add new departments
- Add new workloads
- Expand governance policies
- Introduce additional Azure services
- Scale the architecture without redesigning the entire foundation
  
## 11. Availability and Business Continuity

Critical workloads should be designed with appropriate availability and recovery requirements.

Future workload architectures will consider:

- Availability Zones
- Region redundancy
- Backup
- Disaster recovery
- Recovery Time Objective (RTO)
- Recovery Point Objective (RPO)
  
## 12. Project Constraints

This is an educational and portfolio project.

The implementation will prioritize:

- Free or low-cost Azure services
- Azure Portal
- Microsoft Learn
- Azure Cloud Shell
- Terraform
- GitHub
- Architecture documentation

Expensive Azure resources will only be deployed when required for demonstrating an architectural concept.

## 13. Success Criteria

The project will be considered successful when NovaSol Enterprise has a documented and validated landing zone architecture covering:

- Management groups
- Subscription strategy
- Resource organization
- Azure Policy
- RBAC
- Resource tagging
- Security
- Monitoring
- Infrastructure as Code
- Architecture documentation
  
## 14. Project Status

Status: 🚧 In Progress

Project Type: Azure Cloud Architecture / AZ-305 Portfolio Project

Organization: NovaSol Enterprise

Environment: Microsoft Azure
