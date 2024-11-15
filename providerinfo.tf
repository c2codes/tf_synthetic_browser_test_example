terraform {
  required_providers {
    synthetics = {
      version = "2.0.3"
      source  = "splunk/synthetics"
    }
  }
}

provider "synthetics" {
  product = "observability"
  realm = var.realm
  apikey = var.api_key
}
