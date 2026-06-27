resource "azurerm_virtual_network" "this" {

  name                = var.vnet_name

  location            = var.location

  resource_group_name = var.resource_group_name

  address_space = [
    "10.0.0.0/16"
  ]
}

resource "azurerm_subnet" "aks" {

  name                 = "aks-subnet"

  resource_group_name  = var.resource_group_name

  virtual_network_name = azurerm_virtual_network.this.name

  address_prefixes = [
    "10.0.1.0/24"
  ]
}

resource "azurerm_subnet" "appgw" {

  name                 = "appgw-subnet"

  resource_group_name  = var.resource_group_name

  virtual_network_name = azurerm_virtual_network.this.name

  address_prefixes = [
    "10.0.2.0/24"
  ]
}

resource "azurerm_subnet" "private" {

  name                 = "private-endpoint-subnet"

  resource_group_name  = var.resource_group_name

  virtual_network_name = azurerm_virtual_network.this.name

  address_prefixes = [
    "10.0.3.0/24"
  ]
}
