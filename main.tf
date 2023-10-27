terraform {
  required_version = ">= 0.13.1"

  required_providers {
    shoreline = {
      source  = "shorelinesoftware/shoreline"
      version = ">= 1.11.0"
    }
  }
}

provider "shoreline" {
  retries = 2
  debug = true
}

module "slow_job_execution_in_spark_cluster" {
  source    = "./modules/slow_job_execution_in_spark_cluster"

  providers = {
    shoreline = shoreline
  }
}