variable "project_id" {
  description = "The ID of the project in which the resources will be provisioned."
  type        = string
}
  
variable "region" {
  description = "The region to deploy the cluster to."
  type        = string
}   

variable "cluster_name" {
  description = "The name of the cluster."
  type        = string
}

variable "machine_type" {
  description = "The machine type to use for nodes."
  type        = string
}

variable "node_pool_name" {
  description = "The name of the node pool."
  type        = string
}

variable "min_node_count" {
  description = "The minimum number of nodes in the node pool."
  type        = number
}

variable "max_node_count" {
  description = "The maximum number of nodes in the node pool."
  type        = number
}

variable "node_pools_preemptible" {
  description = "The preemptible flag for the node pool."
  type        = bool
}

variable "node_pools_initial_node_count" {
  description = "The initial node count for the node pool."
  type        = number
}

variable "node_image_type" {
  description = "The image type for the node pool."
  type        = string
}

variable "node_disk_type" {
  description = "The disk type for the node pool."
  type        = string
}

variable "node_disk_size_gb" {
  description = "The disk size for the node pool."
  type        = number
}

