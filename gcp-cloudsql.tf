resource "google_project_service" "svc-cloudsqladmin" {
  service = "sqladmin.googleapis.com"
}

resource "google_project_service" "svc-cloudsql" {
  service = "sql-component.googleapis.com"
}

resource "google_sql_database_instance" "gcp-mysql01" {
  name             = "cbtnuggets-mysql"
  database_version = "MYSQL_8_0"
  region           = "us-west3"

  settings {
    tier = "db-f1-micro"
  }
}