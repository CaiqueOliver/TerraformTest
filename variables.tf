variable "aks_name" {
  type = string 
  default =  "aks-test"
  
}


variable "tags" {
   type = map(any)
   default = {
    "environment"     = "demo"
    "organization"    = "test"
    "project"         = "demo"
    "terraform"       = true    
    "version"         = "v2"
    "tier"            = "container"   
    "region"          = "eu2"
    "region_full"     = "eastus2"
    "location"        = "East US2"
  }
}