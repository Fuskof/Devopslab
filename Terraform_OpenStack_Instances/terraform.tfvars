####################### PROVIDER AUTHENTICATION ##############

#Provider user authentication
openstack_user_auth = ""

#Provider tenant authentication
openstack_tenant_auth = ""

#Provider password authentication
openstack_user_pass = ""

#Provider url address
openstack_auth_url= ""

####################### NETWORKING #########################

#Provider network name
openstack_network_name = ""

#Provider subnet name
openstack_subnet_name = ""

#Provider subnet cidr type
network_subnet_cidr = "192.168.1.0/24"

#Provider network router name
network_router_name = ""

#External ip address used for this router
ext_network_id = ""

#Provider security groupe name
secgroup_name = ""

#Provider security groupe description
secgroup_descritpion = ""

#Provider security groupe rules
from_port_nr = "22"
to_port_nr = "22"
ip_protocol_name = "tcp"
secgroup_cidr_rout = "0.0.0.0/0"

####################### SSH KEY PAIR #########################

#Using existing key, generated from Openstak
keypair_name = ""

####################### INSTANCES ############################

#Number of instances on creation
#instance_count = "1"

#Instance names on creation
instance_name = ""

#What image is used to create instance
instance_image = ""

#Instance server parrameters
instance_flavor = "2x4x10"

#Openstack avalialbility zone
instance_availability_zone = ""

####################### SSH HOST CONNECTION ##################

#Openstack instance ssh.pem file directory on local machine
ssh_path = ""

####################### FLOATING IP ##########################

floatingip_pool = ""

floatingip_description = ""