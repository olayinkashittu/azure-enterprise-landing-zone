# Role-Based Access Control (RBAC)

## 1. Overview

Role-Based Access Control (RBAC) defines how NovaSol Enterprise manages access to Azure resources.

The RBAC design follows the principle of **least privilege**, ensuring that users and teams receive only the permissions required to perform their responsibilities.

The design separates:

- Microsoft Entra ID roles
- Azure RBAC roles
- Administrative responsibilities
- Workload access
- Production and non-production access

## 2. Microsoft Entra ID Roles vs Azure RBAC

Microsoft Entra ID roles and Azure RBAC roles serve different purposes.

### Microsoft Entra ID Roles

Microsoft Entra ID roles control administration of identity and directory services.

Examples include:

- Global Administrator
- User Administrator
- Security Administrator

These roles are used for identity and directory administration.

### Azure RBAC Roles

Azure RBAC controls access to Azure resources.

Examples include:

- Owner
- Contributor
- Reader
- Security Reader

Azure RBAC can be assigned at scopes such as:

```bash
Management Group
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

**Important:** Global Administrator is a Microsoft Entra ID role, not an Azure RBAC role.

## 3. RBAC Objectives

NovaSol Enterprise uses RBAC to:

1. Enforce least privilege.
2. Separate administrative responsibilities.
3. Prevent unnecessary access to production resources.
4. Control access at appropriate scopes.
5. Support separation of duties.
6. Reduce the risk of unauthorized changes.
7. Improve accountability.
8. Support secure cloud operations.

## 4. RBAC Scope

Azure RBAC permissions can be assigned at different scopes.

```bash
Management Group
      │
      ├── Subscription
      │       │
      │       ├── Resource Group
      │       │       │
      │       │       └── Resource
      │       │
      │       └── Resource Group
      │
      └── Subscription
```

A role assignment at a higher scope can provide access to resources beneath that scope.

Therefore, NovaSol Enterprise prefers assigning permissions at the **lowest practical scope**.

## 5. Core Azure RBAC Roles

| Role | Purpose |
|---|---|
| Owner | Full Azure resource management access, including permission management |
| Contributor | Manage Azure resources but cannot assign Azure RBAC roles |
| Reader | View Azure resources without making changes |
| Security Reader | View security-related information and security configuration |

Additional specialized roles should be used when they provide a better least-privilege model.

## 6. Role Assignment Model

NovaSol Enterprise follows a group-based access model.

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
Azure Scope
```

Whenever practical, permissions should be assigned to groups rather than directly to individual users.

This simplifies:

- Access management
- Employee onboarding
- Employee offboarding
- Auditing
- Role reviews

## 7. Proposed Access Groups

Example Microsoft Entra security groups:

| Group | Purpose |
|---|---|
| SG-NovaSol-Cloud-Admins | Cloud administration |
| SG-NovaSol-Cloud-Operators | Operational management |
| SG-NovaSol-Security | Security operations |
| SG-NovaSol-Developers | Development workloads |
| SG-NovaSol-Readers | Read-only access |
| SG-NovaSol-Network-Admins | Network administration |

The actual groups should be created according to organizational requirements.

## 8. Proposed RBAC Assignments

Example access model:

| Group | Azure Role | Scope |
|---|---|---|
| Cloud Admins | Contributor | Appropriate subscription |
| Cloud Operators | Contributor | Required resource groups |
| Security Team | Security Reader | Security-related scope |
| Developers | Contributor | Development resource groups |
| Developers | Reader | Production resource groups where required |
| Readers | Reader | Appropriate subscription/resource group |
| Network Admins | Network-specific role | Network resource groups |

The goal is to avoid granting broad permissions when a more specific role is sufficient.

## 9. Production Access

Production environments require stricter access controls.

Example:

```bash
Production Subscription
        │
        ├── Application Resource Group
        │
        ├── Network Resource Group
        │
        └── Data Resource Group
```

Production access should be limited to authorized personnel.

Developers should generally have limited or read-only access to production resources unless their job responsibilities require additional permissions.

## 10. Development Access

Development environments can provide broader access to development teams.

Example:

```bash
Development Subscription
        │
        ├── Developer Group
        │       │
        │       └── Contributor
        │
        └── Operations Group
                │
                └── Appropriate Operational Role
```

Development permissions should not automatically provide equivalent permissions in production.

## 11. Sandbox Access

Sandbox environments can provide controlled access for experimentation and learning.

