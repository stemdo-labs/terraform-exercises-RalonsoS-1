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

resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  address_space       = var.vnet_address_space
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}