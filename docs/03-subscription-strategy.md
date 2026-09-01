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
