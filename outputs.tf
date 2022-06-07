# Used by the application deployment Terraform configuration
output "google_artifact_registry_docker_repo" {
  value = "${google_artifact_registry_repository.app_docker.location}-docker.pkg.dev/${var.google_project_id}/${google_artifact_registry_repository.app_docker.repository_id}"
}
