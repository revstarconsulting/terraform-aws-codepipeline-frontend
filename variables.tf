
variable "environment" {
  type    = string
  default = ""
}

variable "account_id" {
  type    = string
  default = ""
}
variable "production_approval" {
  type        = bool
  default     = true
  description = "Manual approval before prod deployment"
}
variable "region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"
}

variable "project_name" {
  type        = string
  description = "Project name"
  default     = ""
}

variable "codestar_connection_arn" {
  description = "AWS CodeStart Connection ID"
  type        = string
  default     = ""
}

variable "github_repo_owner" {
  description = "Owner of repository"
  type        = string
  default     = ""
}


variable "github_repo_name" {
  description = "Name of backend repository"
  type        = string
  default     = ""
}

variable "github_repo_branch" {
  description = "Name of backend repository branch"
  type        = string
  default     = "main"
}

variable "s3_artifact_store" {
  description = "Bucket where artifacts will be stored"
  type        = string
  default     = ""
}

variable "s3_deploy_bucket" {
  description = "S3 bucket for app deployment"
  type        = string
  default     = ""
}


variable "cicd_role" {
  description = "IAM Role to attach with CI/CD pipeline"
  type        = string
  default     = ""
}

variable "pipeline_type" {
  description = "Type of pipeline to be build.. e.g frotned-app, frontend-admin, eks, lambda, etc"
  type        = string
  default     = ""
}

variable "app_name" {
  description = "Application name"
  type        = string
  default     = ""
}


variable "build_environments" {
  type        = any
  description = "list of environments to build ci/cd for"
  default     = []
}

variable "deploy_environments" {
  type        = any
  description = "list of environments to build ci/cd for"
  default     = []
}


variable "artifact_bucket_key" {
  type        = string
  default     = ""
  description = "KMS Key of artifact s3 bucket"
}

locals {
  common_tags = {
    environment = var.environment
    project     = var.project_name
    application = var.app_name
  }
}
