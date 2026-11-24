variable "tenancy_ocid" {
  type        = string
  description = "OCID of the oracle tenancy (root compartment)"
}

variable "cidr_block" {
  type = string
  default = "10.0.0.0/16"
  description = "Cidr Block for the Vitrual Cloud Network" 
}

variable "internet_gateway_display_name" {
  type = string
  default = "oci_core_internet_gateway"
  description = "Display name for internet gateway"
}