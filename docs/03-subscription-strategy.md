# NovaSol Enterprise — Azure Subscription Strategy

## 1. Overview

NovaSol Enterprise will use multiple Azure subscriptions to provide workload isolation, security boundaries, governance, cost management, and operational separation.

Subscriptions will be organized under the appropriate Management Groups within the Azure Enterprise Landing Zone.

The subscription strategy is designed to support the organization's current requirements while allowing additional subscriptions to be added as the environment grows.

## 2. Subscription Design Principles

The subscription strategy follows these principles:

- Separate platform services from application workloads
- Isolate production from non-production environments
- Establish clear security boundaries
- Enable centralized governance
- Support independent cost tracking
- Apply policies at appropriate management-group and subscription scopes
- Support least-privilege access
- Allow future organizational growth
- Avoid creating unnecessary subscriptions

## 3. Proposed Subscription Structure

The proposed NovaSol Enterprise environment contains the following subscriptions:

| Subscription | Management Group | Purpose |
|---|---|---|
| Management | Platform | Central monitoring and management services |
| Security | Platform | Security, compliance, and security-management services |
| Production | Landing Zones / Corp | Production business workloads |
| Development | Landing Zones / Corp | Development workloads |
| Sandbox | Sandbox | Testing, experimentation, and learning |

## 4. Subscription Hierarchy

```bash
Tenant Root
│
└── NovaSol Enterprise
    │
    ├── Platform
    │   │
    │   ├── Management
    │   │      └── Management Subscription
    │   │
    │   └── Security
    │          └── Security Subscription
    │
    ├── Landing Zones
    │   │
    │   ├── Corp
    │   │     ├── Production Subscription
    │   │     └── Development Subscription
    │   │
    │   └── Online
    │
    └── Sandbox
           └── Sandbox Subscription
```

## 5. Management Subscription

### Purpose

The Management subscription is intended for centralized management and monitoring services.

### Example Services

- Azure Monitor
- Log Analytics workspaces
- Automation services
- Management tooling
- Centralized operational monitoring

### Primary Users

- Cloud administrators
- Platform engineers
- Operations teams

### Governance

The Management subscription will inherit organizational policies from the Platform Management Group.

## 6. Security Subscription

### Purpose

The Security subscription is intended for centralized security and compliance services.

### Example Services

- Microsoft Defender for Cloud
- Security monitoring
- Security management resources
- Centralized security tooling
- Security-related Log Analytics resources

### Primary Users

- Security administrators
- Security analysts
- Cloud security teams

### Governance

Security resources will be managed separately from application workloads to establish a clear security boundary.

## 7. Production Subscription

### Purpose

The Production subscription will host business-critical production workloads.

### Example Resource Groups

```bash
rg-ns-prod-app
rg-ns-prod-network
rg-ns-prod-data
```

### Possible Workloads

- Web applications
- APIs
- Databases
- Storage
- Business applications
  
### Security Considerations

Production workloads will have stricter governance requirements than development and sandbox environments.

Examples include:

- Restricted resource locations
- Mandatory resource tags
- Approved resource types
- Strong RBAC controls
- Security monitoring
- Backup requirements
- Network security controls
  
### 8. Development Subscription
Purpose

The Development subscription will provide an isolated environment for application development and engineering activities.

### Example Resource Groups

```bash
rg-ns-dev-app
rg-ns-dev-network
rg-ns-dev-data
```

Development resources should not be treated as production resources.

### Governance

Development will still be governed by organizational policies but may have different controls from the Production subscription.

### 9. Sandbox Subscription

### Purpose

The Sandbox subscription provides an isolated environment for experimentation, testing, learning, and proof-of-concept activities.

### Example Activities

- Azure service experimentation
- Architecture testing
- Terraform testing
- Proof-of-concept deployments
- Learning exercises
  
### Governance

Sandbox environments should have appropriate controls to prevent:

- Excessive spending
- Deployment of unauthorized resources
- Security risks
- Long-running unused resources

### 10. Subscription Isolation

Separating subscriptions provides additional administrative and governance boundaries.

```bash
Production Subscription
        │
        └── Production workloads

Development Subscription
        │
        └── Development workloads

Security Subscription
        │
        └── Security services

Management Subscription
        │
        └── Monitoring and management

Sandbox Subscription
        │
        └── Experiments and testing
```
This separation helps reduce the risk of accidental changes between environments.

