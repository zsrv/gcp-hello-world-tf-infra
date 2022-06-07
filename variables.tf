variable "google_credentials" {
  type        = string
  description = "The Google service account key, in json format, that will be used by GitHub Actions"
  sensitive   = true
}

variable "google_project_id" {
  type        = string
  description = "The Google Project ID to deploy to"
}

variable "google_region" {
  type        = string
  description = "The Google Cloud region to deploy to"
  default     = "us-central1"
}

variable "google_zone" {
  type        = string
  description = "The Google Cloud zone to deploy to (for zonal resources)"
  default     = "us-central1-c"
}

variable "spring_application_name" {
  type        = string
  description = "Spring Boot application name. This should match the value of the spring.application.name property in the Spring Boot project's bootstrap.properties file"
  default     = "gcp-hello-world"
}

variable "github_oauth_token" {
  type        = string
  description = "OAuth/Personal Access Token that will be used to authenticate to GitHub"
  sensitive   = true
}
