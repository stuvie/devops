name = "ops.fywss.com"
datacenter = "fywss"
region = "home"

# log_level = "INFO"
log_level = "DEBUG"
data_dir = "/var/lib/nomad"

client {
  enabled = true
  servers = ["mini.fywss.com:4647", "ops.fywss.com:4647", "pie.fywss.com:4647"]
  # options = { "driver.raw_exec.enable" = "1" }
  network_interface = "eno1"
  cni_path = "/opt/cni/bin",
  # cni_config_dir = "/opt/cni/config"
  cni_config_dir = "/etc/cni/net.d"
}
