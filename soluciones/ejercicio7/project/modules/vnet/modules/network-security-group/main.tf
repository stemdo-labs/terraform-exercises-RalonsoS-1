terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_network_security_group" "mi_security_group" {
  name                = "mi_security_group"
  location            = var.location
  resource_group_name = var.existent_resource_group_name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "sec_group_subnets_asoc" {
  for_each                   = {
    for index, subnet in var.subnets:
    subnet => subnet
  }

  subnet_id                 = each.key
  network_security_group_id = azurerm_network_security_group.mi_security_group.id
}

