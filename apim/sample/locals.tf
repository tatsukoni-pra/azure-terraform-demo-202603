locals {
  api_service_name = "sample"
  api_type_http    = "http"
  api_protocols    = ["https"]
  get_method       = "GET"
  revision         = "1"

  api_name         = "sample-api"
  api_display_name = "sample-api"
  api_description  = ""

  api_operation_policy_content = file("${path.module}/api_policy_config/operation_scope/dev_sample_policy.xml")
}
