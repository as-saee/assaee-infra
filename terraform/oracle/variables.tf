variable "tenancy_ocid" {
  type        = string
  description = "OCID of the oracle tenancy (root compartment)"
}

variable "cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "Cidr Block for the Virtual Cloud Network"
}

variable "internet_gateway_display_name" {
  type        = string
  default     = "oci_core_internet_gateway"
  description = "Display name for internet gateway"
}

variable "route_table_display_name" {
  type        = string
  default     = "route_table_display_name"
  description = "Display Name for VCN Route Table"
}

variable "route_table_route_rules_destination" {
  type        = string
  default     = "0.0.0.0/0"
  description = "The Destination CIDR for internet route"
}

variable "oci_core_security_list_display_name" {
  type        = string
  default     = "oci_core_security_list"
  description = "Display name for AsSaee_Security_List"
}