variable token_do {
type = string
description = "Token de Digital Ocean"
}

#Pass provider
#export TF_VAR_token_do=""
provider "digitalocean" {
  token = var.token_do
}



resource "digitalocean_ssh_key" "web" {
  name       = "sshkeys"
  public_key = file("${path.module}/files/id_rsa.pub")
}

#Droplet
resource "digitalocean_droplet" "web" {
  image              = "ubuntu-20-04-x64"
  name               = "web"
  region             = "nyc1"
  size               = "s-1vcpu-1gb"
  monitoring         = true
  private_networking = true
  ssh_keys = [
    digitalocean_ssh_key.web.id
  ]

  user_data = file("${path.module}/files/user-data.sh")
}

 