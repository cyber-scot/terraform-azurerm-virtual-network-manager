output "network_group_ids" {
  description = "A map of network group names to their respective IDs."
  value       = { for name, group in azurerm_network_manager_network_group.groups : name => group.id }
}

output "network_group_names" {
  description = "The list of network group names."
  value       = var.network_groups
}

output "network_manager_id" {
  description = "The ID of the Azure Network Manager."
  value       = azurerm_network_manager.avnm.id
}

output "network_manager_name" {
  description = "The name of the Azure Network Manager."
  value       = azurerm_network_manager.avnm.name
}

output "network_manager_scope" {
  description = "The scope of the Azure Network Manager."
  value       = azurerm_network_manager.avnm.scope
}

output "network_manager_tags" {
  description = "The tags of the Azure Network Manager."
  value       = azurerm_network_manager.avnm.tags
}
