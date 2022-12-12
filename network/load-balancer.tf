# resource "openstack_lb_loadbalancer_v2" "my-lb" {
#     name = "mre-terra-lb"
#     vip_subnet_id = "2393e522-6e11-44c4-b97b-c6fd90cd8e3d"
#     # availability_zone = var.openstack_availability_zone
#     admin_state_up = "true"
#     # security_group_ids = [ "26049ca1-5a57-4896-877d-88d0f0b2794c", openstack_networking_secgroup_v2.secgroup.id ]

#     # depends_on = [
#     #     openstack_lb_member_v2.my-member-calendar,
#     #     # openstack_lb_listener_v2.my-listener-schedule,
#     #     # openstack_lb_listener_v2.my-listener-grades
#     # ]
# }

# # loadbalancer fip
# resource "openstack_networking_floatingip_associate_v2" "lb-fip" {
#   floating_ip = "10.232.28.9"
#   port_id = "${openstack_lb_loadbalancer_v2.my-lb.vip_port_id}"
# }

# # listener
# resource "openstack_lb_listener_v2" "my-listener-calendar" {
#     name = "listener-calendar"
#     protocol = "TCP"
#     protocol_port = 5434
#     loadbalancer_id = "${openstack_lb_loadbalancer_v2.my-lb.id}"

#     # depends_on = [
#     #     openstack_lb_loadbalancer_v2.my-lb
#     # ]
# }

# resource "openstack_lb_listener_v2" "my-listener-schedule" {
#     name = "listener-schedule"
#     protocol = "TCP"
#     protocol_port = 5433
#     loadbalancer_id = "${openstack_lb_loadbalancer_v2.my-lb.id}"

#     # depends_on = [
#     #     openstack_lb_loadbalancer_v2.my-lb
#     # ]
# }

# resource "openstack_lb_listener_v2" "my-listener-grades" {
#     name = "listener-grades"
#     protocol = "TCP"
#     protocol_port = 5432
#     loadbalancer_id = "${openstack_lb_loadbalancer_v2.my-lb.id}"

#     # depends_on = [
#     #     openstack_lb_loadbalancer_v2.my-lb
#     # ]
# }

# # pool
# resource "openstack_lb_pool_v2" "my-pool-calendar" {
#     name = "pool-calendar"
#     protocol = "TCP"
#     lb_method = "ROUND_ROBIN"
#     listener_id = "${openstack_lb_listener_v2.my-listener-calendar.id}"

#     # depends_on = [
#     #     openstack_lb_listener_v2.my-listener-calendar
#     # ]
# }

# resource "openstack_lb_pool_v2" "my-pool-schedule" {
#     name = "pool-schedule"
#     protocol = "TCP"
#     lb_method = "ROUND_ROBIN"
#     listener_id = "${openstack_lb_listener_v2.my-listener-schedule.id}"

#     # depends_on = [
#     #     openstack_lb_listener_v2.my-listener-schedule
#     # ]
# }

# resource "openstack_lb_pool_v2" "my-pool-grades" {
#     name = "pool-grades"
#     protocol = "TCP"
#     lb_method = "ROUND_ROBIN"
#     listener_id = "${openstack_lb_listener_v2.my-listener-grades.id}"

#     # depends_on = [
#     #     openstack_lb_listener_v2.my-listener-grades
#     # ]
# }

# # member
# resource "openstack_lb_member_v2" "my-member-calendar" {
#     name = "member-calendar"
#     pool_id = "${openstack_lb_pool_v2.my-pool-calendar.id}"
#     address = "10.11.12.185"
#     protocol_port = "5432"

#     # depends_on = [
#     #     openstack_lb_pool_v2.my-pool-calendar
#     # ]
# }

# resource "openstack_lb_member_v2" "my-member-schedule" {
#     name = "member-schedule"
#     pool_id = "${openstack_lb_pool_v2.my-pool-schedule.id}"
#     address = "10.11.12.42"
#     protocol_port = "5432"

#     # depends_on = [
#     #     openstack_lb_pool_v2.my-pool-schedule
#     # ]
# }

# resource "openstack_lb_member_v2" "my-member-grades" {
#     name = "member-grades"
#     pool_id = "${openstack_lb_pool_v2.my-pool-grades.id}"
#     address = "10.11.12.57"
#     protocol_port = "5432"

#     # depends_on = [
#     #     openstack_lb_pool_v2.my-pool-grades
#     # ]
# }

# # health monitor
# resource "openstack_lb_monitor_v2" "monitor-calendar" {
#     pool_id = "${openstack_lb_pool_v2.my-pool-calendar.id}"
#     type        = "TCP"
#     delay       = 20
#     timeout     = 10
#     max_retries = 5
# }

# resource "openstack_lb_monitor_v2" "monitor-schedule" {
#     pool_id = "${openstack_lb_pool_v2.my-pool-schedule.id}"
#     type        = "TCP"
#     delay       = 20
#     timeout     = 10
#     max_retries = 5
# }

# resource "openstack_lb_monitor_v2" "monitor-grades" {
#     pool_id = "${openstack_lb_pool_v2.my-pool-grades.id}"
#     type        = "TCP"
#     delay       = 20
#     timeout     = 10
#     max_retries = 5
# }