resource "digitalocean_droplet" "bastion" {
  name     = "gpu-lab-bastion"
  image    = var.bastion_image
  size     = var.bastion_size
  region   = var.region
  vpc_uuid = data.digitalocean_vpc.lab.id
  ssh_keys = [digitalocean_ssh_key.me.id]

  monitoring = true
  backups    = false
}
