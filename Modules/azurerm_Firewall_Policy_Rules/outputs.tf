output "waf_policy_id" {
  value ={
    for k, v in azurerm_web_application_firewall_policy.firepoll : k => v.id
  }
}
