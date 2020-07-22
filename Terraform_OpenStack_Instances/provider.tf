# Configure the OpenStack Provider
provider "openstack" {
  user_name   = var.openstack_user_auth
  tenant_name = var.openstack_tenant_auth
  password    = var.openstack_user_pass
  auth_url    = var.openstack_auth_url
}