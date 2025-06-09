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

# Define the root management group under the tenant
resource "azurerm_management_group" "ims_root" {
  name      = var.parent_management_group_name
  display_name = var.parent_management_group_name
  parent_management_group_id = var.root_management_group_id # This is implicitly the tenant root
}
# Example usage of the management group resource ID (path):
output "management_group_id" {
  value = azurerm_management_group.ims_root.id
}
# Tier 1 Groups
resource "azurerm_management_group" "tier1" {
  for_each = var.child_management_groups
  display_name = each.value
  name         = each.key
  parent_management_group_id = azurerm_management_group.ims_root.id
}