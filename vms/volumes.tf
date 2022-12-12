resource "openstack_blockstorage_volume_v3" "my-volume" {
    count = var.openstack_iaas_volume_count
    name = "mre-vol-${count.index + 1}"
    availability_zone = var.openstack_availability_zone
    volume_type = "gp-ssd"
    image_id = var.openstack_image_id
    region = var.openstack_region
    size = 10
}