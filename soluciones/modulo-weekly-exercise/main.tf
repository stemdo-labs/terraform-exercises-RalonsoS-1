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

module "vnet" {
  source = "./modules/vnet"
}

module "lb" {
  source = "./modules/lb"
  load_balancer_name = "lb-weekly-ralonso"
  resource_group_name = module.vnet.resource_group.name
  resource_group_location = module.vnet.resource_group.location
  vms_nic_ids = module.vnet.nic_ids
  lb_public_ip_id = module.vnet.lb_public_ip.id
  public_ip_name = module.vnet.lb_public_ip.name
}