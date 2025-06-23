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


resource "azurerm_management_group" "platform" {
  name        = "platform"
  display_name = "platform"
  parent_management_group_id = var.root_management_group_id # Use the root management group ID directly
}

resource "azurerm_management_group" "environments" {
  name        = "environments"
  display_name = "environments"
  parent_management_group_id = var.root_management_group_id # Use the root management group ID directly
}

resource "azurerm_management_group" "Development" {
  name        = "ims-environments-development"
  display_name = "ims-environments-development"
  parent_management_group_id = azurerm_management_group.environments.id
}

resource "azurerm_management_group" "envproduction" {
  name        = "ims-environments-production"
  display_name = "ims-environments-production"
  parent_management_group_id = azurerm_management_group.environments.id
}

resource "azurerm_management_group" "sandbox" {
  name        = "ims-sandbox"
  display_name = "ims-sandbox"
  parent_management_group_id = var.root_management_group_id # Use the root management group ID directly
}

resource "azurerm_management_group" "decommissioned" {
  name        = "ims-decommissioned"
  display_name = "ims-decommissioned"
  parent_management_group_id = var.root_management_group_id # Use the root management group ID directly
}

resource "azurerm_management_group" "non_prod" {
  name        = "ims-platform-nonprod"
  display_name = "ims-platform-nonprod"
  parent_management_group_id = azurerm_management_group.platform.id
}


resource "azurerm_management_group" "production" {
  name        = "ims-platform-prod"
  display_name = "ims-platform-production"
  parent_management_group_id = azurerm_management_group.platform.id
}

# Vulnerable resource: Storage account with public access enabled (detected by terrascan)
# resource "azurerm_storage_account" "vulnerable" {
#   name                     = "vulnstorageacct123"
#   resource_group_name      = var.backend_resource_group_name
#   location                 = "eastus"
#   account_tier             = "Standard"
#   account_replication_type = "LRS"

#   allow_blob_public_access = true # This is a vulnerability
# }
