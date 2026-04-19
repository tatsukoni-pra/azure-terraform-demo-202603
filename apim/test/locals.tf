locals {
  service_name     = "tatsukoni"
  api_service_name = "test"
  api_type_http    = "http"
  api_protocols    = ["https"]
  get_method       = "GET"
  revision         = "1"

  api_name         = "func-${local.service_name}-${local.api_service_name}"
  api_display_name = "func-${local.service_name}-${local.api_service_name}"
  api_description  = "Import from \"func-${local.service_name}-${local.api_service_name}\" Function App"
}
