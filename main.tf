provider "virtualbox" {}

resource "virtualbox_vm" "example_vm" {
  name   = "my-vm"
  memory = "512"
}

resource "virtualbox_nic" "example_nic" {
  vm_id     = virtualbox_vm.example_vm.id
  nic_type  = "virtio"
  host_port = 8080
  guest_port = 80
}
