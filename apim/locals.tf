locals {
  service_name     = "tatsukoni"
  backend_protocol = "http"

  api_policy_content = file("${path.module}/api_policy_config/global_scope/dev_api_policy.xml")

  api_management_config = {
    name            = "apim-${local.service_name}-demo"
    publisher_name  = "${local.service_name}1818"
    publisher_email = "${local.service_name}1818@gmail.com"
    sku_name        = "Consumption_0"
  }
}
