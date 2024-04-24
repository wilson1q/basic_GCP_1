terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "gcp-class5"
  region = "us-east-1"
  zone = "us-east-1a"
  credentials = "gcp-class5-e86cecf167a3.json"
}

resource "google_storage_bucket" "class5-bucket-1" {
  name          = "class5-bucket-1"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}