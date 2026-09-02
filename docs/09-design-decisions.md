# Design Decisions

## 1. Overview

This document records the major architectural decisions made for the NovaSol Enterprise Azure Landing Zone.

The purpose is to explain **why** each design choice was made and how the decisions support:

- Governance
- Security
- Scalability
- Availability
- Operational efficiency
- Cost management
- Maintainability
- Infrastructure as Code

The design follows Azure Landing Zone and cloud architecture principles while remaining suitable for a portfolio implementation.

## 2. Decision-Making Principles

NovaSol Enterprise evaluates architectural decisions using the following principles:

1. Security by design
2. Least privilege
3. Centralized governance
4. Workload isolation
5. Operational consistency
6. Scalability
7. Availability
8. Cost awareness
9. Automation
10. Maintainability

## 3. Management Group Hierarchy

### Decision

Use management groups to establish a governance hierarchy above subscriptions.

### Rationale

Management groups provide a scope for applying governance and Azure Policy across multiple subscriptions.

The proposed hierarchy is:

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

### Benefits

- Centralized governance
- Policy inheritance
- Subscription organization
- Scalable governance model
- Clear separation of platform and workload environments

## 4. Subscription Separation

### Decision

Separate management, security, production, development, and sandbox environments into dedicated subscriptions.

### Rationale

Subscriptions provide important boundaries for:

- Governance
- Access control
- Cost management
- Resource isolation
- Operational management

### Proposed Structure

| Subscription | Purpose |
|---|---|
| Management | Central management and monitoring |
| Security | Security and compliance services |
| Production | Production workloads |
| Development | Development workloads |
| Sandbox | Experimentation and testing |

This structure allows NovaSol Enterprise to scale without placing all workloads into a single subscription.

## 5. Production and Development Separation

### Decision

Production and development workloads are separated.

### Rationale

Production workloads have higher requirements for:

- Security
- Availability
- Change management
- Monitoring
- Access control

Development environments can have different operational and cost requirements.

Separating the environments reduces the risk of development activities affecting production workloads.

## 6. Resource Group Organization

### Decision

Organize resources into resource groups based on workload, ownership, and lifecycle.

### Example

```bash
NovaSol-Production
│
├── rg-ns-prod-customerportal
├── rg-ns-prod-network
└── rg-ns-prod-data
```

### Rationale

Resources that share a lifecycle can be managed together.

This supports:

- Deployment
- Updates
- Access management
- Monitoring
- Lifecycle management
- Decommissioning

Resources with different lifecycles should not automatically be placed in the same resource group.

## 7. Azure Policy

### Decision

Use Azure Policy as the primary governance mechanism for resource configuration and compliance.

### Rationale

Azure Policy can help ensure that resources follow organizational requirements.

Examples include:

- Allowed Azure locations
- Required tags
- Security configurations
- Resource-type restrictions
- Monitoring requirements

### Policy Enforcement Strategy

Policies should generally be tested using `Audit` before stronger enforcement such as `Deny`.

Example:

```bash
Design
  │
  ▼
Test
  │
  ▼
Audit
  │
  ▼
Review
  │
  ▼
Enforce
```

This reduces the risk of unintentionally blocking legitimate workloads.

## 8. RBAC and Least Privilege

### Decision

Use Azure RBAC based on least privilege and appropriate scope.

### Rationale

Users should receive only the permissions required to perform their responsibilities.

Example:

```bash
User
 │
 ▼
Microsoft Entra Group
 │
 ▼
Azure RBAC Role
 │
 ▼
Required Scope
```

Group-based assignments simplify access management and improve consistency.

Permissions should be assigned at the lowest practical scope.

## 9. Separation of Identity and Resource Administration

### Decision

Keep Microsoft Entra ID roles separate from Azure RBAC roles.

### Rationale

Microsoft Entra ID roles control identity and directory administration.

Azure RBAC controls access to Azure resources.

For example:

```bash
Microsoft Entra ID
      │
      └── Identity Administration

Azure RBAC
      │
      └── Azure Resource Access
```

**Global Administrator is a Microsoft Entra ID role and is not an Azure RBAC role.**

This distinction is important for secure cloud administration and clear separation of responsibilities.

## 10. Tagging Strategy

### Decision

Use standardized tags across the environment.

### Rationale

Tags improve:

- Resource identification
- Ownership tracking
- Cost allocation
- Reporting
- Automation
- Governance

Core tags include:

```bash
Environment
Department
Application
Owner
CostCenter
```

Additional tags can be introduced when they provide a clear operational benefit.

## 11. Centralized Monitoring

### Decision

Use a centralized monitoring architecture while allowing workload-specific monitoring.

### Rationale

Centralized monitoring provides Cloud Operations and Security teams with broader visibility across the environment.

The architecture includes:

- Azure Monitor
- Log Analytics
- Application Insights
- Activity Logs
- Metrics
- Alerts
- Diagnostic settings

Example:

```bash
Azure Resources
      │
      ▼
Azure Monitor
      │
      ├── Logs
      ├── Metrics
      ├── Alerts
      └── Application Monitoring
```

Production workloads receive stronger monitoring than lower-risk environments.

## 12. Security Architecture

### Decision

Security controls are integrated into the landing zone rather than treated as a separate deployment phase.

### Rationale

Security should be considered across:

