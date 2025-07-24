main_project = "gcp-terra-etl"

# delete_policy = "DELETE"

projects = [
  {
    name       = "payments-dev-project-06"
    project_id = "payments-dev-project-06"
    labels = {
      env    = "dev"
      folder = "payments"
    }
  },
  {
    name       = "payments-prod-project-06"
    project_id = "payments-prod-project-06"
    labels = {
      env    = "prod"
      folder = "payments"
    }
  },
  {
    name       = "analytics-dev-project-06"
    project_id = "analytics-dev-project-06"
    labels = {
      env    = "dev"
      folder = "analytics"
    }
  },
  {
    name       = "analytics-prod-project-06"
    project_id = "analytics-prod-project-06"
    labels = {
      env    = "prod"
      folder = "analytics"
    }
  },
]
