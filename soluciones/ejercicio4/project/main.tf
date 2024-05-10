terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }

  backend "azurerm" {
      resource_group_name  = "rg1ralonso-lab01"
      storage_account_name = "sta1ralonso"
      container_name       = "tfstate"
      key                  = "terraform.tfstate"
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


