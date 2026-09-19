# NovaSol Enterprise Cost Governance Design

locals {
  cost_governance = {
    cost_center = {
      control = "Cost Center Tagging"
      purpose = "Associate Azure resources with an accountable cost center"
      tag     = "CostCenter"
      value   = var.cost_center
      status  = "Planned"
    }

    ownership = {
      control = "Resource Ownership"
      purpose = "Identify the team responsible for each Azure resource"
      tag     = "Owner"
      value   = var.owner
      status  = "Planned"
    }

    environment = {
      control = "Environment Classification"
      purpose = "Identify the lifecycle environment of Azure resources"
      tag     = "Environment"
      value   = var.environment
      status  = "Planned"
    }

    budget_monitoring = {
      control = "Azure Cost Management Budgets"
      purpose = "Monitor planned spending and trigger notifications when cost thresholds are reached"
      status  = "Planned"
    }

    cost_analysis = {
      control = "Azure Cost Management Cost Analysis"
      purpose = "Review and analyze Azure spending by subscription, resource group, resource, and tags"
      status  = "Planned"
    }

    governance = {
      control = "Cost Governance Review"
      purpose = "Review resource ownership, tagging, budgets, and spending trends regularly"
      status  = "Planned"
    }
  }
}