provider "google" {
  project = "cbtproject01"
  region  = "us-west3"
  zone    = "us-west3-a"
}

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.67.0"
    }
  }
}