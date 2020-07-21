####################### PROVIDER AUTHENTICATION #########################

#Provider user authentication
variable "openstack_user_auth" {}

#Provider tenant authentication
variable "openstack_tenant_auth"{}

#Provider password authentication
variable "openstack_user_pass" {}

#Provider url address
variable "openstack_auth_url" {}

####################### NETWORKING #########################

#Provider network name
variable "openstack_network_name" {}

#Provider subnet name
variable "openstack_subnet_name" {}

#Provider subnet cidr type
variable "network_subnet_cidr" {}

#Provider network router name
variable "network_router_name" {}

#External ip address used for this router
variable "ext_network_id" {}

#Provider security groupe name
variable "secgroup_name" {}

#Provider security groupe description
variable "secgroup_descritpion" {}

#Provider security groupe rules
variable "from_port_nr" {}
variable "to_port_nr" {}
variable "ip_protocol_name" {}
variable "secgroup_cidr_rout" {}

####################### SSH KEY PAIR #########################

#Generate new public key
variable "keypair_name" {}

####################### INSTANCES #########################

#Number of instances on creation
#variable "instance_count" {}

#Instance names on creation
variable "instance_name" {}

#What image is used to create instance
variable "instance_image" {}

#Instance server parrameters
variable "instance_flavor" {}

#Openstack avalialbility zone
variable "instance_availability_zone" {}

####################### FLOATING IP #########################

variable "floatingip_pool" {}

variable "floatingip_description" {}