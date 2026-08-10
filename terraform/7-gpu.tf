# Separate pool so it can be removed without touching the platform.
# make gpu-down  ->  gpu_nodes = 0

resource "digitalocean_kubernetes_node_pool" "gpu" {
  count = var.gpu_nodes > 0 ? 1 : 0

  cluster_id = digitalocean_kubernetes_cluster.lab.id
  name       = "gpu-pool"
  size       = var.gpu_size
  node_count = var.gpu_nodes
  auto_scale = false

  labels = {
    workload = "gpu"
  }
}
