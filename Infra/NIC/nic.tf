resource "azurerm_network_interface" "nicg" {
    for_each = var.nicGS
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.name3

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnetdata.id
    private_ip_address_allocation = "Dynamic"
  }
}
data "azurerm_subnet" "subnetdata" {
  name                 = "SubnetGSrI"
  virtual_network_name = "GauravVnet"
  resource_group_name  = "gauravvvs77"
}