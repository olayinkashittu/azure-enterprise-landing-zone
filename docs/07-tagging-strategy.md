# Tagging Strategy

## 1. Overview

Tags provide metadata that helps NovaSol Enterprise organize, manage, secure, and track Azure resources.

The tagging strategy establishes consistent metadata across Azure resources and supports:

- Cost management
- Resource ownership
- Environment identification
- Department identification
- Application identification
- Operational management
- Governance
- Reporting
- Automation

Tags should be applied consistently and governed through Azure Policy where appropriate.

## 2. Tagging Objectives

NovaSol Enterprise uses tags to:

1. Identify resource ownership.
2. Identify the environment where a resource operates.
3. Associate resources with applications.
4. Support cost allocation.
5. Improve resource management.
6. Support governance and compliance.
7. Enable reporting and automation.
8. Improve operational visibility.

## 3. Required Tags

The following tags form the initial NovaSol Enterprise tagging standard.

| Tag | Example | Purpose |
|---|---|---|
| Environment | Production | Identifies the environment |
| Department | IT | Identifies the responsible department |
| Application | CustomerPortal | Identifies the workload |
| Owner | CloudTeam | Identifies the responsible team |
| CostCenter | IT-001 | Supports cost allocation |

Example:

```bash
Environment = Production
Department  = IT
Application = CustomerPortal
Owner       = CloudTeam
CostCenter  = IT-001
```

## 4. Environment Tag

The `Environment` tag identifies the lifecycle environment.

Approved values include:

```bash
Production
Development
Testing
Sandbox
```

Example:

```bash
Environment = Production
```

This allows resources to be identified and filtered according to their environment.

## 5. Department Tag

The `Department` tag identifies the business or technical department responsible for the resource.

Example values:

```bash
IT
Security
Development
Finance
HR
```

Example:

```bash
Department = IT
```

Department ownership can be used for reporting and operational accountability.

## 6. Application Tag

The `Application` tag identifies the workload or application associated with a resource.

Example:

```bash
Application = CustomerPortal
```

For shared resources that support multiple workloads, an agreed organizational value should be used instead of assigning an inaccurate application name.

Example:

```bash
Application = SharedServices
```

## 7. Owner Tag

The `Owner` tag identifies the team responsible for the resource.

Example:

```bash
Owner = CloudTeam
```

Possible values include:

```bash
CloudTeam
SecurityTeam
NetworkTeam
DevelopmentTeam
DataTeam
```

The owner should be an accountable team rather than an individual's personal name where possible.

## 8. CostCenter Tag

The `CostCenter` tag supports financial reporting and cost allocation.

Example:

```bash
CostCenter = IT-001
```

Cost-center values should follow NovaSol Enterprise's internal financial structure.

Example:

| Department | Cost Center |
|---|---|
| IT | IT-001 |
| Security | SEC-001 |
| Development | DEV-001 |
| Finance | FIN-001 |
| HR | HR-001 |

## 9. Optional Tags

Additional tags may be introduced when required.

Examples include:

| Tag | Example | Purpose |
|---|---|---|
| Project | CloudMigration | Identifies a project |
| Criticality | High | Identifies business importance |
| DataClassification | Confidential | Identifies data sensitivity |
| BusinessUnit | Corporate | Identifies business ownership |
| ManagedBy | Terraform | Identifies management method |
| ExpirationDate | 2026-12-31 | Supports temporary-resource cleanup |

Optional tags should only be introduced when they provide a clear operational or governance benefit.

## 10. Tag Naming Convention

Tag names should use a consistent format.

NovaSol Enterprise uses:

```bash
PascalCase
```

Examples:

```bash
Environment
Department
Application
Owner
CostCenter
DataClassification
ManagedBy
```

Avoid inconsistent variations such as:

```bash
environment
ENVIRONMENT
environment_name
Env
```

A standardized naming convention improves automation, reporting, and governance.

## 11. Tag Values

Tag values should also follow defined standards.

For example:

```bash
Environment = Production
Environment = Development
Environment = Testing
Environment = Sandbox
```

Avoid creating multiple values that represent the same environment.

For example, the following should not be used interchangeably:

```bash
Production
Prod
PROD
production
```

Instead, use one approved value:

```bash
Production
```

## 12. Example Production Tags

Example resource:

```bash
Resource: Customer Portal Application
```

Tags:

```bash
Environment = Production
Department = IT
Application = CustomerPortal
Owner = CloudTeam
CostCenter = IT-001
ManagedBy = Terraform
```

## 13. Example Development Tags

