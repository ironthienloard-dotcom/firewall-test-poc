resource "azurerm_firewall_policy_rule_collection_group" "nat" {
  name               = "nat-rule-group"
  firewall_policy_id = azurerm_firewall_policy.fwpolicy.id
  priority           = 300

  nat_rule_collection {
    name     = "rdp-nat"
    priority = 100
    action   = "Dnat"

    rule {
      name                  = "rdp"
      protocols             = ["TCP"]
      source_addresses      = ["*"]
      destination_address   = "20.50.100.10"   # เปลี่ยนเป็น Public IP จริง
      destination_ports     = ["3389"]

      translated_address    = "10.0.1.4"       # VM จริง
      translated_port       = "3389"
    }
  }
}