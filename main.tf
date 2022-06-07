provider "google" {
  project = var.google_project_id
  region  = var.google_region
  zone    = var.google_zone
}

provider "google-beta" {
  project = var.google_project_id
  region  = var.google_region
  zone    = var.google_zone
}

provider "github" {
  token = var.github_oauth_token
}

data "google_client_config" "current" {
  provider = google
}
