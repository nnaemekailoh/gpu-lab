variable "do_token" {
  type      = string
  sensitive = true
}

variable "ssh_public_key" {
  type = string
}

# GPU node pools are only offered in some regions. Check before changing:
# doctl kubernetes options regions
# doctl kubernetes options sizes | grep gpu
variable "region" {
  type    = string
  default = "tor1"
}

# doctl kubernetes options versions
variable "k8s_version" {
  type    = string
  default = "1.33.1-do.3"
}

# s-4vcpu-8gb: 4 vCPU / 8GB, $48/mo
variable "cpu_size" {
  type    = string
  default = "s-4vcpu-8gb"
}

variable "cpu_nodes" {
  type    = number
  default = 2
}

# doctl kubernetes options sizes | grep gpu
# gpu-h100x1-80gb is roughly $4.47/hr. Destroy when not in use.
variable "gpu_size" {
  type    = string
  default = "gpu-h100x1-80gb"
}

variable "gpu_nodes" {
  type    = number
  default = 1
}

# DigitalOcean installs its own NVIDIA device plugin and DCGM exporter on GPU pools.
# false lets the GPU Operator own that layer instead.
variable "do_gpu_plugin" {
  type    = bool
  default = false
}

variable "admin_cidr" {
  type = string
}

variable "bastion_size" {
  type    = string
  default = "s-1vcpu-1gb"
}

variable "bastion_image" {
  type    = string
  default = "ubuntu-24-04-x64"
}
