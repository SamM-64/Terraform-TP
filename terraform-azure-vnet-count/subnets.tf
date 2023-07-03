resource "azurerm_subnet" "subnets" {
  for_each            = local.subnets
  name                = each.value.name
  resource_group_name = local.rg
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [each.value.address_prefixes]
}
