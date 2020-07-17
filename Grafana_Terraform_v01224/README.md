Terraform documentation to automatically create grafana dashboards.
Terrafrom version used: 
		Terraform v0.12.24
		+ provider.grafana v1.5.0
		
Grafana Servers version used:
		Version 7.1.0

Grafana informative dashboards with terraform provisioning using grafana provider and it's resources.

	Quick overview on Syntax used in devopslab.tf file: 
	
		- provider "grafana" 		[ used to call grafana plugin ]
		
		- resource "grafana_folder"   	[used to create folder ]
		
		- resource "grafana_dashboard" [ used to create a dashbord with help of a .json file ( template exported from grafana ) ]
		
		- resource "grafana_data_source" 	[ used to create database config from where metrics will be retrieved ]
		
		- resource "grafana_alert_notification" 	[ used to create notification alert address ( slack used in this example ) ]
		
	*official documentation - https://www.terraform.io/docs/providers/grafana/index.html
	
NOTES:
	devopslabfile.tf have variables states/place holders that are specified in terraform.tfvars file
	This permits us to reuse devopsfile.tf for different configurations.