### 11. Governance Scope

Governance controls will be applied at the appropriate level.

```bash
Management Group
        │
        └── Azure Policy
                │
                ▼
          Subscription
                │
                ▼
         Resource Group
                │
                ▼
            Resource
```

Policies that should apply broadly across the organization can be assigned at a higher management-group scope.

More specific requirements can be implemented at the subscription or resource-group level.

## 12. Cost Management

Each subscription provides a useful boundary for cost visibility, accountability, and financial management.

| Subscription | Cost Owner |
|---|---|
| Management | IT / Cloud Operations |
| Security | Security Team |
| Production | Business / Application Owner |
| Development | Development Team |
| Sandbox | Individual Team / IT |

Resources will also use standardized tags to improve cost allocation and resource ownership.

### Cost Management Objectives

- Track Azure spending by subscription
- Identify resource ownership
- Allocate costs to departments and applications
- Monitor development and sandbox spending
- Improve cost visibility and accountability
- Support budget planning and optimization

### Example Cost Allocation Tags

```bash
Environment = Production
Department  = IT
Application = CustomerPortal
Owner       = CloudTeam
CostCenter  = IT-001
```

### 13. Access Management

Access will follow the principle of least privilege.

Azure RBAC will be used to control access to subscriptions, resource groups, and resources.

### Example

```bash
Cloud Administrator
        │
        └── Appropriate Azure RBAC Role
                 │
                 ▼
             Subscription

Developer
        │
        └── Contributor
                 │
                 ▼
          Development RG

Security Team
        │
        └── Security Reader
                 │
                 ▼
          Security Resources
```

Microsoft Entra ID roles will remain separate from Azure RBAC roles.

### Identity and Resource Access

Microsoft Entra ID roles are used for directory and identity administration, while Azure RBAC roles control access to Azure resources.

### 14. Subscription Naming

Subscriptions will follow a consistent naming standard.

### Examples

```bash
NovaSol-Management
NovaSol-Security
NovaSol-Production
NovaSol-Development
NovaSol-Sandbox
```

Subscription names should clearly communicate their purpose and environment.

### 15. Subscription Growth Strategy

The architecture is designed to support future expansion.

For example, NovaSol Enterprise may later introduce:

```bash
Landing Zones
│
├── Corp
│   ├── Production
│   ├── Development
│   └── Testing
│
└── Online
    ├── Production
    └── Development
```

Additional subscriptions should only be created when there is a clear business, security, governance, operational, or cost-management requirement.

## 16. Design Decisions

### Decision 1 — Separate Platform and Workloads

Platform services are separated from application workloads to establish clear operational and governance boundaries.

### Decision 2 — Separate Production and Development

Production and development workloads use separate subscriptions to reduce the risk of accidental changes and provide independent governance and cost visibility.

### Decision 3 — Dedicated Security Subscription

Security services are separated from workload subscriptions to establish a centralized security boundary.

### Decision 4 — Dedicated Management Subscription

Centralized monitoring and management services are separated from application workloads to support consistent operational visibility.

### Decision 5 — Sandbox Isolation

Sandbox activities are isolated from production and business-critical environments to reduce operational and security risk.

## 17. Portfolio Implementation

For this educational project, the subscription architecture will first be documented and modeled before creating additional Azure subscriptions.

Where multiple Azure subscriptions are not available, the architecture will be demonstrated through:

- Architecture diagrams
- Documentation
- Azure Policy examples
- Terraform configuration
- Azure Portal screenshots where available
- Simulated subscription structures

This approach allows the architecture to be demonstrated without unnecessary Azure costs.

## 18. Success Criteria

The subscription strategy will be considered complete when:

- Platform subscriptions are defined
- Workload subscriptions are defined
- Production and development are separated
- Security boundaries are defined
- Sandbox isolation is defined
- Cost ownership is documented
- Access-management strategy is documented
- Subscription naming is standardized
- Future subscription growth is documented
- Azure implementation is validated
- Terraform implementation is completed

## 19. Project Status

**Status:** 🚧 In Progress

**Organization:** NovaSol Enterprise

**Project:** Azure Enterprise Landing Zone

**Primary Goal:** Establish a governed, secure, scalable, and standardized Azure foundation.
