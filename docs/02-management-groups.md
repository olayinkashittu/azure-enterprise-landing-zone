### NovaSol Enterprise hierarchy

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

Think of it like an organizational structure:

```bash
Management Groups
       ↓
Subscriptions
       ↓
Resource Groups
       ↓
Azure Resources
```bash

### Example

A production application might eventually look like:

```bash
NovaSol Enterprise
       ↓
Landing Zones
       ↓
Corp
       ↓
Production Subscription
       ↓
rg-ns-prod-app
       ↓
VNet / App Service / Storage / Database
```

While security services could sit under:

```bash
NovaSol Enterprise
       ↓
Platform
       ↓
Security
       ↓
Security Subscription
```

This separation gives us a foundation for applying **different policies and governance controls at different scopes.** 
