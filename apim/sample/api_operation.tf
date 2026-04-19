resource "azurerm_api_management_api_operation" "sample_get_response" {
  api_name            = azurerm_api_management_api.sample.name
  api_management_name = var.api_management_name
  resource_group_name = var.resource_group_name
  display_name        = "sampleResponse"
  method              = local.get_method
  url_template        = "/response"
  operation_id        = "sampleresponse"

  response {
    status_code = 200
    description = "200 OK"

    representation {
      content_type = "application/json"

      example {
        name  = "default"
        value = jsonencode({ status = "ok", message = "this is a fixed response" })
      }
    }
  }
}
