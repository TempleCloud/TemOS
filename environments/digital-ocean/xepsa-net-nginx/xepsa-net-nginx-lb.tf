resource "digitalocean_loadbalancer" "xepsa-net-lb" {

    # Instance Type
    # 
    name = "xepsa-net-lb"
    region = "lon1"

    forwarding_rule {
        entry_port = 80
        entry_protocol = "http"

        target_port = 80
        target_protocol = "http"
    }

    healthcheck {
        port = 22
        protocol = "tcp"
    }

    droplet_ids = [ digitalocean_droplet.xepsa-net-nginx-01.id, digitalocean_droplet.xepsa-net-nginx-02.id ]
}