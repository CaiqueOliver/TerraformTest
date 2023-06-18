resource "random_pet" "prefix" {}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "default" {
  name     = var.aks_name
  location = "East US2"

  tags =  var.tags
  
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = var.aks_name
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_prefix          = var.aks_name

  default_node_pool {
    name            = "user"
    node_count      = 2
    vm_size         = "Standard_B2s"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.appId
    client_secret = var.password
  }

  tags = {
    environment = var.tags
  }
}
