resource "github_repository" "app" {
  name       = var.spring_application_name
  visibility = "private"

  # If the repo is empty, github_branch resource creation will fail
  auto_init = true
}

resource "github_branch" "app_main" {
  repository = github_repository.app.name
  branch     = "main"
}

resource "github_branch" "app_prod" {
  repository = github_repository.app.name
  branch     = "prod"
}

resource "github_branch_default" "app_default" {
  repository = github_repository.app.name
  branch     = github_branch.app_main.branch
}

# Used in the application's Maven configuration (pom.xml) when building
# and pushing the container image.
# GitHub Actions will expose the secret as an environment variable
resource "github_actions_secret" "google_artifact_registry_docker_repo" {
  repository      = github_repository.app.name
  secret_name     = "GOOGLE_ARTIFACT_REGISTRY_DOCKER_REPO"
  plaintext_value = local.google_artifact_registry_docker_repo
}
