resource "digitalocean_domain" "default" {
   name = "xepsa.net"
   ip_address = digitalocean_loadbalancer.xepsa-net-lb.ip
}

resource "digitalocean_record" "CNAME-www" {
  domain = digitalocean_domain.default.name
  type = "CNAME"
  name = "www"
  value = "@"
}