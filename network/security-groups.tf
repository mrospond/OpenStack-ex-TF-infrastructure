# sec-group
resource "openstack_networking_secgroup_v2" "secgroup" {
    name = "mre-sec-group"
}

# rule-ssh in
resource "openstack_networking_secgroup_rule_v2" "rule-ssh-in" {
    direction = "ingress"
    ethertype = "IPv4"
    protocol = "tcp"
    port_range_min = 22
    port_range_max = 22
    remote_ip_prefix  = "0.0.0.0/0"
    security_group_id = "${openstack_networking_secgroup_v2.secgroup.id}"
}

# rule-http in
resource "openstack_networking_secgroup_rule_v2" "rule-http-in" {
    direction = "ingress"
    ethertype = "IPv4"
    protocol = "tcp"
    port_range_min = 80
    port_range_max = 80
    remote_ip_prefix  = "0.0.0.0/0"
    security_group_id = "${openstack_networking_secgroup_v2.secgroup.id}"
}

# rule-https in
resource "openstack_networking_secgroup_rule_v2" "rule-https-in" {
    direction = "ingress"
    ethertype = "IPv4"
    protocol = "tcp"
    port_range_min = 443
    port_range_max = 443
    remote_ip_prefix  = "0.0.0.0/0"
    security_group_id = "${openstack_networking_secgroup_v2.secgroup.id}"
}

# rule-all out
resource "openstack_networking_secgroup_rule_v2" "rule-all-out" {
    direction = "egress"
    ethertype = "IPv4"
    protocol = "tcp"
    remote_ip_prefix  = "0.0.0.0/0"
    security_group_id = "${openstack_networking_secgroup_v2.secgroup.id}"
}