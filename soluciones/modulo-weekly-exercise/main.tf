terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.102.0"
    }
  }

  backend "azurerm" {
      resource_group_name  = "rg1ralonso-lab01"
      storage_account_name = "sta1ralonso"
      container_name       = "tfstate"
      key                  = "terraform_weekly.tfstate"
  }
}

provider "azurerm" {
  features {}
}

module "vnet" {
  source = "./modules/vnet"
  resource_group = var.azure_infrastructure.resource_group
  virtual_network = var.azure_infrastructure.virtual_network
  subnet = var.azure_infrastructure.subnet
  network_security_group = var.azure_infrastructure.network_security_group
  vms = var.azure_infrastructure.vms
  public_ip_name = var.azure_infrastructure.public_ip_name
  network_interface_name = var.azure_infrastructure.network_interface_name
}

module "lb" {
  source = "./modules/lb"
  load_balancer_name = var.azure_infrastructure.load_balancer_name
  resource_group_name = module.vnet.resource_group.name
  resource_group_location = module.vnet.resource_group.location
  vms_nic_ids = module.vnet.nic_ids
  lb_public_ip_id = module.vnet.lb_public_ip.id
  public_ip_name = module.vnet.lb_public_ip.name
}