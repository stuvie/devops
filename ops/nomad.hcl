name = "ops.fywss.com"
datacenter = "fywss"
region = "home"

log_level = "INFO"
data_dir = "/var/lib/nomad"

client {
  enabled = true
  servers = ["mini.fywss.com:4647", "ops.fywss.com:4647", "pie.fywss.com:4647"]
  # options = { "driver.raw_exec.enable" = "1" }
  network_interface = "eno1"
}

server {
  enabled = true

  bootstrap_expect = 3
  # num_schedulers   = 1
  node_gc_threshold = "2m"
  # not supported on older nomad: job_gc_interval = "2m"
  job_gc_threshold = "2m"
  eval_gc_threshold = "2m"
  deployment_gc_threshold = "2m"
}

telemetry {
  publish_allocation_metrics = true
  publish_node_metrics       = true
  prometheus_metrics         = true
}

acl {
  enabled = false
}
