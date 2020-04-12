node_name = "mini.fywss.com"
advertise_addr = "10.20.1.2"
#bind_addr = "10.20.1.2"

client_addr="0.0.0.0"

datacenter = "fywss"
data_dir = "/var/lib/consul"
retry_join = ["mini.fywss.com", "ops.fywss.com", "pie.fywss.com"]

server = true
bootstrap_expect = 3
ui = true

telemetry {
  disable_hostname = true
  dogstatsd_addr = "mini.fywss.com:8125"
}

connect {
  enabled = true
}
