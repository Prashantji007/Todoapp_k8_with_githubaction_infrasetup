variable "acr" {
    description = "A map of acr to create"
    type = map(object({
        acr_name             = string
        location             = string
        resource_group_name  = string
    }))     
}