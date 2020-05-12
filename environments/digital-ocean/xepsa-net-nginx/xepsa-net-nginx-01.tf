resource "digitalocean_droplet" "xepsa-net-nginx-01" {

    # Instance Type 
    # 
    image = "ubuntu-18-04-x64"
    name = "xepsa-net-nginx-01"
    region = "lon1"
    size = "s-1vcpu-1gb"

    # Networking
    #  
    private_networking = true

    # SSH Configuration
    # 
    ssh_keys = [
        var.ssh_fingerprint
    ]
    connection {
        host = self.ipv4_address
        user = "root"
        type = "ssh"
        private_key = file(var.pvt_key)
        timeout = "2m"
    }

    # Install 
    # 
    provisioner "remote-exec" {
        inline = [
            "export PATH=$PATH:/usr/bin",
            # install nginx
            "sudo apt-get update",
            "sudo apt-get -y install nginx"
        ]
    }
}