- Identity
- Access control
- Networking
- Monitoring
- Policy
- Resource configuration
- Data protection

This creates a security-by-design architecture.

## 13. Sandbox Isolation

### Decision

Provide a dedicated Sandbox environment.

### Rationale

Sandbox environments allow teams to:

- Experiment
- Learn Azure services
- Test concepts
- Build proof-of-concepts

without directly affecting production workloads.

Sandbox resources should still follow appropriate security and cost controls.

## 14. Infrastructure as Code

### Decision

Use Terraform to represent the infrastructure design as code.

### Rationale

Infrastructure as Code provides:

- Repeatability
- Version control
- Automation
- Consistency
- Change tracking
- Easier deployment

Example:

```bash
Terraform Configuration
        │
        ▼
Version Control
        │
        ▼
Azure Infrastructure
```

The Terraform implementation will be introduced after the architecture and governance documentation are complete.

## 15. Documentation-First Implementation

### Decision

Build the portfolio project using a documentation-first approach.

### Rationale

The project is designed to demonstrate architecture and governance skills without requiring immediate Azure resource deployment.

The implementation sequence is:

```bash
Requirements
     │
     ▼
Architecture
     │
     ▼
Governance
     │
     ▼
Documentation
     │
     ▼
Terraform
     │
     ▼
Optional Azure Deployment
```

This approach minimizes unnecessary cloud costs while still demonstrating architectural capability.

## 16. Cost Management

### Decision

Cost management is incorporated into the architecture from the beginning.

### Rationale

Cloud architecture decisions can directly affect operational costs.

NovaSol Enterprise considers:

- Subscription separation
- Resource lifecycle
- Monitoring data volume
- Log retention
- Sandbox controls
- Resource sizing
- Unused resources
- Automation

Cost optimization should not compromise required security or availability.

## 17. Scalability

### Decision

Design the landing zone so that additional subscriptions, workloads, and management groups can be introduced when required.

### Rationale

NovaSol Enterprise may grow over time.

Example:

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

Additional subscriptions should only be introduced when justified by business, security, governance, operational, or cost requirements.

## 18. Availability and Business Continuity

### Decision

Availability and business continuity are considered during workload design rather than relying solely on the landing zone.

### Rationale

Different applications have different availability requirements.

Critical workloads should evaluate:

- Availability requirements
- Recovery objectives
- Backup
- Disaster recovery
- Regional resilience
- Dependency management

The landing zone provides the governance foundation, while individual workloads implement appropriate resilience patterns.

## 19. Decision Summary

| Area | Decision |
|---|---|
| Management | Use management groups |
| Subscriptions | Separate platform, workload, and sandbox environments |
| Resources | Organize by workload and lifecycle |
| Governance | Use Azure Policy |
| Access | Use least-privilege Azure RBAC |
| Identity | Separate Entra ID roles from Azure RBAC |
| Tags | Use standardized metadata |
| Monitoring | Use centralized monitoring |
| Security | Apply security-by-design principles |
| Sandbox | Isolate experimentation |
| IaC | Use Terraform |
| Cost | Design with cost awareness |
| Scalability | Allow controlled future expansion |
| Availability | Apply resilience according to workload requirements |

## 20. AZ-305 Design Alignment

The architecture demonstrates several important Azure solution-design concepts relevant to AZ-305.

### Governance

- Management groups
- Azure Policy
- RBAC
- Naming
- Tagging

### Identity

- Microsoft Entra ID
- Role separation
- Least privilege
- Privileged access

### Infrastructure

- Subscription architecture
- Resource groups
- Workload organization
- Network organization

### Operations

- Azure Monitor
- Log Analytics
- Alerts
- Diagnostic settings

### Cost Optimization

- Subscription boundaries
- Resource organization
- Monitoring cost awareness
- Sandbox isolation

### Reliability

- Availability planning
- Monitoring
- Business continuity considerations
- Workload resilience

## 21. Portfolio Implementation

This project will demonstrate the design through:

- Architecture documentation
- Architecture diagrams
- Governance models
- Policy examples
- RBAC models
- Tagging standards
- Monitoring architecture
- Terraform configuration
- Design rationale

The architecture is designed to be understandable and reviewable by recruiters, cloud engineers, and technical interviewers.

## 22. Success Criteria

The design is considered successful when:

- Major architectural decisions are documented.
- Each decision has a clear rationale.
- Security is incorporated throughout the design.
- Governance requirements are clearly defined.
- The architecture can scale.
- Operational requirements are addressed.
- Cost considerations are documented.
- Infrastructure can be represented using Terraform.
- The project demonstrates practical AZ-305 architecture skills.

## 23. Project Status

**Status:** Core Architecture Documentation Completed

The following documents are complete:

- [01 — Requirements](01-requirements.md)
- [02 — Management Groups](02-management-groups.md)
- [03 — Subscription Strategy](03-subscription-strategy.md)
- [04 — Resource Organization](04-resource-organization.md)
- [05 — Azure Policy](05-azure-policy.md)
- [06 — RBAC](06-rbac.md)
- [07 — Tagging Strategy](07-tagging-strategy.md)
- [08 — Monitoring](08-monitoring.md)
- [09 — Design Decisions](09-design-decisions.md)

The next phase is to create the **Azure Enterprise Landing Zone architecture diagram** and add it to the repository.

After the diagram, the project will move toward the Terraform implementation.
