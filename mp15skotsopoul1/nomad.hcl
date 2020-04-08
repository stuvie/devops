name = "cat.fywss.com"
datacenter = "mobile"
region = "home"

log_level = "DEBUG"
data_dir = "/usr/local/var/lib/nomad"

client {
  enabled = true
  servers = ["mini.fywss.com:4647", "ops.fywss.com:4647", "pie.fywss.com:4647"]
  # options = { "driver.raw_exec.enable" = "1" }
  # gc_disk_usage_threshold = 98
  network_interface = "en0"
  # leave_on_terminate = "true"
}

