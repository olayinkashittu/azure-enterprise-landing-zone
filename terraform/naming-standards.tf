# NovaSol Enterprise Naming Standards

locals {
  naming_standards = {
    resource_group  = "rg-<project>-<environment>-<workload>"
    virtual_network = "vnet-<project>-<environment>-<workload>"
    subnet          = "snet-<workload>"
    storage_account = "st<project><environment><workload>"
    key_vault       = "kv-<project>-<environment>"
    log_analytics   = "law-<project>-<environment>"
  }
}
