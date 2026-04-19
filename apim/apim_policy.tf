resource "azurerm_api_management_policy" "api_policy" {
  api_management_id = azurerm_api_management.api_management.id
  xml_content       = local.api_policy_content
}
