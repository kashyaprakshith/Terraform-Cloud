terraform {
  required_providers {
    virtualbox = {
      source = "hashicorp/virtualbox"
      version = "1.15.2"  # Replace with the desired provider version
    }
  }
}

provider "virtualbox" {
  version = "1.15.2"  # Replace with the desired provider version
}

resource "virtualbox_vm" "node" {
  count = 2
  name  = "${format("node-%02d", count.index + 1)}"
  url   = "https://vagrantcloud.com/ubuntu/boxes/xenial64/versions/20180420.0.0/providers/virtualbox.box"
  image = "./virtualbox.box"
  cpus  = 2
  memory = "512 mib"

  network_adapter {
    type = "bridged"
    host_interface = "en0"
  }
}
