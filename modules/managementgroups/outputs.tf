output "management_group_ids" {
  value = {
    tenant_root_group_id = azurerm_management_group.tenant_root_group.id
    platform_group_id     = azurerm_management_group.platform_group.id
    environments_group_id  = azurerm_management_group.environments_group.id
    sandbox_group_id      = azurerm_management_group.sandbox_group.id
    decommissioned_group_id = azurerm_management_group.decommissioned_group.id
  }
}