resource "digitalocean_ssh_key" "me" {
  name       = "gpu-lab"
  public_key = var.ssh_public_key
}
