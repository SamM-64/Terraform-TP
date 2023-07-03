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
    "subnet-bastion" = "10.1.0.0/24"
    "subnet-app"     = "10.1.1.0/24"
    "subnet-db"      = "10.1.2.0/24"
  }
  }
