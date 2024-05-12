resource "azurerm_lb_probe" "my_lb_probe" {
  loadbalancer_id     = var.load_balancer_id
  name                = "weekly-lb-probe"
  port                = 80
}

resource "azurerm_lb_rule" "my_lb_rule" {
  for_each = { for rule in var.lb_rules : rule.name => rule }

  loadbalancer_id                = var.load_balancer_id
  name                           = each.value.name
  protocol                       = each.value.protocol
  frontend_port                  = each.value.frontend_port
  backend_port                   = each.value.backend_port
  disable_outbound_snat          = each.value.disable_outbound_snat
  frontend_ip_configuration_name = var.frontend_ip_configuration_name
  probe_id                       = azurerm_lb_probe.my_lb_probe.id
  backend_address_pool_ids       = [var.lb_backend_pool_id]
}

resource "azurerm_lb_outbound_rule" "my_lboutbound_rule" {
  for_each = { for rule in var.outbound_rules : rule.name => rule }

  name                    = each.value.name
  loadbalancer_id         = var.load_balancer_id
  protocol                = each.value.protocol
  backend_address_pool_id = each.value.backend_address_pool_id

  frontend_ip_configuration {
    name = each.value.frontend_ip_configuration_name
  }
}