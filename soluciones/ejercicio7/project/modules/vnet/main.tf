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

locals {
  valid_values = ["DEV", "PRO", "TES", "PRE"]
}

resource "azurerm_virtual_network" "mi_vnet" {
  name                = var.vnet_name
  resource_group_name = var.existent_resource_group_name
  location            = var.location
  address_space       = var.vnet_address_space

  tags = merge(
    {
      "owner" = var.owner_tag,
      "environment" = var.environment_tag
    },
    var.vnet_tags
    )
}

module "subnets" {
  source = "./modules/subnet"

  vnet_name               = azurerm_virtual_network.mi_vnet.name
  existent_resource_group_name = var.existent_resource_group_name
  subnets                 = var.subnets
}

module "network_security_group" {
  source = "./modules/network-security-group"
  existent_resource_group_name = var.existent_resource_group_name
  location                     = var.location
}

resource "azurerm_subnet_network_security_group_association" "sec_group_subnets_asoc" {
  for_each                   = (module.subnets.subnet_ids)

  subnet_id                 = each.value
  network_security_group_id = module.network_security_group.network_security_group_id
}


output "subnet_associations" {
  value = azurerm_subnet_network_security_group_association.sec_group_subnets_asoc
}


