resource "oci_core_vcn" "AsSaee_VCN" {
  compartment_id = var.tenancy_ocid
  cidr_block     = var.cidr_block
  display_name   = "AsSaee_VCN"

}

resource "oci_core_internet_gateway" "AsSaee_Internet_Gateway" {
  compartment_id = var.tenancy_ocid
  vcn_id         = oci_core_vcn.AsSaee_VCN.id
  display_name   = var.internet_gateway_display_name

}

resource "oci_core_route_table" "AsSaee_Route_Table" {
  compartment_id = var.tenancy_ocid
  vcn_id         = oci_core_vcn.AsSaee_VCN.id
  display_name   = var.route_table_display_name

  route_rules {
    network_entity_id = oci_core_internet_gateway.AsSaee_Internet_Gateway.id
    destination       = var.route_table_route_rules_destination
    destination_type  = "CIDR_BLOCK"
  }
}

resource "oci_core_security_list" "AsSaee_Security_List" {
  compartment_id = var.tenancy_ocid
  vcn_id         = oci_core_vcn.AsSaee_VCN.id
  display_name   = var.oci_core_security_list_display_name

  # Allow all outbound traffic. No inbound rules: SSH will go over Tailscale
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }
}

resource "oci_core_subnet" "AsSaee_Subnet" {
  compartment_id = var.tenancy_ocid
  vcn_id         = oci_core_vcn.AsSaee_VCN.id

  display_name      = "AsSaee_Subnet"
  cidr_block        = "10.0.0.0/24"
  route_table_id    = oci_core_route_table.AsSaee_Route_Table.id
  security_list_ids = [oci_core_security_list.AsSaee_Security_List.id]
}