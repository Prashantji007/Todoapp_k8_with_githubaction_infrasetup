
resource "azurerm_application_security_group" "asg" {
    for_each = var.asg
  name                = each.value.asg
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  tags = {
    environment = "dev"
  }
}