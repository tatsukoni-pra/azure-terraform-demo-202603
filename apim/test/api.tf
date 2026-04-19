resource "azurerm_api_management_api" "test" {
  name                  = local.api_name
  api_type              = local.api_type_http
  description           = local.api_description
  resource_group_name   = var.resource_group_name
  api_management_name   = var.api_management_name
  revision              = local.revision
  display_name          = local.api_display_name
  path                  = "api/${local.api_service_name}"
  protocols             = local.api_protocols
  subscription_required = false
}
