output "management_group_ids" {
  value = {
    platform_management_group_id = module.management_groups.platform_management_group_id
    landing_zone_management_group_id = module.management_groups.landing_zone_management_group_id
    sandbox_management_group_id = module.management_groups.sandbox_management_group_id
    decommissioned_management_group_id = module.management_groups.decommissioned_management_group_id
  }
}