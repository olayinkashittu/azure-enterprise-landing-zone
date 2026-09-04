# NovaSol Enterprise Security Baseline

locals {
  security_baseline = {
    identity = {
      control  = "Identity and Access Management"
      standard = "Least privilege and role-based access control"
      status   = "Planned"
    }

    network_security = {
      control  = "Network Security"
      standard = "Network segmentation and restricted inbound access"
      status   = "Planned"
    }

    encryption = {
      control  = "Data Encryption"
      standard = "Encryption at rest and in transit"
      status   = "Planned"
    }

    security_monitoring = {
      control  = "Security Monitoring"
      standard = "Centralized security monitoring and alerting"
      status   = "Planned"
    }

    defender_for_cloud = {
      control  = "Microsoft Defender for Cloud"
      standard = "Cloud security posture management and workload protection"
      status   = "Planned"
    }
  }
}
