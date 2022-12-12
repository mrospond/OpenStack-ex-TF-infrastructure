resource "openstack_compute_instance_v2" "vms" {
  count = var.openstack_iaas_volume_count
  name = "mre-vm-${count.index + 1}"
  flavor_id = var.openstack_instance_flavor_id
  key_pair = "mre-key"
  availability_zone = var.openstack_availability_zone

  block_device {
    uuid = "${openstack_blockstorage_volume_v3.my-volume[count.index].id}"
    source_type = "volume"
    destination_type = "volume"
    # boot_index = 0
    delete_on_termination = true
  }

  network {
    name = "${openstack_networking_network_v2.my-network.name}"
    port = "${openstack_networking_port_v2.ports[count.index].id}"
  }

}