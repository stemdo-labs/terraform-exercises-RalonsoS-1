output "resource_group" {
  value = module.rg.resource_group
}

output "vnet" {
  value = module.vnet.vnet
}

output "subnet_id" {
  value = module.subnet.subnet.id
}

output "nic" {
  value = module.nic.nic
}

output "nic_ids" {
  value = [for nic in module.nic.nic : nic.id]
}

output "nsg" {
  value = module.nsg.my_nsg
}

output "lb_public_ip" {
  value = module.lb_public_ip.lb_public_ip
}

output "vms" {
  value = module.vms
}