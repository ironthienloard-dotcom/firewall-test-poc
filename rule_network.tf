resource "azurerm_firewall_policy_rule_collection_group" "network" {
  name               = "network-rule-group"
  firewall_policy_id = azurerm_firewall_policy.fwpolicy.id
  priority           = 100

  network_rule_collection {
    name     = "allow-dns"
    priority = 100
    action   = "Allow"

    rule {
      name                  = "dns"
      protocols             = ["UDP"]
      source_addresses      = ["*"]
      destination_addresses = ["8.8.8.8", "8.8.4.4"]
      destination_ports     = ["53"]

    }
    #
    #
    rule {
      name                  = "allow-ntp"
      protocols             = ["UDP"]
      source_addresses      = ["*"]
      destination_addresses = ["0.0.0.0/0"]
      destination_ports     = ["123"]
    }

    #
    #
    rule {
      name                  = "allow-https"
      protocols             = ["TCP"]
      source_addresses      = ["*"]
      destination_addresses = ["0.0.0.0/0"]
      destination_ports     = ["443"]
    }
   #
   #
    rule {
      name                  = "Testazureallow"
      protocols             = ["TCP"]
      source_addresses      = ["1.2.3.4/32"]
      destination_addresses = ["0.0.0.0/0"]
      destination_ports     = ["80"]
    }
  }
}