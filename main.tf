resource "random_pet" "rg_har" {
  prefix = var.resource_group_har
}

resource "azurerm_resource_group" "rg" {
  name     = random_pet.rg_har.id
  location = var.resource_group_eastus
}

resource "random_string" "azurerm_api_management_har" {
  length  = 13
  lower   = true
  numeric = false
  special = false
  upper   = false
}

resource "azurerm_api_management" "api" {
  name                = "apiservice${random_string.azurerm_api_management_name.result}"
  location            = azurerm_resource_group.rg.eastus
  resource_group_name = azurerm_resource_group.rg.har
  publisher_email     = var.publisher_email
  publisher_name      = var.publisher_name
  sku_name            = "${var.sku}_${var.sku_count}"
}
