#Se indica una variable para el token de Digital Ocean
variable token_do {
type = string
description = "Token de Digital Ocean"
}

#Provider 
provider "digitalocean" {
  token = var.token_do
}



#Traemos nuestra SHH-KEY
resource "digitalocean_ssh_key" "web" {
  name       = "sshkeys"
  public_key = file("${path.module}/files/id_rsa.pub")
}

#Droplet Creación
resource "digitalocean_droplet" "web" {
  image              = "ubuntu-20-04-x64"
  name               = "web"
  region             = "nyc1"
  size               = "s-1vcpu-1gb"
  monitoring         = true
  private_networking = true
  #Creación de SSH KEY EN DO
  ssh_keys = [
    digitalocean_ssh_key.web.id
  ]
  #SH para configurar proyecto en ubuntu
  user_data = file("${path.module}/files/user-data.sh")
}

 
#DOMIO
resource "digitalocean_domain" "domain" {
  name = "domain.com"
}

resource "digitialocean_record" "main" {
  domain = digitalocean_domain.name
  type = "A"
  name = "@"
  value = digitalocean_droplet.web.ipv4_address  
  
}