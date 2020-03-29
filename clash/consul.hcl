node_name = "clash.fywss.com"
advertise_addr = "10.20.1.3"

client_addr="0.0.0.0"

datacenter = "fywss"
data_dir = "/usr/local/var/lib/consul"
retry_join = ["mini.fywss.com", "ops.fywss.com", "pie.fywss.com"]

server = false
ui = true

connect {
  enabled = true
}
