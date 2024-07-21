output "resource_group_har" {
  value = azurerm_resource_group.rg.har
}

output "api_management_service_har" {
  value = azurerm_api_management.api.har
}
