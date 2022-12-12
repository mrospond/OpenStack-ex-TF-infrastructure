provider "openstack" {
    user_name        = var.openstack_user_name
    tenant_name      = var.openstack_tenant_name
    password         = var.openstack_password
    auth_url         = var.auth_url
    region           = var.openstack_region
    user_domain_name = var.openstack_user_domain_name
    use_octavia = "true"
    max_retries = 5
}