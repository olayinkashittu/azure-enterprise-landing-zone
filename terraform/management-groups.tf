# NovaSol Enterprise Management Group Hierarchy

resource "azurerm_management_group" "novasol_root" {
  display_name = "NovaSol Enterprise"
  name         = "novasol-root"
}

resource "azurerm_management_group" "platform" {
  display_name               = "Platform"
  name                       = "novasol-platform"
  parent_management_group_id = azurerm_management_group.novasol_root.id
}

resource "azurerm_management_group" "management" {
  display_name               = "Management"
  name                       = "novasol-management"
  parent_management_group_id = azurerm_management_group.platform.id
}

resource "azurerm_management_group" "security" {
  display_name               = "Security"
  name                       = "novasol-security"
  parent_management_group_id = azurerm_management_group.platform.id
}

resource "azurerm_management_group" "landing_zones" {
  display_name               = "Landing Zones"
  name                       = "novasol-landing-zones"
  parent_management_group_id = azurerm_management_group.novasol_root.id
}

resource "azurerm_management_group" "corp" {
  display_name               = "Corp"
  name                       = "novasol-corp"
  parent_management_group_id = azurerm_management_group.landing_zones.id
}

resource "azurerm_management_group" "online" {
  display_name               = "Online"
  name                       = "novasol-online"
  parent_management_group_id = azurerm_management_group.landing_zones.id
}

resource "azurerm_management_group" "sandbox" {
  display_name               = "Sandbox"
  name                       = "novasol-sandbox"
  parent_management_group_id = azurerm_management_group.novasol_root.id
}

resource "azurerm_management_group" "decommissioned" {
  display_name               = "Decommissioned"
  name                       = "novasol-decommissioned"
  parent_management_group_id = azurerm_management_group.novasol_root.id
}

