output "public_ip_address" {
  value = "http://${module.vnet.lb_public_ip.ip_address}"
}