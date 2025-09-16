variable "mod_rgs" {
}
variable "mod_aks" {
}
variable "mod_acr" {
}
variable "mod_mssql_server" {
  
}
variable "mod_mssql_db" {
  
}

variable "mod_mssql_db_password" {
  description = "Administrator password for MSSQL servers"
  type        = string
  sensitive   = true
  default = ""
}

variable "mod_kv" {
  
}