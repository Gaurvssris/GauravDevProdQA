resource "azurerm_resource_group" "RG" {
  for_each = var.Rg
  name     = each.value.name
  location = each.value.location

}
# resource "azurerm_resource_group" "RG1" {
#   count = 3
#   name     = "Grs-${count.index}"
#   location = "centralindia"

# }