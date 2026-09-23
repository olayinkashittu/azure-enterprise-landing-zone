# NovaSol Enterprise Subscription Strategy

locals {
  subscription_strategy = {
    management = {
      name             = "NovaSol-Management"
      purpose          = "Centralized management, governance, and shared services"
      management_group = "novasol-management"
    }

    security = {
      name             = "NovaSol-Security"
      purpose          = "Security, monitoring, and security operations"
      management_group = "novasol-security"
    }

    production = {
      name             = "NovaSol-Production"
      purpose          = "Production workloads"
      management_group = "novasol-corp"
    }

    development = {
      name             = "NovaSol-Development"
      purpose          = "Development and testing workloads"
      management_group = "novasol-corp"
    }

    sandbox = {
      name             = "NovaSol-Sandbox"
      purpose          = "Experimental and learning workloads"
      management_group = "novasol-sandbox"
    }
  }
}
