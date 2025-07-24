variable "main_project" {
  type        = string
  description = "we are using the free trail account"
}

variable "delete_policy" {
  type    = string
  default = "PREVENT"
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "zone" {
  type    = string
  default = "us-central1-c"
}

variable "projects" {
  type = list(object({
    name       = string
    project_id = string
    labels     = map(string)
  }))
}
