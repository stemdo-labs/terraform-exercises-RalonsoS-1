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

resource "azurerm_subnet" "mis_subnets" {
  count = length(var.subnets)
  name                 = var.subnets[count.index]["name"]
  resource_group_name  = var.existent_resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.subnets[count.index]["address_prefix"]]
}

