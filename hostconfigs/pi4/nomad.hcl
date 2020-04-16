name = "pi4.fywss.com"
datacenter = "fywss"
region = "home"

log_level = "INFO"
data_dir = "/var/lib/nomad"

client {
  enabled = true
  servers = ["mini.fywss.com:4647", "ops.fywss.com:4647", "pie.fywss.com:4647"]
  # options = { "driver.raw_exec.enable" = "1" }
}
