resource "openstack_networking_network_v2" "OpenstackN" {
  name           = var.openstack_network_name
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "OpenstackS" {
  name       = var.openstack_subnet_name
  network_id = openstack_networking_network_v2.OpenstackN.id
  cidr       = var.network_subnet_cidr
  ip_version = 4
}

resource "openstack_networking_router_v2" "OpenstackR" {
  name                = var.network_router_name
  admin_state_up      = true
  external_network_id = var.ext_network_id
}

resource "openstack_networking_router_interface_v2" "OpenstackRI" {
router_id = openstack_networking_router_v2.OpenstackR.id
subnet_id = openstack_networking_subnet_v2.OpenstackS.id
}

resource "openstack_compute_secgroup_v2" "OpenstackSecG" {
  name        = var.secgroup_name
  description = var.secgroup_descritpion

  rule {
    from_port   = var.from_port_nr
    to_port     = var.to_port_nr
    ip_protocol = var.ip_protocol_name
    cidr        = var.secgroup_cidr_rout
  }
}

resource "openstack_compute_instance_v2" "OpenstackVM" {
  name                = var.instance_name
  image_id            = var.instance_image
  availability_zone   = var.instance_availability_zone
  flavor_name         = var.instance_flavor
  key_pair            = var.keypair_name
  security_groups     = [ openstack_compute_secgroup_v2.OpenstackSecG.name ]
  network {
    name              = openstack_networking_network_v2.OpenstackN.name
  }
}

resource "openstack_networking_floatingip_v2" "OpenstackFI" {
  pool        = var.floatingip_pool
  description = var.floatingip_description
}

resource "openstack_compute_floatingip_associate_v2" "OpenstackFI" {
  floating_ip = openstack_networking_floatingip_v2.OpenstackFI.address
  instance_id = openstack_compute_instance_v2.OpenstackVM.id
}

resource "null_resource" "provision" {
  depends_on    = [ openstack_compute_floatingip_associate_v2.OpenstackFI ]
  connection {
    user        = "centos"
    private_key = file(var.ssh_path)
    host        = openstack_networking_floatingip_v2.OpenstackFI.address
  }

  provisioner "file" {
    source      = "grafana.sh"
    destination = "/tmp/grafana.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/grafana.sh",
      "/tmp/grafana.sh args"
    ]
  }
}