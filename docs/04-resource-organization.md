# Resource Organization

## 1. Overview

This document defines how Azure resources are organized within the NovaSol Enterprise landing zone.

The objective is to create a consistent resource-group structure that supports:

- Workload organization
- Resource lifecycle management
- Security and access control
- Operational management
- Monitoring
- Cost tracking
- Consistent naming
- Infrastructure as Code (IaC)

Resource groups are used to group resources that share a common lifecycle and operational purpose.

## 2. Resource Group Design Principles

NovaSol Enterprise follows these principles when creating resource groups:

1. Group resources with similar lifecycles together.
2. Organize resources according to workload and operational responsibility.
3. Avoid creating unnecessary resource groups.
4. Use consistent naming conventions.
5. Apply appropriate tags to resource groups and resources.
6. Separate production and non-production resources.
7. Apply RBAC at the appropriate resource-group scope.
8. Use resource locks for critical resources where appropriate.
9. Manage resource deployment through Infrastructure as Code where practical.

Resource groups provide a management boundary for related Azure resources and can also be used for access control, tagging, deployment management, and lifecycle operations.

## 3. Workload-Based Organization

NovaSol Enterprise organizes resources primarily around workloads and their lifecycle.

Example:

```bash
NovaSol-Production
│
├── rg-ns-prod-customerportal
├── rg-ns-prod-network
└── rg-ns-prod-data
```

This structure allows application, networking, and data resources to be managed according to their operational requirements.

The exact resource-group structure can be adjusted depending on the workload architecture.

## 4. Production Resource Organization

The Production subscription contains resources supporting business-critical workloads.

Example:

```bash
NovaSol-Production
│
├── rg-ns-prod-customerportal
│   ├── Application resources
│   ├── App Service / Compute
│   └── Application monitoring
│
├── rg-ns-prod-network
│   ├── Virtual Network
│   ├── Subnets
│   ├── Network Security Groups
│   └── Network connectivity resources
│
└── rg-ns-prod-data
    ├── Database resources
    ├── Storage resources
    └── Data protection resources
```

Production resources should have stricter access controls, monitoring, security policies, and change-management requirements.

## 5. Development Resource Organization

Development resources are isolated from production resources.

Example:

```bash
NovaSol-Development
│
├── rg-ns-dev-customerportal
├── rg-ns-dev-network
└── rg-ns-dev-data
```

Development environments may have different:

- Access requirements
- Availability requirements
- Security controls
- Performance requirements
- Cost expectations

Development resources should not be used to host production workloads.

## 6. Sandbox Resource Organization

The Sandbox subscription provides an isolated environment for experimentation, learning, testing, and proof-of-concept activities.

Example:

```bash
NovaSol-Sandbox
│
├── rg-ns-sbx-lab01
├── rg-ns-sbx-lab02
└── rg-ns-sbx-testing
```

Sandbox resources should have appropriate cost controls and lifecycle rules to prevent unnecessary resource consumption.

## 7. Application Resource Groups

Application-specific resources should be grouped together when they share the same lifecycle and operational ownership.

Example:

```bash
rg-ns-prod-customerportal
```

Possible resources include:

- Application Service
- Application Gateway
- Key Vault
- Application monitoring resources
- Supporting application components

Application resource groups make it easier for application teams to manage resources associated with a specific workload.

## 8. Network Resource Groups

Shared networking resources should be organized separately when they have a different lifecycle or operational owner from application workloads.

Example:

```bash
rg-ns-prod-network
```

Possible resources include:

- Virtual Networks
- Subnets
- Network Security Groups
- Route Tables
- Public IP resources
- Load-balancing resources
- Connectivity components

Network resources may be managed by a centralized platform or networking team.

## 9. Data Resource Groups

Data resources can be organized separately when they require different security, operational, or lifecycle requirements.

Example:

```bash
rg-ns-prod-data
```

Possible resources include:

- Azure SQL Database
- Storage Accounts
- Managed databases
- Backup-related resources
- Data protection components

Sensitive data resources should receive appropriate security controls and access restrictions.

## 10. Resource Group Naming Convention

NovaSol Enterprise uses the following naming pattern:

```bash
rg-ns-<environment>-<workload>
```

### Examples

