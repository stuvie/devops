node_name = "ops.fywss.com"
advertise_addr = "10.20.20.3"

client_addr="0.0.0.0"

datacenter = "fywss"
data_dir = "/var/lib/consul"
retry_join = ["mini.fywss.com", "ops.fywss.com", "pi4.fywss.com"]

server = true
bootstrap_expect = 3
ui = true

telemetry {
  disable_hostname = true
  dogstatsd_addr = "ops.fywss.com:8126"
}

connect {
  enabled = true
}
