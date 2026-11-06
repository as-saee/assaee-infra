output "availability_domains" {
  value = data.oci_identity_availability_domains.ads.availability_domains[*].name
}

output "vcn_name" {
  value = oci_core_vcn.AsSaee_VCN.display_name

}

