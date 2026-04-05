resource "azurerm_cosmosdb_sql_database" "featdatabase" {
  name                = "FeatDatabase"
  resource_group_name = var.resource_group.name
  account_name        = azurerm_cosmosdb_account.cosmosdb_account_feat.name

  # prd: プロビジョニングされたスループットのため、RU/sを指定
  dynamic "autoscale_settings" {
    for_each = var.env == "prd" ? [1] : []
    content {
      max_throughput = local.sql_database_max_throughput
    }
  }
}
