output "resource_group_name" {
  value = azurerm_resource_group.platform.name
}

output "hub_vnet_id" {
  value = azurerm_virtual_network.hub.id
}

output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.platform.id
}

