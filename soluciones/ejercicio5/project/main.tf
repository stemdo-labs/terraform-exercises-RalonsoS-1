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

module "ejercicio4" {
  source = "./modules/ejercicio4"
  existent_resource_group_name = var.existent_resource_group_name
  owner_tag = var.owner_tag
  vnet_name = var.vnet_name
  vnet_address_space = var.vnet_address_space
  vnet_tags = var.vnet_tags
  environment_tag = var.environment_tag
}




