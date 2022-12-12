resource "openstack_lb_loadbalancer_v2" "front-lb" {
    name = "mre-terra-front-lb"
    vip_subnet_id = "${openstack_networking_subnet_v2.my-subnet.id}"
    admin_state_up = "true"
    # availability_zone = var.openstack_availability_zone
    # security_group_ids = [ "26049ca1-5a57-4896-877d-88d0f0b2794c", openstack_networking_secgroup_v2.secgroup.id ]
}

# loadbalancer fip
resource "openstack_networking_floatingip_associate_v2" "front-lb-fip" {
  floating_ip = "10.232.30.254"
  port_id = "${openstack_lb_loadbalancer_v2.front-lb.vip_port_id}"
}

# listener
resource "openstack_lb_listener_v2" "front-listener-22" {
    name = "front-listener-tcp"
    protocol = "TCP"
    protocol_port = 22
    loadbalancer_id = "${openstack_lb_loadbalancer_v2.front-lb.id}"
    timeout_member_data = 1000000
    timeout_client_data = 1000000
}

# pool
resource "openstack_lb_pool_v2" "front-pool-22" {

    name = "front-pool"
    protocol = "TCP"
    lb_method = "ROUND_ROBIN"
    listener_id = "${openstack_lb_listener_v2.front-listener-22.id}"

}

# member
resource "openstack_lb_member_v2" "front-member-22" {
    name = "front-member"
    pool_id = "${openstack_lb_pool_v2.front-pool-22.id}"
    address = "${openstack_networking_port_v2.ports.0.all_fixed_ips[0]}"
    protocol_port = "22"
}

# health monitor
resource "openstack_lb_monitor_v2" "front-monitor-22" {
    pool_id = "${openstack_lb_pool_v2.front-pool-22.id}"
    type = "TCP"
    delay = 20
    timeout = 10
    max_retries = 5
}
