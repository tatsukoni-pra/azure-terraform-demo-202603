resource "azurerm_api_management_api_operation" "feat_get_feathttptrigger" {
  api_name            = azurerm_api_management_api.feat.name
  api_management_name = var.api_management_name
  resource_group_name = var.resource_group_name
  display_name        = "featHttpTrigger"
  method              = local.get_method
  url_template        = "/featHttpTrigger"
  operation_id        = "get-feathttptrigger"
}

resource "azurerm_api_management_api_operation" "feat_get_feathttptrigger2" {
  api_name            = azurerm_api_management_api.feat.name
  api_management_name = var.api_management_name
  resource_group_name = var.resource_group_name
  display_name        = "featHttpTrigger2"
  method              = local.get_method
  url_template        = "/featHttpTrigger2"
  operation_id        = "get-feathttptrigger2"
}
