terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.97.0"
    }
  }
}
terraform {
  backend "azurerm" {
        resource_group_name  = "test-poc"
        storage_account_name = "teststate"
        container_name       = "test"
        key                  = "terraform786.tfstate"
  }
}
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "rg-demo" {
  name     = "rg-${var.namespace}-demo"
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg-demo.name
  location                 = azurerm_resource_group.rg-demo.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.account_replication_type

  tags = {
    environment = var.environment
  }
}

