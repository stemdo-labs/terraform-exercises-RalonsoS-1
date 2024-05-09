# main.tf
module "ejercicio4" {
  source = "./modules/vnet"

  existent_resource_group_name = var.existent_resource_group_name
  vnet_name                    = var.vnet_name
  vnet_address_space           = var.vnet_address_space
  environment_tag              = var.environment_tag
  owner_tag                    = var.owner_tag
  vnet_tags                    = {
    owner = "Rafael Alonso Cepeda"
  }

  subnets = var.subnets
}
