output "azurerm_api_management" {
  value = azurerm_api_management.api_management
}

output "rg_tatsukoni" {
  value = data.azurerm_resource_group.rg_tatsukoni
}
