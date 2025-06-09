terraform {
  backend "azurerm" {
    resource_group_name  = "${var.backend_resource_group_name}"
    storage_account_name = "${var.backend_storage_account_name}"
    container_name       = "${var.backend_container_name}"
    key                  = "${var.backend_key}" # Path to the state file in the container
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_management_group" "IMS_root" {
  name        = "IMSRoot"
  display_name = "IMS Root Management Group"
  parent_management_group_id = "/providers/Microsoft.Management/managementGroups/eb769941-210d-4d69-9bcd-a22f54727ff8" # Replace with your actual root management group ID  
}

resource "azurerm_management_group" "platform" {
  name        = "Platform"
  display_name = "Platform Management Group"
  parent_management_group_id = azurerm_management_group.IMS_root.id
}

resource "azurerm_management_group" "environments" {
  name        = "Environments"
  display_name = "Environments Management Group"
  parent_management_group_id = azurerm_management_group.platform.id
}

resource "azurerm_management_group" "sandbox" {
  name        = "Sandbox"
  display_name = "Sandbox Management Group"
  parent_management_group_id = azurerm_management_group.platform.id
}

resource "azurerm_management_group" "non_prod" {
  name        = "NonProd"
  display_name = "Non-Production Management Group"
  parent_management_group_id = azurerm_management_group.platform.id
}

resource "azurerm_management_group" "production" {
  name        = "Production"
  display_name = "Production Management Group"
  parent_management_group_id = azurerm_management_group.platform.id
}

resource "azurerm_management_group" "decommissioned" {
  name        = "Decommissioned"
  display_name = "Decommissioned Management Group"
  parent_management_group_id = azurerm_management_group.platform.id
}