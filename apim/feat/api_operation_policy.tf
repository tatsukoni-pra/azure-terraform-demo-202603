resource "azurerm_api_management_api_operation_policy" "feat_get_feathttptrigger" {
  api_name            = azurerm_api_management_api.feat.name
  api_management_name = var.api_management_name
  resource_group_name = var.resource_group_name
  operation_id        = azurerm_api_management_api_operation.feat_get_feathttptrigger.operation_id
  xml_content         = local.api_operation_policy_content
}
