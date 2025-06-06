resource "azurerm_management_group" "root" {
  name        = var.root_management_group_name
  display_name = var.root_management_group_display_name
}

resource "azurerm_management_group" "platform" {
  name        = var.platform_management_group_name
  display_name = var.platform_management_group_display_name
  parent_management_group_id = azurerm_management_group.root.id
}

resource "azurerm_management_group" "environments" {
  name        = var.environments_management_group_name
  display_name = var.environments_management_group_display_name
  parent_management_group_id = azurerm_management_group.platform.id
}

resource "azurerm_management_group" "sandbox" {
  name        = var.sandbox_management_group_name
  display_name = var.sandbox_management_group_display_name
  parent_management_group_id = azurerm_management_group.environments.id
}

resource "azurerm_management_group" "decommissioned" {
  name        = var.decommissioned_management_group_name
  display_name = var.decommissioned_management_group_display_name
  parent_management_group_id = azurerm_management_group.environments.id
}