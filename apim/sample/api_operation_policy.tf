resource "azurerm_api_management_api_operation_policy" "sample_get_response" {
  api_name            = azurerm_api_management_api.sample.name
  api_management_name = var.api_management_name
  resource_group_name = var.resource_group_name
  operation_id        = azurerm_api_management_api_operation.sample_get_response.operation_id
  xml_content         = local.api_operation_policy_content
}
