resource "azurerm_network_security_group" "this" {

  name                = var.nsg_name

  location            = var.location

  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "allow_vnet" {

  name = "Allow-VNet"

  priority = 100

  direction = "Inbound"

  access = "Allow"

  protocol = "*"

  source_port_range = "*"

  destination_port_range = "*"

  source_address_prefix = "VirtualNetwork"

  destination_address_prefix = "VirtualNetwork"

  resource_group_name = var.resource_group_name

  network_security_group_name = azurerm_network_security_group.this.name
}

resource "azurerm_subnet_network_security_group_association" "this" {

  subnet_id = var.subnet_id

  network_security_group_id = azurerm_network_security_group.this.id
}

resource "azurerm_network_security_rule" "allow_http" {
  count = var.allow_internet_web ? 1 : 0

  name                        = "Allow-HTTP"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "Internet"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.this.name
}

resource "azurerm_network_security_rule" "allow_https" {
  count = var.allow_internet_web ? 1 : 0

  name                        = "Allow-HTTPS"
  priority                    = 210
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "Internet"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.this.name
}

resource "azurerm_network_security_rule" "allow_ingress_http_nodeport" {
  count = var.allow_internet_web ? 1 : 0

  name                        = "Allow-Ingress-HTTP-NodePort"
  priority                    = 220
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "32095"
  source_address_prefix       = "Internet"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.this.name
}

resource "azurerm_network_security_rule" "allow_ingress_https_nodeport" {
  count = var.allow_internet_web ? 1 : 0

  name                        = "Allow-Ingress-HTTPS-NodePort"
  priority                    = 230
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "31919"
  source_address_prefix       = "Internet"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.this.name
}


