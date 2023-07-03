resource "time_static" "localDate" {}

locals {
  vnet_name           = "terraform-azure-vnet"
  resource_group_name = "Samantha_M"
  vnet_address_space  = ["10.1.0.0/16"]

  subnets = {
    first = {
      name             = "subnet1"
      address_prefixes = [cidrsubnet("10.1.0.0/16", 8, 1)]
    },
    second = {
      name             = "subnet2"
      address_prefixes = [cidrsubnet("10.1.0.0/16", 8, 2)]
    }
  }

  
  tp_name_prefix = "${path.module}-dynamic"
  deploy_date    = formatdate("YYYY-MM-DD", time_static.localDate.rfc3339)
  
  tags = {
    TP       = local.tp_name_prefix
    Owner    = "sam"
    DeployID = local.deploy_date
  }
}

resource "azurerm_virtual_network" "main" {
  name                = local.vnet_name
  location            = "West Europe"
  resource_group_name = local.resource_group_name
  address_space       = local.vnet_address_space

  tags = local.tags
}

resource "azurerm_subnet" "first" {
  name                 = local.subnets["first"].name
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = local.subnets["first"].address_prefixes
}

resource "azurerm_subnet" "second" {
  name                 = local.subnets["second"].name
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = local.subnets["second"].address_prefixes
}


