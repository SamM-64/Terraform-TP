locals {
  vnet_cidr = "10.1.0.0/16"
  user      = "sam"
  rg        = "Samantha_M"
  date      = formatdate("YYYY-MM-DD", time_static.creation.rfc3339)
  
  vnet_address_space = [local.vnet_cidr]

  tags = {
    TP       = basename(abspath(path.root))
    Owner    = local.user
    DeployID = local.date
  }
  
  subnets = {
    for i in range(var.subnet_count) :
    "subnet${i + 1}" => {
      name             = "subnet${i + 1}"
      address_prefixes = cidrsubnet(local.vnet_address_space[0], 8, i + 1)
    }
  }
}
