Terraform documentation to automate grafana dashboards creation.

Terrafrom version used: 
		Terraform v0.12.24
		+ provider.grafana v1.5.0
		
Grafana Servers version used:
		Version 7.1.0

	Quick overview on Syntax used in devopslab.tf file: 
	
		- provider "grafana" 				[ used to call grafana plugin ]
		
		- resource "grafana_folder"   		[ used to create folders ]
		
		- resource "grafana_dashboard" 		[ used to create a dashbord with help of a .json file ( template exported from grafana ) ]
		
		- resource "grafana_data_source" 		[ used to create database config from where metrics will be retrieved ]
		
		- resource "grafana_alert_notification" 	[ used to create notification alert address ( slack used in this example ) ]
		
NOTES:
	*For a bit detailed info of grafana provider use *official documentation - https://www.terraform.io/docs/providers/grafana/index.html
	
	*In devopslabfile.tf have variables states/place holders that are specified in terraform.tfvars file
	This permits us to reuse devopsfile.tf for different configurations.
