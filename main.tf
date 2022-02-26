terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

variable "region" {
  default = "blr1"
}

# Get ssh key
data "digitalocean_ssh_key" "default" {
  name = "mykey"
}


# Create a droplet
resource "digitalocean_droplet" "ubuntu" {
    image = "ubuntu-20-04-x64"
    name = "gitlab-jenkins"
    region = "blr1"
    size = "s-2vcpu-4gb" 
    # private_networking = true
    ssh_keys = ["${data.digitalocean_ssh_key.default.fingerprint}"]
}


output "controller_ip_address" {
    value = "${digitalocean_droplet.ubuntu.ipv4_address}"
}