Example:

```bash
Sandbox Subscription
        │
        ├── Development Team
        ├── IT Team
        └── Approved Users
```

Sandbox access should still follow security and cost-management requirements.

## 12. Separation of Duties

NovaSol Enterprise separates responsibilities where practical.

Example:

```bash
Identity Administration
        │
        ▼
Microsoft Entra Administration

Azure Resource Administration
        │
        ▼
Azure RBAC

Security Operations
        │
        ▼
Security Administration
```

This reduces the risk of a single account having unnecessary control over identity, infrastructure, and security functions.

## 13. Least Privilege

Least privilege is a core principle of the NovaSol Enterprise RBAC model.

Instead of:

```bash
User
  │
  └── Owner
       │
       └── Entire Subscription
```

Prefer:

```bash
User
  │
  ▼
Security Group
  │
  ▼
Specific Azure Role
  │
  ▼
Required Resource Group
```

Permissions should be granted only when required for the user's responsibilities.

## 14. Privileged Access

Highly privileged roles should receive additional protection.

Examples include:

- Owner
- User Access Administrator
- Privileged administrative roles

NovaSol Enterprise should use appropriate controls such as:

- Multi-factor authentication
- Privileged Identity Management where available
- Just-in-time privileged access
- Administrative accounts
- Access reviews
- Audit logging

Privileged access should be granted only when necessary.

## 15. Administrative Account Strategy

Administrative activities should use dedicated administrative identities where appropriate.

Example:

```bash
Standard User Account
        │
        └── Normal Business Activities

Administrative Account
        │
        └── Privileged Azure Administration
```

This reduces exposure of privileged permissions during normal activities.

## 16. Access Reviews

Access should be reviewed periodically.

Example process:

```bash
Role Assignment
      │
      ▼
Access Review
      │
 ┌────┴────┐
 │         │
Required  Not Required
 │         │
Keep      Remove
```

Access reviews should verify:

- User membership
- Group membership
- Assigned roles
- Assignment scope
- Business justification
- Privileged access

## 17. RBAC Governance

NovaSol Enterprise RBAC governance includes:

- Least privilege
- Group-based assignments
- Appropriate role selection
- Scope minimization
- Access reviews
- Privileged access controls
- Separation of duties
- Administrative identity protection

## 18. Example RBAC Architecture

```bash
Microsoft Entra ID
        │
        ├── Cloud Admins
        ├── Cloud Operators
        ├── Security Team
        ├── Developers
        └── Readers
                 │
                 ▼
             Azure RBAC
                 │
        ┌────────┼────────┐
        ▼        ▼        ▼
   Management  Subscription  Resource Group
                           │
                           ▼
                        Resource
```

This model provides centralized identity management while maintaining granular Azure resource permissions.

## 19. Portfolio Implementation

This project will demonstrate RBAC through:

- RBAC architecture diagrams
- Role-assignment tables
- Scope definitions
- Least-privilege examples
- Group-based access models
- Production access controls
- Development access controls
- Terraform configuration

Actual role assignments are not required at this stage.

The RBAC model can later be implemented in Azure when an appropriate subscription is available.

## 20. Design Decisions

### Decision 1 — Separate Entra roles from Azure RBAC

Identity administration and Azure resource access are treated as separate authorization models.

### Decision 2 — Group-based assignments

Azure permissions should generally be assigned to Microsoft Entra security groups rather than individual users.

### Decision 3 — Least privilege

Users receive only the permissions required for their responsibilities.

### Decision 4 — Minimize scope

Roles should be assigned at the lowest practical scope.

### Decision 5 — Protect production

Production access is more restrictive than development and sandbox access.

### Decision 6 — Review privileged access

Highly privileged assignments should be reviewed regularly.

## 21. Success Criteria

The RBAC design is considered successful when:

- Microsoft Entra roles are clearly distinguished from Azure RBAC.
- Roles are assigned using least privilege.
- Access is managed through groups where practical.
- Production access is appropriately restricted.
- Development teams have suitable access to development resources.
- Privileged access is protected.
- Role assignments are auditable.
- Access reviews can be performed.
- The model can be implemented using Infrastructure as Code.

## 22. Project Status

**Status:** Design Completed

The RBAC model has been designed for the NovaSol Enterprise Azure Landing Zone.

Next steps include:

1. Tagging strategy
2. Monitoring architecture
3. Design decisions
4. Architecture diagrams
5. Terraform implementation
