resource "azurerm_cosmosdb_account" "cosmosdb_account_feat" {
  name                   = "${local.service_name}-${local.api_service_name}-${var.env}"
  location               = var.resource_group.location
  resource_group_name    = var.resource_group.name
  default_identity_type  = local.default_identity_type
  offer_type             = local.offer_type
  kind                   = local.kind
  network_acl_bypass_ids = local.network_acl_bypass_ids
  free_tier_enabled      = false

  tags = {
    defaultExperience       = local.defaultExperience
    hidden-cosmos-mmspecial = local.hidden_cosmos_mmspecial
    env                     = var.env
    service                 = local.service_name
  }

  consistency_policy {
    consistency_level       = local.consistency_level
    max_interval_in_seconds = local.max_interval_in_seconds
    max_staleness_prefix    = local.max_staleness_prefix
  }

  geo_location {
    location          = var.resource_group.location
    failover_priority = local.failover_priority
  }

  # prd以外: サーバーレス容量プラン（使った分だけ課金）
  dynamic "capabilities" {
    for_each = var.env != "prd" ? [1] : []
    content {
      name = "EnableServerless"
    }
  }

  backup {
    type                = "Periodic"
    interval_in_minutes = 60
    retention_in_hours  = 720
    storage_redundancy  = "Geo"
  }
}
