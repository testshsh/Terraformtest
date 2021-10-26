
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "terraformtest" {
  name     = "azure-functions-test-rg786001"
  location = "West Europe"
}

resource "azurerm_storage_account" "terraformtest1" {
  name                     = "satestingteraform7861"
  resource_group_name      = azurerm_resource_group.terraformtest.name
  location                 = azurerm_resource_group.terraformtest.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  }

resource "azurerm_app_service_plan" "terraformtest2" {
  name                = "azure-functions-test-service-plan201"
  location            = azurerm_resource_group.terraformtest.location
  resource_group_name = azurerm_resource_group.terraformtest.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_function_app" "terraformtest3" {
  name                       = "test-azure-functions7860"
  location                   = azurerm_resource_group.terraformtest.location
  resource_group_name        = azurerm_resource_group.terraformtest.name
  app_service_plan_id        = azurerm_app_service_plan.terraformtest2.id
  storage_account_name       = azurerm_storage_account.terraformtest1.name
  storage_account_access_key = azurerm_storage_account.terraformtest1.primary_access_key
}
