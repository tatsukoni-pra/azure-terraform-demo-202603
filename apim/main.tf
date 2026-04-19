module "feat" {
  source              = "./feat"
  env                 = var.env
  api_management_name = azurerm_api_management.api_management.name
  resource_group_name = data.azurerm_resource_group.rg_tatsukoni.name
}

module "test" {
  source              = "./test"
  env                 = var.env
  api_management_name = azurerm_api_management.api_management.name
  resource_group_name = data.azurerm_resource_group.rg_tatsukoni.name
}

module "sample" {
  source              = "./sample"
  env                 = var.env
  api_management_name = azurerm_api_management.api_management.name
  resource_group_name = data.azurerm_resource_group.rg_tatsukoni.name
}
