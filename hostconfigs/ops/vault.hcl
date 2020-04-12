api_addr         = "http://10.20.1.6:8200"
cluster_addr     = "http://10.20.1.6:8201"

disable_cache = true
disable_mlock = true
ui = true
listener "tcp" {
  address          = "0.0.0.0:8200"
  cluster_address  = "10.20.1.6:8201"
  tls_disable      = 1
}
storage "consul" {
  address = "127.0.0.1:8500"
  path    = "vault/"
}

cluster_name         = "fywss"

# max_lease_ttl         = "10h"
# default_lease_ttl    = "10h"
# raw_storage_endpoint     = true
# disable_sealwrap     = true
# disable_printable_check = true
