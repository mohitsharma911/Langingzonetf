variable "top_level_management_group_prefix" {
  description = "Prefix used for the management group hierarchy."
  type        = string
}

variable "top_level_management_group_suffix" {
  description = "Optional suffix for the management group hierarchy."
  type        = string
}

variable "top_level_management_group_display_name" {
  description = "Display name for top level management group."
  type        = string
}

variable "top_level_management_group_parent_id" {
  description = "Optional parent for Management Group hierarchy."
  type        = string
  default     = ""
}

variable "landing_zone_mg_defaults_enable" {
  description = "Deploys Corp & Online Management Groups beneath IMS Root Management Group if set to true."
  type        = bool
  default     = true
}

variable "platform_mg_defaults_enable" {
  description = "Deploys Management, Identity and Connectivity Management Groups beneath Platform Management Group if set to true."
  type        = bool
  default     = true
}

variable "landing_zone_mg_children" {
  description = "Dictionary Object to allow additional or different child Management Groups of IMS Root Management Group to be deployed."
  type        = map(any)
  default     = {}
}

variable "platform_mg_children" {
  description = "Dictionary Object to allow additional or different child Management Groups of Platform Management Group to be deployed."
  type        = map(any)
  default     = {}
}

variable "telemetry_opt_out" {
  description = "Set Parameter to true to Opt-out of deployment telemetry."
  type        = bool
  default     = false
}

variable "root_management_group_name" {
  description = "The name of the root management group."
  type        = string
}

variable "root_management_group_display_name" {
  description = "The display name of the root management group."
  type        = string
  default = var.root_management_group_name
}

variable "platform_management_group_name" {
  description = "The name of the platform management group."
  type        = string
}

variable "platform_management_group_display_name" {
  description = "The display name of the platform management group."
  type        = string
  default = var.platform_management_group_name
}

variable "environments_management_group_name" {
  description = "The name of the environments management group."
  type        = string
}

variable "environments_management_group_display_name" {
  description = "The display name of the environments management group."
  type        = string
  default = var.environments_management_group_name
}

variable "sandbox_management_group_name" {
  description = "The name of the sandbox management group."
  type        = string
}

variable "sandbox_management_group_display_name" {
  description = "The display name of the sandbox management group."
  type        = string
  default = var.sandbox_management_group_name
}

variable "decommissioned_management_group_name" {
  description = "The name of the decommissioned management group."
  type        = string
}

variable "decommissioned_management_group_display_name" {
  description = "The display name of the decommissioned management group."
  type        = string
  default = var.decommissioned_management_group_name
}