terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  required_version = ">= 0.11"
}

provider "azurerm" {
  features {}
}
data "azurerm_client_config" "current" {}
 
resource "azurerm_resource_group" "tamopsrg" {
  name     = "tamops-tf"
  location = "eastus2"
}
 
resource "azurerm_storage_account" "tamopssa" {
  name                     = "tamopssatf"
  resource_group_name      = azurerm_resource_group.tamopsrg.name
  location                 = azurerm_resource_group.tamopsrg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
} 

