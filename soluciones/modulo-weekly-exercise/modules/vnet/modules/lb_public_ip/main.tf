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

resource "azurerm_public_ip" "lb_public_ip" {
  name                = var.public_ip_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}