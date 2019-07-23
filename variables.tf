variable "product_name" {}

variable "product_code_tag" {}
variable "inventory_code_tag" {}
variable "account_tag" {}
variable "environment_tag" {}
variable "vpc" {}
variable "tier" {}
variable "availability_zone" {}

variable "gatling_java_opts" {}

variable "instance_type" {}
variable "ssh_key" {}
variable "gatling_instances" {}
variable "enable_monitoring" {
  default = "false"
}
variable "ebs_optimized" {
  default = "false"
}

##### Starndard trending/monitoring stuffs
variable "cadvisor_url" {
  default = "https://github.com/google/cadvisor/releases/download/v0.22.0/cadvisor"
}

variable "cadvisor_port" {
  default = 4914
}

variable "bucket_access" {
  default = "private"
}

# simulation repo branch
variable "gatling_scenario_branch" {
  default = ""
}

# simulation repo commit hash
variable "git_commit" {
  default = ""
}

## Terraform will run for 50 minutes before killing the job. Can be increased.
variable "max_runtime" {
  default = "3000"
}

# Debug gatling config is available
variable "config" {
  default = "cloud-config.yaml"
}

variable "gatling_version" {
  default = "2.2.4"
}

## Repo of Gatling Simulations and Configuration
variable "gatling_scenario_repo" {
  default = ""
}

## If Gatling Simulations are in a Sub-Folder of Repo i.e. gatling-tests/
variable "gatling_scenario_location" {
  default = ""
}

## Name of Gatling Simulation to Execute
variable "simulation_name" {
  default = ""
}

variable "run_description" {
  default = ""
}

# Variables for Reports bucket. Do not change.
variable "s3_report_bucket" {
  default = "prd00000121.gatling.prod1.us-east-1.tmaws-report"
}
variable "report_bucket_arn" {
  default = "arn:aws:s3:::prd00000121.gatling.prod1.us-east-1.tmaws-report"
}

variable "awscli_version" {
  default = "1.10.64"
}
variable "client_name" {
  default = "CLIENT"
}

variable "network" {
  default = "bridge"
}