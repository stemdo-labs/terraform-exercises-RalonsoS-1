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

module "rg" {
  source = "./modules/rg"
  resource_group_name = var.resource_group.name
  resource_group_location = var.resource_group.location
}

module "vnet" {
  source = "./modules/vnet"
  resource_group_name = module.rg.resource_group.name
  resource_group_location = module.rg.resource_group.location
  virtual_network_name = var.virtual_network.name
  vnet_address_space = var.virtual_network.address_space
}

module "subnet" {
  source = "./modules/subnet"
  resource_group_name = var.resource_group.name
  subnet_name = var.subnet.name
  virtual_network_name = module.vnet.vnet.name
  subnet_address_prefixes = var.subnet.address_prefixes
}

module "nsg" {
  source = "./modules/nsg"
  security_rules = var.network_security_group.security_rules
  nsg_name = var.network_security_group.nsg_name
  resource_group_name = module.rg.resource_group.name
  resource_group_location = module.rg.resource_group.location
  subnet_address_prefixes = module.subnet.subnet.address_prefixes
  subnet_id = module.subnet.subnet.id
}

module "lb_public_ip" {
  source = "./modules/lb_public_ip"
  public_ip_name = var.public_ip_name
  resource_group_name = module.rg.resource_group.name
  resource_group_location = module.rg.resource_group.location
} 

module "nic" {
  source = "./modules/nic"
  resource_group_name = module.rg.resource_group.name
  resource_group_location = module.rg.resource_group.location
  subnet_id = module.subnet.subnet.id
  network_interface_name = var.network_interface_name
  vms_quantity = length(var.vms)
}

module "vms" {
  source = "./modules/vms"
  resource_group_name = module.rg.resource_group.name
  resource_group_location = module.rg.resource_group.location
  virtual_machines = var.vms
  virtual_machine_network_interface_ids = [for nic in module.nic.nic : nic.id]
}