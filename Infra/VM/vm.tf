resource "azurerm_virtual_machine" "VMgaurav" {
    for_each = var.VMgaurav
  name                  = each.value.name
  location              = each.value.location
  resource_group_name   = each.value.name1
  network_interface_ids = [data.azurerm_network_interface.dataNIC.id]
  vm_size               = "Standard_B2s"



  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = data.azurerm_key_vault_secret.kv1.value
    admin_password = data.azurerm_key_vault_secret.kv2.value
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}
data "azurerm_network_interface" "dataNIC" {
  name                = "NICgaurav"
  resource_group_name = "gauravvvs77"
}
data "azurerm_key_vault" "keyvaultgaurav" {
  name                = "kvgauravssris"
  resource_group_name = "gauravvv"
}
data "azurerm_key_vault_secret" "kv1" {
  name         = "kvsecid"
  key_vault_id = data.azurerm_key_vault.keyvaultgaurav.id
}
data "azurerm_key_vault_secret" "kv2" {
  name         = "kvpwd"
  key_vault_id = data.azurerm_key_vault.keyvaultgaurav.id
}