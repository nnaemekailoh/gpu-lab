terraform {
  required_version = ">= 1.6"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.99"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}
