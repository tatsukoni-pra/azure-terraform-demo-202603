resource "azurerm_api_management_api_operation" "test_get_testhttptrigger" {
  api_name            = azurerm_api_management_api.test.name
  api_management_name = var.api_management_name
  resource_group_name = var.resource_group_name
  display_name        = "testHttpTrigger"
  method              = local.get_method
  url_template        = "/testHttpTrigger"
  operation_id        = "get-testhttptrigger"
}

resource "azurerm_api_management_api_operation" "test_get_testhttptrigger2" {
  api_name            = azurerm_api_management_api.test.name
  api_management_name = var.api_management_name
  resource_group_name = var.resource_group_name
  display_name        = "testHttpTrigger2"
  method              = local.get_method
  url_template        = "/testHttpTrigger2"
  operation_id        = "get-testhttptrigger2"
}
