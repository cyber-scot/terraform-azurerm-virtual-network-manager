module "rg" {
  source = "cyber-scot/rg/azurerm"

  name     = "rg-${var.short}-${var.loc}-${var.env}-01"
  location = local.location
  tags     = local.tags
}

data "azurerm_subscription" "current" {}

module "vnet_manager" {
  source = "cyber-scot/virtual-network-manager/azurerm"

  rg_name  = module.rg.rg_name
  location = module.rg.rg_location
  tags     = module.rg.rg_tags


  name = "avnm-${var.short}-${var.loc}-${var.env}-01"

  scope = [
    {
      subscription_ids = [data.azurerm_subscription.current.id]
    }
  ]

  scope_accesses = [
    "Connectivity",
    "SecurityAdmin"
  ]

  network_groups = [
    "Prd",
    "Dev"
  ]
}
