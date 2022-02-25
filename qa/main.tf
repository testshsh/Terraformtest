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
        resource_group_name  = "test-poc1"
        storage_account_name = "terraformstate786"
        container_name       = "terraformstate"
        key                  = "terraform1.tfstate"
  }
}
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "rgs" {
  name  = "${var.resource_group_name}-${var.environment}"
  location = var.location
}

resource "azurerm_storage_account" "sgt" {
  name 					   = "${var.storage_account_name}${var.environment}"
  resource_group_name      = azurerm_resource_group.rgs.name
  location                 = azurerm_resource_group.rgs.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.account_replication_type

  tags = {
    environment = var.environment
  }
}
