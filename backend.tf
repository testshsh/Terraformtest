terraform {
  backend "azurerm" {
    resource_group_name   = "Test-Poc"
    storage_account_name  = "testpoc1"
    container_name        = "testingtfstate"
    key                   = "terraform.tfstate"
  }
}
