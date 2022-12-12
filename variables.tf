variable "openstack_resource_name_prefix"{
  type = string
}
variable "openstack_external_network_id"{
  type = string
}
variable "openstack_dns_servers" {
  type = list(string)
}
variable "openstack_instance_image_id"{
  type = string
}
variable "openstack_instance_flavor_id"{
  type = string
}
variable "openstack_availability_zone"{
  type = string
  default = "az3"
}
variable "openstack_iaas_volume_count"{
  type = string
  default = "4"
}
variable "openstack_user_name" {
  type = string
}
variable "openstack_password" {
  type = string
}
variable "openstack_tenant_name" {
  type = string
}
variable "auth_url" {
  type = string
}
variable "openstack_region" {
  type = string
}
variable "openstack_user_domain_name" {
  type = string
}
variable "openstack_image_id" {
  type = string
  default = "b71ca599-b4f6-4b98-bbee-4df8a3100f71"
}
variable "openstack_security_groups" {
  type = list(string)
  default = [ "default" ]
}