resource "oci_core_vcn" "AsSaee_VCN" {
    compartment_id = var.tenancy_ocid
    cidr_block = var.cidr_block
    display_name = "AsSaee_VCN"
    
}