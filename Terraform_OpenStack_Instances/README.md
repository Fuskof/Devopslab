Terraform documentation to automate creation in Openstack of a router/network/subnet/floatingip/instance.

--------------------------------------------------

Terrafrom version used: 
		Terraform v0.12.24
		- provider.null: version 2.1
        - provider.openstack: version 1.29

NOTES:
	*Official documentation - https://www.terraform.io/docs/providers/index.html

-------------------------------------------------

Plan overview:

    This terraform template creates:
    *Network *Subnet *Router *Instance, assign ipv4 address and floatingip address from created router and subnet.
    After instance is created the resource "provision" connects working directory to instance and as described in openstack.tf steps. 
    The step start to copy specific script file and execute it on the machine...
    To connect working directory to Instance, please provide existing ssh key from Openstack. 
    Create new one or copy existing one in a .pem file and place it in the working directory or provide the patch directory where it is
    placed, remember to change the .pem name or/and full directory to it in .tfvars file in specified place.

------------------------------------------------

Openstack router/network/subnet/floatingip/instance creation:

	1. Check terraform.tfvars and update data with one that is valid.
	2. Run [ terraform init ] command, used to initialize a working directory containing Terraform configuration files.
	3. *Optional* Run [ terraform fmt ] command to rewrite Terraform configuration files to a canonical format and style. 
	4  *Optional* Run [ terraform validate ] to validates the configuration files in a directory.
	5. *Optional* Run [ terraform plan ] command, used to create an execution plan and see what changes will be done.
	5. Run [ terraform apply ] command, used to apply the changes required to reach the desired state of the configuration.

