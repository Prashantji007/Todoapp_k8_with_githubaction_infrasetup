variable "aks" {
    description = "A map of aks clusters to create"
    type = map(object({
        aks_name              = string
        location             = string
        resource_group_name  = string
        tags                 = map(string)
    })) 
}