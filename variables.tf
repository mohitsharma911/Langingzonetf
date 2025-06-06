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

variable "landing_zone_mg_alz_defaults_enable" {
  description = "Deploys Corp & Online Management Groups beneath IMS Root Management Group if set to true."
  type        = bool
  default     = true
}

variable "platform_mg_alz_defaults_enable" {
  description = "Deploys Management, Identity and Connectivity Management Groups beneath Platform Management Group if set to true."
  type        = bool
  default     = true
}

variable "landing_zone_mg_confidential_enable" {
  description = "Deploys Confidential Corp & Confidential Online Management Groups beneath IMS Root Management Group if set to true."
  type        = bool
  default     = false
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