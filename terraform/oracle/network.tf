resource "oci_core_vcn" "AsSaee_VCN" {
    compartment_id = var.tenancy_ocid
    cidr_block = var.cidr_block
    display_name = "AsSaee_VCN"
    
}

resource "oci_core_internet_gateway" "AsSaee_Internet_Gateway" {
    compartment_id = var.tenancy_ocid
    vcn_id = oci_core_vcn.AsSaee_VCN.id
    display_name = var.internet_gateway_display_name

}

resource "oci_core_route_table" "AsSaee_Route_Table" {
    compartment_id = var.tenancy_ocid
    vcn_id = oci_core_vcn.AsSaee_VCN.id
    display_name = var.route_table_display_name

    route_rules {
        network_entity_id = oci_core_internet_gateway.AsSaee_Internet_Gateway.id
        destination = var.route_table_route_rules_destination
        destination_type = "CIDR_BLOCK"
    }
}