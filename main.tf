terraform {
  backend "s3" {
    bucket = "stackbooks-ci"
    key    = "gitlab-state.tfstate"
    region = "ap-south-1"
  }
}

variable "gitlab_credentials" {
  default = ""
}

locals {
  workspaces = jsondecode(var.gitlab_credentials)
}

variable "users" {
  default = {}
}

variable "groups" {
  default = {}
}

variable "user_namespaces" {
  default = {}
}

variable "group_namespaces" {
  default = {}
}

variable "projects" {
  default = {}
}

module "organization" {
  source           = "nishant-jain-94/organization/gitlab"
  version          = "1.0.0"
  gitlab_token     = lookup(local.workspaces[format("%s", terraform.workspace)], "gitlab_token", "")
  base_url         = lookup(local.workspaces[format("%s", terraform.workspace)], "base_url", "")
  users            = var.users
  projects         = var.projects
  groups           = var.groups
  user_namespaces  = var.user_namespaces
  group_namespaces = var.group_namespaces
}
