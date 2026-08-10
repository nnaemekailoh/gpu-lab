# The control plane is free. destroy_all_associated_resources removes load balancers
# and volumes created by the cluster, which otherwise survive a terraform destroy and
# keep billing.

resource "digitalocean_kubernetes_cluster" "lab" {
  name         = "gpu-lab"
  region       = var.region
  version      = var.k8s_version
  vpc_uuid     = data.digitalocean_vpc.lab.id
  auto_upgrade = false

  destroy_all_associated_resources = true

  nvidia_gpu_device_plugin {
    enabled = var.do_gpu_plugin
  }

  node_pool {
    name       = "cpu-pool"
    size       = var.cpu_size
    node_count = var.cpu_nodes
    auto_scale = true
    min_nodes  = var.cpu_nodes
    max_nodes  = var.cpu_nodes + 2
  }
}
