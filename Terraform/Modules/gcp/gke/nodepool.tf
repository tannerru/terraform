resource "google_container_node_pool" "primary_autoscaling_nodes" {
  name       = var.node_pool_name
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = 1
  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }
  node_config {
    preemptible  = false
    machine_type = var.machine_type
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

  }
}
