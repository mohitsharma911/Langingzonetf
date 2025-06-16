terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.0"

  backend "azurerm" {
    resource_group_name  = var.backend_resource_group_name
    storage_account_name = var.backend_storage_account_name
    container_name       = var.backend_container_name
    key                  = var.backend_key # Path to the state file in the container
    use_oidc_auth        = true
    use_azuread_auth     = true
  }
}

provider "azurerm" {
  features {}
}


resource "azurerm_management_group" "IMS_root" {
  name        = "IMSRoot"
  display_name = "IMS Root"
  parent_management_group_id = var.root_management_group_id # Replace with your actual root management group ID  
}

resource "azurerm_management_group" "platform" {
  name        = "Platform"
  display_name = "Platform"
  parent_management_group_id = azurerm_management_group.IMS_root.id
}

resource "azurerm_management_group" "environments" {
  name        = "Environments"
  display_name = "Environments"
  parent_management_group_id = azurerm_management_group.IMS_root.id
}

resource "azurerm_management_group" "Development" {
  name        = "Development"
  display_name = "Development"
  parent_management_group_id = azurerm_management_group.environments.id
}

resource "azurerm_management_group" "Test" {
  name        = "Test"
  display_name = "Test"
  parent_management_group_id = azurerm_management_group.environments.id
}

resource "azurerm_management_group" "PreProduction" {
  name        = "PreProduction"
  display_name = "PreProduction"
  parent_management_group_id = azurerm_management_group.environments.id
}

resource "azurerm_management_group" "envproduction" {
  name        = "ims-env-production"
  display_name = "ims-env-production"
  parent_management_group_id = azurerm_management_group.environments.id
}

resource "azurerm_management_group" "sandbox" {
  name        = "Sandbox"
  display_name = "Sandbox"
  parent_management_group_id = azurerm_management_group.IMS_root.id
}

resource "azurerm_management_group" "decommissioned" {
  name        = "Decommissioned"
  display_name = "Decommissioned"
  parent_management_group_id = azurerm_management_group.IMS_root.id
}

resource "azurerm_management_group" "non_prod" {
  name        = "NonProd"
  display_name = "Non-Prod"
  parent_management_group_id = azurerm_management_group.platform.id
}

resource "azurerm_management_group" "production" {
  name        = "ims-plat-prod"
  display_name = "ims-plat-prod"
  parent_management_group_id = azurerm_management_group.platform.id
}
