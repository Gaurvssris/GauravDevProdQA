resource "azurerm_virtual_network" "example" {
    for_each = var.vnetgaurav
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.name1
  address_space       = ["10.0.0.0/16"]

}