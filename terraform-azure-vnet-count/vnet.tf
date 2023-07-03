resource "azurerm_virtual_network" "main" {
  name                = "vnet"
  location            = data.azurerm_resource_group.mine.location
  resource_group_name = data.azurerm_resource_group.mine.name
  address_space       = [local.vnet_cidr]
  tags                = local.tags
}