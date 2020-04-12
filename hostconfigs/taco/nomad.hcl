name = "taco.fywss.com"
datacenter = "mobile"
region = "tiny"

log_level = "DEBUG"
data_dir = "/usr/local/var/lib/nomad"

client {
  enabled = true
  # servers = ["mini.fywss.com:4647", "ops.fywss.com:4647", "pie.fywss.com:4647"]
  # options = { "driver.raw_exec.enable" = "1" }
  gc_disk_usage_threshold = 98
  # network_interface = "en0"
}

server {
  enabled = true

  bootstrap_expect = 1
  # num_schedulers   = 1
  job_gc_interval = "2m"
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
