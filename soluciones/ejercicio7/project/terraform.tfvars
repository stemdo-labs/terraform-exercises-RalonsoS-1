existent_resource_group_name = "rg1ralonso-lab01"
vnet_name = "vnetralonsotfexercise01"
vnet_address_space = ["10.0.0.0/16"]
environment_tag = "dev"
owner_tag = "Rafa"
vnet_tags = {
  owner = "Rafael Alonso Cepeda"
}
subnets = [
    {
      name            = "subnet1"
      address_prefix  = "10.0.1.0/24"
    },
    {
      name            = "subnet2"
      address_prefix  = "10.0.2.0/24"
    }
  ]