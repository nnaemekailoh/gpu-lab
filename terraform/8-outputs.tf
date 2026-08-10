output "cluster_id" {
  value = digitalocean_kubernetes_cluster.lab.id
}

output "endpoint" {
  value = digitalocean_kubernetes_cluster.lab.endpoint
}

output "kubeconfig" {
  value     = digitalocean_kubernetes_cluster.lab.kube_config[0].raw_config
  sensitive = true
}

output "bastion_ip" {
  value = digitalocean_droplet.bastion.ipv4_address
}

output "vpc_range" {
  value = data.digitalocean_vpc.lab.ip_range
}
