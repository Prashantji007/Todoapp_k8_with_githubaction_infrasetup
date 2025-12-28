mod_rgs = {
  rg1 = {
    rg_name  = "rg-todoapp-dev"
    location = "centralindia"
    tags = {
      Environment = "Development"
      Owner       = "Prashant"
    }
  }
}

mod_managed_identity = {
  "aks_identity" = {
    name                = "aks-uai-dev"
    location            = "centralindia"
    resource_group_name = "rg-todoapp-dev"
  }
}

mod_mgmt = {
  "mgmt1" = {
    display_name = "8c6afa46-ccf3-48b2-80e4-401d4571698d"
  }
}

mod_policy = {
  "policy1" = {
    name         = "custom-allowed-locations"
    policy_type  = "Custom"
    mode         = "All"
    display_name = "Allowed locations for resources"
    description  = "Deny creation of resources outside approved regions."
    policy_rule  = <<POLICY
{
  "if": {
    "not": {
      "field": "location",
      "in": ["eastus", "centralindia", "westeurope"]
    }
  },
  "then": {
    "effect": "deny"
  }
}
POLICY

    name_policy_set         = "org-baseline"
    display_name_policy_set = "Organization Baseline Policies"
    description_policy_set  = "Baseline policies: allowed locations + tag enforcement"
    mgmt_name               = "8c6afa46-ccf3-48b2-80e4-401d4571698d"
  }


  "policy2" = {
    name         = "custom-enforce-required-tags"
    policy_type  = "Custom"
    mode         = "All"
    display_name = "Ensure required tags are present"
    description  = "custom-enforce-required-tags."
    policy_rule  = <<POLICY
{
  "if": {
    "field": "tags.Environment",
    "equals": null
  },
  "then": {
    "effect": "append",
    "details": {
      "field": "tags",
      "value": {
        "Environment": "non-prod"
      }
    }
  }
}
POLICY

    name_policy_set         = "org-baseline"
    display_name_policy_set = "Organization Baseline Policies"
    description_policy_set  = "Baseline policies: allowed locations + tag enforcement"
    mgmt_name               = "8c6afa46-ccf3-48b2-80e4-401d4571698d"
  }
}
