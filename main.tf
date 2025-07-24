terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.8.0"
    }
  }
}

provider "google" {
  # credentials = file("<PATH_TO_YOUR_SERVICE_ACCOUNT_JSON>")
  project = var.main_project
  region  = var.region
  zone    = var.zone
}

# # if you use YAML istead of tfvars file
# locals {
#   data = yamldecode(file("projects.yaml"))
# }

resource "google_project" "projects" {
  for_each = { for proj in var.projects : proj.project_id => proj }

  name       = each.value.name
  project_id = each.value.project_id

  labels          = each.value.labels
  deletion_policy = var.delete_policy
}

# resource "google_project_iam_member" "editor" {
#   for_each = { for proj in var.projects : proj.project_id => proj }

#   project = each.value.project_id
#   role    = "roles/editor"
#   member  = "user:${var.editor_user_email}"
# }


# terraform {
#   required_providers {
#     google = {
#       source  = "hashicorp/google"
#       version = "6.8.0"
#     }
#   }
# }
# provider "google" {
#   project = "sharp-harbor-466005-p5"
#   region  = "us-central1"
#   zone    = "us-central1-c"
# }
# resource "google_project" "my-org-setup" {
#   name            = "payment-dev-project-01"
#   project_id      = "payment-dev-project-01"
#   labels          =    {
#     environment = "dev"
#     owner       = "saikrishna"
#     costcenter  = "gcp-free-trial"
#   }
#   deletion_policy = "DELETE"
# }

# # Top-level folder under an organization.
# resource "google_folder" "department1" {
#   display_name = "Payment"
#   parent       = "organizations/1234567"
# }

# # Folder nested under another folder.
# resource "google_folder" "team-abc" {
#   display_name = "Team ABC"
#   parent       = google_folder.department1.name
# }

# # Folder with a tag
# resource "google_folder" "department1" {
#   display_name = "Department 1"
#   parent       = "organizations/1234567"
#   tags = {"1234567/env":"staging"}
# }

# locals {
#   data = yamldecode(file("projects.yaml"))
# }