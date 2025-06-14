terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.0"

  backend "azurerm" {}
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
  name        = "Production"
  display_name = "Production"
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
  name        = "Platform-Production"   # or "Platform_Production"
  display_name = "Production"
  parent_management_group_id = azurerm_management_group.platform.id
}
