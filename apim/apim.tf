resource "azurerm_api_management" "api_management" {
  name                = local.api_management_config.name
  resource_group_name = data.azurerm_resource_group.rg_tatsukoni.name
  location            = data.azurerm_resource_group.rg_tatsukoni.location
  publisher_name      = local.api_management_config.publisher_name
  publisher_email     = local.api_management_config.publisher_email

  sku_name = local.api_management_config.sku_name

  tags = {
    env     = var.env
    service = local.service_name
  }
}
