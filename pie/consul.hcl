node_name = "pie.fywss.com"
advertise_addr = "10.20.1.8"

client_addr="0.0.0.0"

datacenter = "fywss"
data_dir = "/var/lib/consul"
retry_join = ["mini.fywss.com", "ops.fywss.com", "pie.fywss.com"]

server = true
bootstrap_expect = 3
ui = false

telemetry {
  disable_hostname = true
  dogstatsd_addr = "pie.fywss.com:8126"
}

connect {
  enabled = true
}
