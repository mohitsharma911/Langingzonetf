variable "root_management_group_id" {
  description = "The ID of the root management group (usually your tenant ID or 'root')."
  type        = string
  default     = "/providers/Microsoft.Management/managementGroups/eb769941-210d-4d69-9bcd-a22f54727ff8"
}

variable "backend_resource_group_name" {
  description = "The name of the backend resource group"
  type        = string
}

variable "backend_storage_account_name" {
  description = "The name of the backend storage account"
  type        = string
}

variable "backend_container_name" {
  description = "The name of the backend container"
  type        = string
}

variable "backend_key" {
  description = "The key for the backend state file"
  type        = string
  default     = "managementgroups.terraform.tfstate"
}

# Management Group names and display names as per main.tf

variable "ims_root_name" {
  description = "The name of the IMS root management group."
  type        = string
  default     = "IMSRoot"
}

variable "ims_root_display_name" {
  description = "The display name of the IMS root management group."
  type        = string
  default     = "IMS Root"
}

variable "platform_name" {
  description = "The name of the platform management group."
  type        = string
  default     = "Platform"
}

variable "platform_display_name" {
  description = "The display name of the platform management group."
  type        = string
  default     = "Platform"
}

variable "environments_name" {
  description = "The name of the environments management group."
  type        = string
  default     = "Environments"
}

variable "environments_display_name" {
  description = "The display name of the environments management group."
  type        = string
  default     = "Environments"
}

variable "development_name" {
  description = "The name of the development management group."
  type        = string
  default     = "Development"
}

variable "development_display_name" {
  description = "The display name of the development management group."
  type        = string
  default     = "Development"
}

variable "test_name" {
  description = "The name of the test management group."
  type        = string
  default     = "Test"
}

variable "test_display_name" {
  description = "The display name of the test management group."
  type        = string
  default     = "Test"
}

variable "preproduction_name" {
  description = "The name of the preproduction management group."
  type        = string
  default     = "PreProduction"
}

variable "preproduction_display_name" {
  description = "The display name of the preproduction management group."
  type        = string
  default     = "PreProduction"
}

variable "envproduction_name" {
  description = "The name of the production management group under environments."
  type        = string
  default     = "Production"
}

variable "envproduction_display_name" {
  description = "The display name of the production management group under environments."
  type        = string
  default     = "Production"
}

variable "sandbox_name" {
  description = "The name of the sandbox management group."
  type        = string
  default     = "Sandbox"
}

variable "sandbox_display_name" {
  description = "The display name of the sandbox management group."
  type        = string
  default     = "Sandbox"
}

variable "decommissioned_name" {
  description = "The name of the decommissioned management group."
  type        = string
  default     = "Decommissioned"
}

variable "decommissioned_display_name" {
  description = "The display name of the decommissioned management group."
  type        = string
  default     = "Decommissioned"
}

variable "non_prod_name" {
  description = "The name of the non-production management group under platform."
  type        = string
  default     = "NonProd"
}

variable "non_prod_display_name" {
  description = "The display name of the non-production management group under platform."
  type        = string
  default     = "Non-Prod"
}

variable "platform_production_name" {
  description = "The name of the production management group under platform."
  type        = string
  default     = "Platform-Production"
}

variable "platform_production_display_name" {
  description = "The display name of the production management group under platform."
  type        = string
  default     = "Production"
}