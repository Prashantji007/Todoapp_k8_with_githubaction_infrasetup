variable "policy" {
  type = map(object({
    name = string
    policy_type =  string
    mode = string
    display_name =string
    description = string
    policy_rule = string
    name_policy_set = string
    display_name_policy_set =string
    description_policy_set = string
    mgmt_name = string
  }))
}