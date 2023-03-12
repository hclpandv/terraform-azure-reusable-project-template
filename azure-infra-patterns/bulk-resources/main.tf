#----------------------
locals {
  storage_account_files = fileset("./resources", "*.yml")
}

#---------Storage accounts
resource "azurerm_storage_account" "storage_accounts" {
  for_each = { for file in local.storage_account_files : replace(file, ".yml", "") => yamldecode(file("${path.module}/resources/${file}")) }

  name                     = each.key
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  tags                     = each.value.tags
}
