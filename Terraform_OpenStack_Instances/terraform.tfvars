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
network_subnet_cidr = ""

#Provider network router namen = "Test floating ip for Test Instance"
network_router_name = ""

#External ip address used for this router [ ip or id alowed ]
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

#This case is using existing key, generated from Openstak
keypair_name = ""

####################### INSTANCES ############################

#Instance names on creation
instance_name = ""

#What image is used to create instance [ iso name or id alowed ]
instance_image = ""

#Instance server parrameters = 2 cpu x 4 ram x 10gb space [2x4x10]
instance_flavor = "2x4x10"

#Openstack avalialbility zone
instance_availability_zone = ""

####################### SSH HOST CONNECTION ##################

#Openstack instance ssh.pem file directory on local machine
ssh_path = ""

####################### FLOATING IP ##########################

#In this case this is the address used to access instance from external world - public or ...
floatingip_pool = ""

floatingip_description = ""