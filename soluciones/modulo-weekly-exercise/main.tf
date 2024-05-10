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
  resource_group_name = "rg-semanal-ralonso"
  resource_group_location = "West Europe"
  virtual_network_name = "vnet-semanal-ralonso"
  subnet_name = "subnet-semanal-ralonso"
  network_interface_name = "nic-semanal-ralonso"
}

module "lb" {
  source = "./modules/lb"
  resource_group_name = module.vnet.resource_group_name
  resource_group_location = module.vnet.resource_group_location
  vms_nic_ids = module.vnet.nic_ids
  lb_public_ip_id = module.vnet.lb_public_ip_id
  public_ip_name = module.vnet.lb_public_ip_name
}