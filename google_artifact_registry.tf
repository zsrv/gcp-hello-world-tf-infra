resource "google_project_service" "artifactregistry_api" {
  service = "artifactregistry.googleapis.com"

  disable_dependent_services = true
  disable_on_destroy         = true
}

resource "google_artifact_registry_repository" "app_docker" {
  provider = google-beta

  location      = data.google_client_config.current.region
  repository_id = "${var.spring_application_name}-docker"
  description   = "Container image repository"
  format        = "DOCKER"

  depends_on = [
    google_project_service.artifactregistry_api
  ]
}

locals {
  google_artifact_registry_docker_repo = "${google_artifact_registry_repository.app_docker.location}-docker.pkg.dev/${var.google_project_id}/${google_artifact_registry_repository.app_docker.repository_id}"
}
