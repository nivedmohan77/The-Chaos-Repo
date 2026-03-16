resource "azurerm_lb" "lb" {
  name                = "lb-web-cluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.lb_pip.id
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "BackEndAddressPool"
}

# SRE Feature: Health Probe
resource "azurerm_lb_probe" "http_probe" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "http-running-probe"
  port            = 80
  protocol        = "Http"
  request_path    = "/"
}