Terraform template used in this repo:
	
	[ provider.tf ]

		- Contains syntax to work with Openstack provider.


	[ openstack.tf ]
		
		- Contains syntax to work with openstack provider.
		- Each resource have arguments
            ~ resource "openstack_networking_network_v2"			[ used to create new network ]
			~ resource "openstack_networking_subnet_v2"		        [ used to create new subnet ]
			~ resource "openstack_networking_router_v2"	        	[ used to create new router ]
			~ resource "openstack_networking_router_interface_v2" 	[ used to create router interface ]
            ~ resource "openstack_compute_secgroup_v2"              [ used to create mew security groupe ]
            ~ resource "openstack_compute_instance_v2"              [ used to create new instance ]
            ~ resource "openstack_networking_floatingip_v2"	        [ used to create new network floating ip to externalize instances ]
            ~ resource "openstack_compute_floatingip_associate_v2"	[ used to associate floating ip to a instance ]
            ~ resource "null_resource" "provision"                  [ used to connect to an instance and execute commands/scripts... ]
                        * provisioner "file"
                        * provisioner "remote-exec" 


	[ variables.tf ]
	
		- Contains variables placeholders reprezented in devopslab.tf file.
		- Variables used in this file:
            ####################### PROVIDER AUTHENTICATION #########################

            #Openstack user authentication
            variable "openstack_user_auth" {}

            #Openstack tenant authentication
            variable "openstack_tenant_auth"{}

            #Openstack password authentication
            variable "openstack_user_pass" {}

            #Openstack url address
            variable "openstack_auth_url" {}

            ####################### NETWORKING #########################

            #Openstack network name
            variable "openstack_network_name" {}

            #Openstack subnet name
            variable "openstack_subnet_name" {}

            #Openstack subnet cidr type
            variable "network_subnet_cidr" {}

            #Openstack network router name
            variable "network_router_name" {}

            #External ip address used for this router [ ip or id alowed ]
            variable "ext_network_id" {}

            #Openstack security groupe name
            variable "secgroup_name" {}

            #Openstack security groupe description
            variable "secgroup_descritpion" {}

            #Openstack security groupe rules
            variable "from_port_nr" {}
            variable "to_port_nr" {}
            variable "ip_protocol_name" {}
            variable "secgroup_cidr_rout" {}

            ####################### SSH KEY PAIR #########################

            #This case is using existing key, generated from Openstak
            variable "keypair_name" {}

            ####################### INSTANCES ############################

            #Openstack Instance names on creation
            variable "instance_name" {}

            #What image is used to create instance [ iso name or id alowed ]
            variable "instance_image" {}

            #Openstack Instance server parrameters = 2 cpu x 2 ram x 10gb space [2x2x10]
            variable "instance_flavor" {}

            #Openstack avalialbility zone
            variable "instance_availability_zone" {}

            ####################### SSH HOST CONNECTION ###################

            #Openstack instance ssh.pem file directory on local machine
            variable "ssh_path" {}

            ####################### FLOATING IP ###########################

            #In this case this is the address used to access instance from external world - public or ...
            variable "floatingip_pool" {}

            variable "floatingip_description" {}

	[ terraform.tfvars ]
		
		- Contains supply data for variables placeholders in openstack.tf file, working throw mentioned variable.tf file.
		- Variables to be changed:
            ####################### PROVIDER AUTHENTICATION ##############

            #Provider user authentication
            openstack_user_auth             = "REPLACE_WITH_YUR_OPENSTACK_USER"

            #Provider tenant authentication
            openstack_tenant_auth           = "REPLACE_WITH_YUR_PROJECT_NAME"

            #Provider password authentication
            openstack_user_pass             = "REPLACE_WITH_YUR_OPENSTACK_PASS"

            #Provider url address
            openstack_auth_url              = "REPLACE_WITH_YUR_OPENSTACK_CLOUD"

            ####################### NETWORKING #########################

            #Provider network name
            openstack_network_name          = "REPLACE_WITH_YUR_OPENSTACK_NETWORK_NAME"

            #Provider subnet name
            openstack_subnet_name           = "REPLACE_WITH_YUR_OPENSTACK_SUBNET_NAME"

            #Provider subnet cidr type
            network_subnet_cidr             = "REPLACE_WITH_YUR_OPENSTACK_NETWORK_NAME"

            #Provider network router namen  
            network_router_name             = "REPLACE_WITH_YUR_OPENSTACK_ROUTER_NAME"

            #External ip address used for this router [ ip or id alowed ]
            ext_network_id                  = "REPLACE_WITH_YUR_OPENSTACK_EXTERNAL_IP_or_ID"

            #Provider security group name
            secgroup_name                   = "REPLACE_WITH_YUR_OPENSTACK_SECURITYGROUP_NAME"

            #Provider security group descriptionNOTES:
            secgroup_descritpion            = "REPLACE_WITH_YUR_OPENSTACK_SECURITYGROUP_NAME"

            #Provider security groupe rules
            from_port_nr                    = "22"
            to_port_nr                      = "22"
            ip_protocol_name                = "tcp"
            secgroup_cidr_rout              = "0.0.0.0/0"

            ####################### SSH KEY PAIR #########################

            #This case is using existing key, generated from Openstak
            keypair_name                    = "REPLACE_WITH_YUR_OPENSTACK_EXISTING_KEYPAIR_NAME"

            ####################### INSTANCES ############################

            #Instance names on creation
            instance_name                   = "REPLACE_WITH_YUR_OPENSTACK_INSTANCE_NAME"

            #What image is used to create instance [ iso name or id alowed ]
            instance_image                  = "REPLACE_WITH_YUR_OPENSTACK_IMAGE_NAME_or_ID"

            #Instance server parrameters = 2 cpu x 4 ram x 10gb space [2x4x10]
            instance_flavor                 = "2x4x10"

            #Openstack avalialbility zone
            instance_availability_zone      = "REPLACE_WITH_YUR_OPENSTACK_AVAILABLE_ZONE_NAME"

            ####################### SSH HOST CONNECTION ##################

            #Openstack instance ssh.pem file directory on local machine
            ssh_path                        = "REPLACE_WITH_YUR_OPENSTACK_KEYPAIR_NAME_or_DIRECTORY_LOCATION"

            ####################### FLOATING IP ##########################

            #In this case this is the address used to access instance from external world - public or ...
            floatingip_pool                 = "REPLACE_WITH_YUR_OPENSTACK_FLOATINGIP_POOL"

            floatingip_description          = "REPLACE_WITH_YUR_OPENSTACK_FLOATINGIP_DESCRIPTION"