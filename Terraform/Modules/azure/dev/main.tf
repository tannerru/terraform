#connect to azurerm provider    
provider "azurerm" {
  features {}
}

# create virtual machine
resource "azurerm_virtual_machine" "vm" {
  name                  = "vm"
  location              = "eastus"
  resource_group_name   = "rg"
  network_interface_ids = [azurerm_network_interface.nic.id]
  vm_size               = "Standard_B2s"

  storage_os_disk {
    name              = "vm-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "vm"
    admin_username = "azureuser"
    admin_password = "Password1234567890!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

# create network interface
resource "azurerm_network_interface" "nic" {
  name                = "nic"
  location            = "eastus"
  resource_group_name = "rg"

  ip_configuration {
    name                          = "ip"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# create subnet
resource "azurerm_subnet" "subnet" {
  name                 = "subnet"
  resource_group_name  = "rg"
  virtual_network_name = "vnet"
  address_prefixes     = ["255.255.255.0"] #subnet address  ex:             
}