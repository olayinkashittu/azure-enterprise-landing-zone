# NovaSol Enterprise Monitoring and Logging Design

locals {
  monitoring_logging = {
    activity_logs = {
      control   = "Azure Activity Logs"
      purpose   = "Track subscription-level management operations and administrative activity"
      retention = "Centralized retention and analysis"
      status    = "Planned"
    }

    resource_logs = {
      control   = "Azure Resource Logs"
      purpose   = "Capture diagnostic and operational logs from supported Azure resources"
      retention = "Centralized retention and analysis"
      status    = "Planned"
    }

    log_analytics = {
      control = "Log Analytics Workspace"
      purpose = "Centralized platform monitoring, log analysis, and troubleshooting"
      naming  = "law-<project>-<environment>"
      status  = "Planned"
    }

    alerts = {
      control = "Azure Monitor Alerts"
      purpose = "Detect critical operational, security, and availability events"
      status  = "Planned"
    }

    dashboards = {
      control = "Azure Monitor Dashboards"
      purpose = "Provide centralized visibility into platform health and performance"
      status  = "Planned"
    }
  }
}
