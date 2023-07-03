resource "azurerm_virtual_network" "main" {
  name                = "terraform-azure-vnet"
  location            = "West Europe"
  resource_group_name = "Samantha_M"
  address_space       = ["10.1.0.0/16"]

  tags = {
    TP = "terraform-azure-vnet"
  }
}

resource "azurerm_subnet" "first" {
  name                 = "subnet1"
  resource_group_name  = "Samantha_M"
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.1.1.0/24"]
}

resource "azurerm_subnet" "second" {
  name                 = "subnet2"
  resource_group_name  = "Samantha_M"
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.1.2.0/24"]
}