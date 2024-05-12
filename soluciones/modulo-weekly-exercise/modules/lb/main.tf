terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.102.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_lb" "my_lb" {
  name                = var.load_balancer_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = var.public_ip_name
    public_ip_address_id = var.lb_public_ip_id
  }
}

resource "azurerm_lb_backend_address_pool" "my_lb_pool" {
  loadbalancer_id      = azurerm_lb.my_lb.id
  name                 = "lb-weekly-pool"
}

resource "azurerm_network_interface_backend_address_pool_association" "my_nic_lb_pool" {
  count                   = length(var.vms_nic_ids)
  network_interface_id    = var.vms_nic_ids[count.index]
  ip_configuration_name   = "ipconfig${count.index}"
  backend_address_pool_id = azurerm_lb_backend_address_pool.my_lb_pool.id
}

# Sondeo y reglas
module "lb_probe_and_rules" {
  source = "./modules/lb_probe_and_rules"

  load_balancer_id               = azurerm_lb.my_lb.id
  frontend_ip_configuration_name = var.public_ip_name
  lb_backend_pool_id             = azurerm_lb_backend_address_pool.my_lb_pool.id

  lb_rules = [
    {
      name                   = "rule-1"
      protocol               = "Tcp"
      frontend_port          = 80
      backend_port           = 80
      disable_outbound_snat  = true
    },
    {
      name                   = "rule-2"
      protocol               = "Tcp"
      frontend_port          = 443
      backend_port           = 8443
      disable_outbound_snat  = true
    }
  ]

  outbound_rules = [
    {
      name                    = "outbound-rule-1"
      protocol                = "Tcp"
      frontend_ip_configuration_name = var.public_ip_name
      backend_address_pool_id = azurerm_lb_backend_address_pool.my_lb_pool.id
    }
  ]
}