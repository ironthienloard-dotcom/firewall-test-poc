resource "azurerm_firewall_policy" "fwpolicy" {
  name                = "fw-policy-test01"
  location            = "Southeast Asia"
  resource_group_name = "thientestfirewall"
}