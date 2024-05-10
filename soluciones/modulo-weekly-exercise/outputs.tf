output "vm_nic_ids" {
  value = module.vnet.nic_ids
}

output "public_ip_address" {
  value = "http://${module.vnet.lb_public_ip.ip_address}"
}