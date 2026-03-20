module "test" {
  source         = "./test"
  env            = var.env
  resource_group = data.azurerm_resource_group.rg_tatsukoni
}

module "feat" {
  source         = "./feat"
  env            = var.env
  resource_group = data.azurerm_resource_group.rg_tatsukoni
}