```bash
rg-ns-prod-customerportal
rg-ns-prod-network
rg-ns-prod-data

rg-ns-dev-customerportal
rg-ns-dev-network
rg-ns-dev-data

rg-ns-sbx-lab01
rg-ns-sbx-testing
```

Where:

| Component | Meaning |
|---|---|
| `rg` | Resource Group |
| `ns` | NovaSol |
| `prod` | Production |
| `dev` | Development |
| `sbx` | Sandbox |
| `customerportal` | Workload or application |

Naming conventions improve resource identification and support operations, automation, monitoring, security, and cost management.

## 11. Resource Lifecycle Management

Resources that share the same lifecycle should generally be placed in the same resource group.

For example:

```bash
Application Deployment
        │
        ▼
rg-ns-prod-customerportal
        │
        ├── Application
        ├── Supporting Services
        └── Monitoring
```

This allows related resources to be managed together during:

- Deployment
- Updates
- Maintenance
- Decommissioning

Resources with significantly different lifecycles should not automatically be placed in the same resource group.

## 12. Resource Ownership

Resource ownership is defined according to operational responsibility.

| Resource Category | Primary Owner |
|---|---|
| Application Resources | Application Team |
| Network Resources | Network / Cloud Team |
| Data Resources | Data / Application Team |
| Security Resources | Security Team |
| Monitoring Resources | Cloud Operations |
| Sandbox Resources | Individual Team / IT |

Ownership should also be represented through resource tags where appropriate.

## 13. Resource Dependencies

Resource dependencies should be considered when designing resource groups.

Example:

```bash
Virtual Network
      │
      ├── Subnet
      │     │
      │     └── Application
      │
      └── Network Security Group
```

Infrastructure as Code should define dependencies where necessary so resources are deployed in the correct order.

The organization should avoid creating unnecessary dependencies between unrelated workloads.

## 14. Governance at Resource Group Scope

Resource groups provide an additional scope for applying governance and access controls.

NovaSol Enterprise may apply:

- Azure RBAC
- Azure Policy
- Resource locks
- Tags
- Diagnostic settings
- Monitoring configuration

Example:

```bash
Subscription
     │
     └── Resource Group
             │
             ├── RBAC
             ├── Policy
             ├── Tags
             └── Resources
```

Critical production resource groups may use resource locks to reduce the risk of accidental deletion.

## 15. Portfolio Implementation

This project is designed as a documentation-first Azure architecture portfolio.

The resource-group architecture will initially be demonstrated through:

- Architecture diagrams
- Markdown documentation
- Naming conventions
- Resource-group examples
- Azure Policy examples
- RBAC design
- Terraform configuration
- Infrastructure design decisions

Actual Azure resource deployment is not required to demonstrate the complete design.

If Azure resources are later deployed, resource creation will be performed carefully to minimize unnecessary costs.

## 16. Design Decisions

### Decision 1 — Organize by workload

Resources are organized around applications, networking, and data where separate lifecycle or ownership requirements exist.

### Decision 2 — Separate production and development

Production and development workloads are maintained in different subscriptions and resource groups.

### Decision 3 — Use lifecycle-based grouping

Resources with similar lifecycles are placed in the same resource group.

### Decision 4 — Use consistent naming

All resource groups follow a predictable naming convention.

### Decision 5 — Separate shared networking

Networking resources may be separated from application resources when they have different ownership or lifecycle requirements.

### Decision 6 — Use resource-group governance

RBAC, policies, tags, monitoring, and locks can be applied at resource-group scope where appropriate.

## 17. Success Criteria

The resource organization design is considered successful when:

- Resources can be quickly identified.
- Workloads are logically organized.
- Production and development resources are separated.
- Resource lifecycles are clearly defined.
- Ownership is clearly established.
- Naming conventions are consistently applied.
- Governance can be applied at appropriate scopes.
- Resource dependencies are documented.
- The design can scale as NovaSol Enterprise grows.

## 18. Project Status

**Status:** Design Completed

The resource organization model has been designed as part of the NovaSol Enterprise Azure Landing Zone architecture.

Next steps include:

1. Azure Policy design
2. RBAC design
3. Tagging strategy
4. Monitoring architecture
5. Architecture diagrams
6. Terraform implementation
