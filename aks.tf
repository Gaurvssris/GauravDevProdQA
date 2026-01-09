resource "azurerm_resource_group" "AKSgaurav" {
  name     = "AKSgaurav"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "gauravAKS" {
  name                = "gaurav-aks1"
  location            = azurerm_resource_group.AKSgaurav.location
  resource_group_name = azurerm_resource_group.AKSgaurav.name
  dns_prefix          = "gauravaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.example.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.example.kube_config_raw

  sensitive = true
}