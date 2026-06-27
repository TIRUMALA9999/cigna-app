resource "azurerm_kubernetes_cluster" "this" {

  name                = var.cluster_name

  location            = var.location

  resource_group_name = var.resource_group_name

  dns_prefix          = var.cluster_name

  sku_tier            = "Free"

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {

    name       = "system"

    node_count = 2

    vm_size    = "Standard_D2s_v7"

    vnet_subnet_id = var.subnet_id
  }

  network_profile {

  network_plugin = "azure"

  network_policy = "azure"

  service_cidr  = "10.240.0.0/16"

  dns_service_ip = "10.240.0.10"
  }
}
