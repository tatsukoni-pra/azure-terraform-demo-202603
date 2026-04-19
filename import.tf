import {
  to = azurerm_storage_account.tfstate
  id = "/subscriptions/ba29533e-1e4c-43a8-898a-a5815e9b577b/resourceGroups/rg-tatsukoni-stg/providers/Microsoft.Storage/storageAccounts/sttatsukonistgtfstate"
}

## APIM
import {
  to = module.apim[0].azurerm_api_management.api_management
  id = "/subscriptions/ba29533e-1e4c-43a8-898a-a5815e9b577b/resourceGroups/rg-tatsukoni-dev/providers/Microsoft.ApiManagement/service/apim-tatsukoni-demo"
}

import {
  to = module.apim[0].azurerm_api_management_policy.api_policy
  id = "/subscriptions/ba29533e-1e4c-43a8-898a-a5815e9b577b/resourceGroups/rg-tatsukoni-dev/providers/Microsoft.ApiManagement/service/apim-tatsukoni-demo"
}

## feat API
import {
  to = module.apim[0].module.feat.azurerm_api_management_api.feat
  id = "/subscriptions/ba29533e-1e4c-43a8-898a-a5815e9b577b/resourceGroups/rg-tatsukoni-dev/providers/Microsoft.ApiManagement/service/apim-tatsukoni-demo/apis/func-tatsukoni-feat"
}

import {
  to = module.apim[0].module.feat.azurerm_api_management_api_operation.feat_get_feathttptrigger
  id = "/subscriptions/ba29533e-1e4c-43a8-898a-a5815e9b577b/resourceGroups/rg-tatsukoni-dev/providers/Microsoft.ApiManagement/service/apim-tatsukoni-demo/apis/func-tatsukoni-feat/operations/get-feathttptrigger"
}

import {
  to = module.apim[0].module.feat.azurerm_api_management_api_operation.feat_get_feathttptrigger2
  id = "/subscriptions/ba29533e-1e4c-43a8-898a-a5815e9b577b/resourceGroups/rg-tatsukoni-dev/providers/Microsoft.ApiManagement/service/apim-tatsukoni-demo/apis/func-tatsukoni-feat/operations/get-feathttptrigger2"
}

import {
  to = module.apim[0].module.feat.azurerm_api_management_api_operation_policy.feat_get_feathttptrigger
  id = "/subscriptions/ba29533e-1e4c-43a8-898a-a5815e9b577b/resourceGroups/rg-tatsukoni-dev/providers/Microsoft.ApiManagement/service/apim-tatsukoni-demo/apis/func-tatsukoni-feat/operations/get-feathttptrigger"
}

## test API
import {
  to = module.apim[0].module.test.azurerm_api_management_api.test
  id = "/subscriptions/ba29533e-1e4c-43a8-898a-a5815e9b577b/resourceGroups/rg-tatsukoni-dev/providers/Microsoft.ApiManagement/service/apim-tatsukoni-demo/apis/func-tatsukoni-test"
}

import {
  to = module.apim[0].module.test.azurerm_api_management_api_operation.test_get_testhttptrigger
  id = "/subscriptions/ba29533e-1e4c-43a8-898a-a5815e9b577b/resourceGroups/rg-tatsukoni-dev/providers/Microsoft.ApiManagement/service/apim-tatsukoni-demo/apis/func-tatsukoni-test/operations/get-testhttptrigger"
}

import {
  to = module.apim[0].module.test.azurerm_api_management_api_operation.test_get_testhttptrigger2
  id = "/subscriptions/ba29533e-1e4c-43a8-898a-a5815e9b577b/resourceGroups/rg-tatsukoni-dev/providers/Microsoft.ApiManagement/service/apim-tatsukoni-demo/apis/func-tatsukoni-test/operations/get-testhttptrigger2"
}

## sample API
import {
  to = module.apim[0].module.sample.azurerm_api_management_api.sample
  id = "/subscriptions/ba29533e-1e4c-43a8-898a-a5815e9b577b/resourceGroups/rg-tatsukoni-dev/providers/Microsoft.ApiManagement/service/apim-tatsukoni-demo/apis/sample-api"
}

import {
  to = module.apim[0].module.sample.azurerm_api_management_api_operation.sample_get_response
  id = "/subscriptions/ba29533e-1e4c-43a8-898a-a5815e9b577b/resourceGroups/rg-tatsukoni-dev/providers/Microsoft.ApiManagement/service/apim-tatsukoni-demo/apis/sample-api/operations/sampleresponse"
}

import {
  to = module.apim[0].module.sample.azurerm_api_management_api_operation_policy.sample_get_response
  id = "/subscriptions/ba29533e-1e4c-43a8-898a-a5815e9b577b/resourceGroups/rg-tatsukoni-dev/providers/Microsoft.ApiManagement/service/apim-tatsukoni-demo/apis/sample-api/operations/sampleresponse"
}
