resource "azurerm_network_manager" "avnm" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  tags                = var.tags
  description         = var.description


  dynamic "scope" {
    for_each = var.scope != null ? var.scope : []
    content {
      management_group_ids = scope.value.management_group_ids
      subscription_ids     = scope.value.subscription_ids
    }
  }
  scope_accesses = var.scope_accesses
}


resource "azurerm_network_manager_network_group" "groups" {
  for_each           = toset(var.network_groups)
  name               = each.value
  network_manager_id = azurerm_network_manager.avnm.id
}
