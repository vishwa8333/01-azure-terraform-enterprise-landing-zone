resource "azurerm_resource_group" "platform" {
  name     = "rg-landing-zone-${var.environment}"
  location = var.location

  tags = {
    environment = var.environment
    workload    = "landing-zone"
    managed_by  = "terraform"
  }
}

resource "azurerm_log_analytics_workspace" "platform" {
  name                = "log-lz-${var.environment}"
  location            = azurerm_resource_group.platform.location
  resource_group_name = azurerm_resource_group.platform.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_virtual_network" "hub" {
  name                = "vnet-hub-${var.environment}"
  location            = azurerm_resource_group.platform.location
  resource_group_name = azurerm_resource_group.platform.name
  address_space       = var.address_space
}

resource "azurerm_subnet" "shared" {
  name                 = "snet-shared-services"
  resource_group_name  = azurerm_resource_group.platform.name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = ["10.40.1.0/24"]
}

resource "azurerm_key_vault" "platform" {
  name                       = "kv-lz-${var.environment}-001"
  location                   = azurerm_resource_group.platform.location
  resource_group_name        = azurerm_resource_group.platform.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  soft_delete_retention_days = 7
  purge_protection_enabled   = false
}

data "azurerm_client_config" "current" {}

