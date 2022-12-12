resource "openstack_networking_router_v2" "my-router" {
    name = "mre-router"
    admin_state_up = "true"
    external_network_id = "4530a10e-379d-4b84-8156-4576dee5ca98"
}

resource "openstack_networking_router_interface_v2" "my-router-interface" {
    router_id = "${openstack_networking_router_v2.my-router.id}"
    subnet_id = "${openstack_networking_subnet_v2.my-subnet.id}"

}