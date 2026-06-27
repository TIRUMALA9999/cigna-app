module "rg" {

  source = "../../modules/rg"

  name = "cigna-dev-rg"

  location = "eastus"

  tags = {

    Environment = "dev"

    Project = "cigna-platform"

    Owner = "platform-team"
  }
}

module "network" {

  source = "../../modules/network"

  resource_group_name = module.rg.name

  location = "eastus"

  vnet_name = "cigna-dev-vnet"
}

module "aks_nsg" {

  source = "../../modules/nsg"

  nsg_name = "aks-nsg"

  resource_group_name = module.rg.name

  location = "eastus"

  allow_internet_web = true

  subnet_id = module.network.aks_subnet_id
}

module "appgw_nsg" {

  source = "../../modules/nsg"

  nsg_name = "appgw-nsg"

  resource_group_name = module.rg.name

  location = "eastus"

  allow_internet_web = false

  subnet_id = module.network.appgw_subnet_id
}


module "private_nsg" {

  source = "../../modules/nsg"

  nsg_name = "private-endpoint-nsg"

  resource_group_name = module.rg.name

  location = "eastus"

  subnet_id = module.network.private_subnet_id
}

module "acr" {

  source = "../../modules/acr"

  acr_name = "cignadevacr001"

  resource_group_name = module.rg.name

  location = "eastus"
}

module "aks" {

  source = "../../modules/aks"

  cluster_name = "cigna-dev-aks"

  location = "eastus"

  resource_group_name = module.rg.name

  subnet_id = module.network.aks_subnet_id
}
