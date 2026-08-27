variable "project_id" {
  type        = string
  description = "ID of GCP Sandbox project"
  default     = "gcpsandboxgeneral"
}

variable "region" {
  type        = string
  description = "region used in gcp"
  default     = "northamerica-northeast2"
}