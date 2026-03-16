# Create Network Interface for each VM
resource "azurerm_network_interface" "nic" {
  count               = 2
  name                = "nic-web-${count.index}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Attach NICs to the Load Balancer Backend Pool
resource "azurerm_network_interface_backend_address_pool_association" "lb_assoc" {
  count                   = 2
  network_interface_id    = azurerm_network_interface.nic[count.index].id
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool.id
}

# Create the Virtual Machines
resource "azurerm_linux_virtual_machine" "vm" {
  count                 = 2
  name                  = "vm-web-${count.index}"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  size                  = "Standard_B1s"
  admin_username        = "azureuser"
  network_interface_ids = [azurerm_network_interface.nic[count.index].id]

  # Using the Cloud-Init script we wrote earlier
  custom_data = base64encode(file("${path.module}/scripts/install_nginx.sh"))

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub") # Ensure you have an SSH key generated
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
