#---------------------------------------------------------------------
# Fetch existing resources
#---------------------------------------------------------------------

# Whereas a resource causes Terraform to create and manage a new infrastructure component, 
# data sources present read-only views into pre-existing data, or they compute new values on the fly 
# within Terraform itself. ... 
# Every data source in Terraform is mapped to a provider based on longest-prefix matching.

data "azurerm_virtual_network" "main" {
  name                 = var.vnet_name
  resource_group_name  = var.vnet_rg_name
}

data "azurerm_subnet" "main" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.vnet_rg_name
}

#---------------------------------------------------------------------
# NIC to connect the in the given subnet/vnet
#---------------------------------------------------------------------
resource "azurerm_network_interface" "main" {
  name                  = "${var.vm_name}-nic"
  location              = var.location
  resource_group_name   = var.resource_group_name

  ip_configuration {
    name                          = "${var.vm_name}-ipconfig"
    subnet_id                     = data.azurerm_subnet.main.id
    private_ip_address_allocation = "Dynamic"
  }
}

#---------------------------------------------------------------------
# VM Resource
#---------------------------------------------------------------------
resource "azurerm_virtual_machine" "main" {
  name                  = lower(var.vm_name)
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = var.vm_size

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = var.vm_name
    admin_username = var.admin_username
    #admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      key_data = file(var.admin_key_filepath)
      path     = "/home/${var.admin_username}/.ssh/authorized_keys"
    }
  }
  tags = {
    environment = var.environment
    owner       = var.owner
  }
}