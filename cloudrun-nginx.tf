resource "google_project_service" "svc-cloudrun" {
  service = "run.googleapis.com"
}

resource "google_cloud_run_service" "cbtnginx01" {
  name = "cbtnginx01"
  location = "us-west3"

  template {
    spec {
      containers {
        image = "docker.io/library/nginx"
        ports {
          container_port = 80
        }
      }
    }
  }
  traffic {
    percent = 100
  }
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = google_cloud_run_service.cbtnginx01.location
  project     = google_cloud_run_service.cbtnginx01.project
  service     = google_cloud_run_service.cbtnginx01.name

  policy_data = data.google_iam_policy.noauth.policy_data
}