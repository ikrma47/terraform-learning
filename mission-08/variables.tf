variable "environment" {
  type        = string
  description = "Environment name used in resource name and labels."
  default     = "dev"

  validation {
    condition     = contains(["dev", "test"], var.environment)
    error_message = "Only dev and test are allowed in the sandbox."
  }
}

variable "project_id" {
  type        = string
  description = "GCP learning project id"
  default     = "gcpsandboxgeneral"
}

variable "region" {
  type        = string
  description = "GCP region to be used in learning"
  default     = "us-central1"

  validation {
    condition     = startswith(var.region, "us-")
    error_message = "Use a US region to stay inside the free tier."
  }
}

variable "db_password" {
  type        = string
  description = "Database password."
  sensitive   = true
  ephemeral   = true
}