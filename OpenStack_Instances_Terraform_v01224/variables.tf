####################### PROVIDER AUTHENTICATION #########################

#Openstack user authentication
variable    "openstack_user_auth"{}

#Openstack tenant authentication
variable    "openstack_tenant_auth"{}

#Openstack password authentication
variable    "openstack_user_pass" {}

#Openstack url address
variable    "openstack_auth_url" {}

####################### NETWORKING #########################

#Openstack network name
variable    "openstack_network_name" {}

#Openstack subnet name
variable    "openstack_subnet_name" {}

#Openstack subnet cidr type
variable    "network_subnet_cidr" {}

#Openstack network router name
variable    "network_router_name" {}

#External ip address used for this router [ ip or id alowed ]
variable    "ext_network_id" {}

#Openstack security group name
variable    "secgroup_name" {}

#Openstack security group description
variable    "secgroup_descritpion" {}

#Openstack security group rules
variable    "from_port_nr" {}
variable    "to_port_nr" {}
variable    "ip_protocol_name" {}
variable    "secgroup_cidr_rout" {}

####################### SSH KEY PAIR #########################

#This case is using existing key, generated from Openstak
variable    "keypair_name" {}

####################### INSTANCES ############################

#Openstack Instance names on creation
variable    "instance_name" {}

#What image is used to create instance [ iso name or id alowed ]
variable    "instance_image" {}

#Openstack Instance server parrameters = 2 cpu x 2 ram x 10gb space [2x2x10]
variable    "instance_flavor" {}

#Openstack avalialbility zone
variable    "instance_availability_zone" {}

####################### SSH HOST CONNECTION ###################

#Openstack instance ssh.pem file name or/and directory on local machine
variable    "ssh_path" {}

####################### FLOATING IP ###########################

#In this case this is the address used to access instance from external world - public or ...
variable    "floatingip_pool" {}

variable    "floatingip_description" {}