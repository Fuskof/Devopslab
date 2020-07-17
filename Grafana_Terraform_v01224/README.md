Terraform documentation to automate grafana dashboards creation with grafana provider.
The Grafana provider configures data sources and dashboards in Grafana.

Terrafrom version used: 
		Terraform v0.12.24
		+ provider.grafana v1.5.0
		
Grafana Servers version used:
		Version 7.1.0

-------------------------------------------------
Terraform template used in this repo:
	
	[ provider.tf ]

		- Contains syntax to work with grafana provider.


	[ grafana.tf ]
		
		- Contains syntax to work with grafana provider.
		- Each title have arguments
			~ resource "grafana_folder"			[ used to create folders ]
			~ resource "grafana_dashboard"		[ used to create a dashbord with help of a .json file ( template exported from grafana ) ]
			~ resource "grafana_data_source"		[ used to create database config from where metrics will be retrieved ]
			~ resource "grafana_alert_notification" 	[ used to create notification alert address ( slack used in this example ) ]
		
	[ variables.tf ]
	
		- Contains variables placeholders reprezented in devopslab.tf file.
		- Variables used in this file:
			~ graf_provider_url		/ grafana server address url
			~ graf_provider_auth		/ grafana auth token"SLACK_WEBHOOK_URL"
			~ graf_folder_title		/ title of where dashboard will be created
			~ influx_db_url		/ influx database address"SLACK_WEBHOOK_URL"
			~ influx_db_pass		/ influx database authentification password
			~ slack_ch_url			/ slack webhook address url

	[ terraform.tfvars ]
		
		- Contains supply data for variables placeholders in devopslab.tf file, working throw mentioned variable.tf file.
		- Variables to be changed:
			~ graf_provider_url = "REPLACE_WITH_YUR_API_URL"
			~ graf_provider_auth = "REPLACE_WITH_YUR_API_KEY"
			~ graf_folder_title = "REPLACE_WITH_YUR_FOLDER_NAME"
			~ influx_db_url = "REPLACE_WITH_YUR_DB_URL"
			~ influx_db_pass = "KEEPASSX"
			~ slack_ch_url = "SLACK_WEBHOOK_URL"
----------------------------------------------

Creation of dashboard:
	
	1. Check terraform.tfvars and update data with one that is valid.
	2. Run [ terraform init ] command, used to initialize a working directory containing Terraform configuration files.
	3. *Optional* Run [ terraform fmt ] command to rewrite Terraform configuration files to a canonical format and style. 
	4  *Optional* Run [ terraform validate ] to validates the configuration files in a directory.
	5. *Optional* Run [ terraform plan ] command, used to create an execution plan and see what changes will be done.
	5. Run [ terraform apply ] command, used to apply the changes required to reach the desired state of the configuration.


NOTES:
	*Official documentation - https://www.terraform.io/docs/providers/grafana/index.html