Example:

```bash
Environment = Development
Department = Development
Application = CustomerPortal
Owner = DevelopmentTeam
CostCenter = DEV-001
ManagedBy = Terraform
```

Development resources should clearly identify themselves as non-production.

## 14. Example Sandbox Tags

Example:

```bash
Environment = Sandbox
Department = IT
Application = AzureLab
Owner = CloudTeam
CostCenter = IT-001
ManagedBy = Terraform
```

Sandbox resources may also use an expiration tag to support cleanup.

Example:

```bash
ExpirationDate = 2026-12-31
```

## 15. Tagging and Azure Policy

Azure Policy can be used to enforce the tagging strategy.

Example:

```bash
Resource Deployment
        │
        ▼
Required Tags
        │
   ┌────┴────┐
   │         │
Present    Missing
   │         │
Compliant  Non-Compliant
```

Policies can:

- Audit missing tags.
- Deny resources without required tags.
- Modify resources where appropriate.
- Support consistent governance.

For important production workloads, enforcement should be introduced carefully after testing.

## 16. Tagging Governance

NovaSol Enterprise establishes the following governance rules:

1. Required tags should be defined centrally.
2. Tag names should remain consistent.
3. Approved values should be documented.
4. Ownership information should remain current.
5. Tags should be reviewed periodically.
6. Azure Policy should be used where appropriate.
7. Temporary resources should have lifecycle metadata where useful.

## 17. Tagging at Different Scopes

Tags can be applied to supported Azure resources and resource groups.

Example:

```bash
Subscription
     │
     ▼
Resource Group
     │
     ▼
Azure Resource
```

Resource-group tags can provide common metadata for a group of related resources.

Individual resources can contain additional tags when more detailed information is required.

## 18. Cost Management

Tags can support cost analysis by associating resources with:

- Departments
- Applications
- Owners
- Cost centers
- Projects
- Environments

Example:

```bash
CostCenter = IT-001
Department = IT
Application = CustomerPortal
```

This allows cloud costs to be analyzed according to organizational ownership.

Tags should complement, not replace, subscription and resource-group boundaries used for governance and cost management.

## 19. Automation

Tags can be used by automation processes.

Example:

```bash
ExpirationDate = 2026-12-31
```

An automation process could identify temporary resources approaching their expiration date.

Another example:

```bash
Environment = Development
```

Automation could use this metadata to apply appropriate operational processes to development resources.

Automation should be designed carefully to avoid accidentally modifying or deleting critical resources.

## 20. Tagging Lifecycle

The tagging lifecycle follows:

```bash
Define
  │
  ▼
Apply
  │
  ▼
Validate
  │
  ▼
Monitor
  │
  ▼
Review
  │
  ▼
Improve
```

Tag standards should evolve as NovaSol Enterprise's cloud environment grows.

## 21. Portfolio Implementation

This project will demonstrate the tagging strategy through:

- Tagging standards
- Tagging tables
- Example resource metadata
- Azure Policy examples
- Governance documentation
- Terraform configuration

Actual Azure resources are not required to demonstrate the tagging design.

The tagging strategy can later be implemented through Azure Policy and Infrastructure as Code.

## 22. Design Decisions

### Decision 1 — Standardized metadata

NovaSol Enterprise uses a defined set of standard tags.

### Decision 2 — Consistent values

Approved tag values are documented to prevent inconsistent metadata.

### Decision 3 — Team-based ownership

The `Owner` tag identifies responsible teams rather than individual users where possible.

### Decision 4 — Governance through Policy

Azure Policy can be used to audit or enforce required tags.

### Decision 5 — Cost visibility

Cost-center, department, application, and environment tags support financial reporting.

### Decision 6 — Lifecycle awareness

Temporary resources may use lifecycle-related metadata such as `ExpirationDate`.

## 23. Success Criteria

The tagging strategy is considered successful when:

- Required tags are clearly defined.
- Tag names follow a consistent convention.
- Approved values are documented.
- Resource ownership can be identified.
- Costs can be associated with organizational units.
- Production and non-production resources can be distinguished.
- Azure Policy can enforce tagging requirements.
- Tags can support automation and reporting.

## 24. Project Status

**Status:** Design Completed

The NovaSol Enterprise tagging strategy has been designed.

Completed governance areas include:

- Management groups
- Subscription strategy
- Resource organization
- Azure Policy
- RBAC
- Tagging strategy

Next steps include:

1. Monitoring architecture
2. Design decisions
3. Architecture diagrams
4. Terraform implementation
