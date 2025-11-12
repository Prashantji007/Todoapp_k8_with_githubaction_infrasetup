variable "asg" {
  type = map(object({
      asg = string
       location = string
    resource_group_name = string  
   }))
}