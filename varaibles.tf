#Provider url's
variable "graf_provider_url" {
	default = "http://194.33.42.188:3000/"
}

#Grafana provider auth
variable "graf_provider_auth" {
	default = "eyJrIjoiSXdEZXg2bEVkTm45a085dWhPUGxrR1BtMXRJQWxLOHgiLCJuIjoiZ3JhZmZhbmF0ZXJyYXRlc3QiLCJpZCI6MX0="
}

#Folder title
variable "graf_folder_title" {
	default = "Itech Test"
}

#Data source influx pass
variable "influx_db_pass" {
	default = "8ox85FNAc99WdEheRj7K"
}

#Itech organisations name
variable "org_name" {
	default = "Itech Test"
}

#Itech organisations users
variable "org_user1" {	
	default = "icojocaru@itech.md"
}