#resource "digitalocean_vpc" "lab" {
#  name     = "gpu-lab"
#  region   = var.region
#  ip_range = "10.50.0.0/24"
#}


data "digitalocean_vpc" "lab" {
  name = "gpu-lab"
}