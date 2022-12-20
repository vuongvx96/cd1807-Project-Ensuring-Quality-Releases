resource "azurerm_network_interface" "nic" {
  name                = "${var.application_type}-${var.resource_type}-nic"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${var.public_ip}"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "${var.application_type}-${var.resource_type}-internal"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  size                = "${var.vm_size}"
  admin_username      = "${var.admin_username}"
  admin_password      = "${var.admin_password}"
  network_interface_ids = [azurerm_network_interface.nic.id]
  admin_ssh_key {
    username   = "${var.admin_username}"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCxkv/9b4vys7KVVYsTkLni6u/Dopr2UyCIq9jPFfvdVNoN9+XzaOyxelro7YLPOggsmHfU9MupDw7ssw99MbLIbpltxyL9KJ2LyVDX9TL6Q//xp6XkASAEkevdEne3lHkmcV0+XLw2Zrqe0SMPw0d7FI63gWyfBUmNQb1r7Rzn3jmQFUdox4VVuwNhBJjWhYHIc6wwu5PFhIRFvERvJ5lOMhdvTkwZFYm0xBTvvAhoh/9C7Mgrt5Qo0QzwkAEK59utQA1oik/mVeUEXuWSXuHd1B86i0002OyZ/39DUNgtLlCjunGV3i1qIs/3etScaMMhW2KzPvMcwsRyjp7wP2tg0pbsELyCcEPKh+k5XyLf8xmWJz3IsWcbKPEiuKjEF59lEKrwhWuI/NPBubIWghtvEdyPMykaTpZJh3+4tjULc5XhZ/Pwq/bx7s/DCD4c2N6VxkAlOOZI1eZoC6YpRAm1aYnDGlIvLj/zFmlCAPCUdWDLZNWFUadqvYSZAJlzAhc= vuongvx@hotmail.com"
  }
  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
