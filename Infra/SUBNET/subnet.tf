resource "azurerm_subnet" "subnetG" {
    for_each = var.subnetG
  name                 = each.value.name
  resource_group_name  = each.value.name1
  virtual_network_name = each.value.name2
  address_prefixes     = ["10.0.1.0/24"]
}