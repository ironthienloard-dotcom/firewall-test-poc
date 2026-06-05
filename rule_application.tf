resource "azurerm_firewall_policy_rule_collection_group" "app" {
  name               = "app-rule-group"
  firewall_policy_id = azurerm_firewall_policy.fwpolicy.id
  priority           = 200

  application_rule_collection {
    name     = "allow-web"
    priority = 100
    action   = "Allow"

    rule {
      name             = "allow-microsoft"
      source_addresses = ["*"]

      protocols {
        type = "Http"
        port = 80
      }

      protocols {
        type = "Https"
        port = 443
      }

      destination_fqdns = [
        "www.microsoft.com",
        "learn.microsoft.com"
      ]
    }
  }
}