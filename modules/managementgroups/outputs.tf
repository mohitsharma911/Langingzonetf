output "management_group_ids" {
  value = {
    ims_root_group_id    = azurerm_management_group.IMS_root.id
    platform_group_id     = azurerm_management_group.platform.id
    environments_group_id  = azurerm_management_group.environments.id
    sandbox_group_id      = azurerm_management_group.sandbox.id
    non_prod_group_id     = azurerm_management_group.non_prod.id
    decommissioned_group_id = azurerm_management_group.decommissioned.id
  }
}