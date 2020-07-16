provider "grafana" {
  url  = "${var.graf_provider_url}"
  auth = "${var.graf_provider_auth}"
}

resource "grafana_folder" "collection" {
  title = "${var.graf_folder_title}"
}

resource "grafana_dashboard" "metrics" {
  config_json = "${file("telegraf-system-dashboard_rev4.json")}"
  folder      = "${grafana_folder.collection.id}"
}

resource "grafana_data_source" "influxdb" {
  type          = "influxdb"
  name          = "InfluxDB"
  url           = "https://influx.itech.md/"
  username      = "admin"
  password      = "${var.influx_db_pass}"
  access_mode   = "direct"
  database_name = "telegraf"
}

resource "grafana_organization" "test-org" {
    name         = "${var.org_name}"
    admin_user   = "admin"
    create_users = true
    viewers      = [
        "${var.org_user1}"
    ]
}

resource "grafana_alert_notification" "slack" {
  name = "Devops Lab"
  type = "slack"

  settings {
    "slack" = "https://hooks.slack.com/services/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"
    "recipient" = "@Igor"
    "uploadImage" = "false"
  }
}