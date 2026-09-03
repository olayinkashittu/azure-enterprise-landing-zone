# NovaSol Enterprise Subscription Strategy

locals {
  subscription_strategy = {
    management = {
      name             = "NovaSol-Management"
      purpose          = "Centralized management, governance, and shared services"
      management_group = "novasol-platform"
    }

    security = {
      name             = "NovaSol-Security"
      purpose          = "Security, monitoring, and security operations"
      management_group = "novasol-platform"
    }

    production = {
      name             = "NovaSol-Production"
      purpose          = "Production workloads"
      management_group = "novasol-landing-zones"
    }

    development = {
      name             = "NovaSol-Development"
      purpose          = "Development and testing workloads"
      management_group = "novasol-landing-zones"
    }

    sandbox = {
      name             = "NovaSol-Sandbox"
      purpose          = "Experimental and learning workloads"
      management_group = "novasol-sandbox"
    }
  }
}
