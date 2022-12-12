# net
resource "openstack_networking_network_v2" "my-network" {
  admin_state_up = true
  name = "mre-net"
}

# subnet
resource "openstack_networking_subnet_v2" "my-subnet" {
  network_id = "${openstack_networking_network_v2.my-network.id}"
  cidr = "192.168.8.0/24"
  name = "mre-subnet"
}

# ports
resource "openstack_networking_port_v2" "ports" {
  count = var.openstack_iaas_volume_count
  name = "mre-port-${count.index + 1}"
  network_id = "${openstack_networking_network_v2.my-network.id}"
  admin_state_up = "true"
  security_group_ids = [ "26049ca1-5a57-4896-877d-88d0f0b2794c", openstack_networking_secgroup_v2.secgroup.id ]
  fixed_ip {
    subnet_id  = "${openstack_networking_subnet_v2.my-subnet.id}"
  }
  depends_on = [
    openstack_networking_subnet_v2.my-subnet
  ]
}

# resource "openstack_networking_floatingip_associate_v2" "fip-vm" {
#   floating_ip = "10.232.30.254"
#   port_id = "${openstack_networking_port_v2.ports.0.id}"

#   depends_on = [
#     openstack_networking_router_interface_v2.my-router-interface,
#     openstack_networking_router_v2.my-router
#   ]
# }