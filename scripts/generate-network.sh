cat <<EOF> cluster-network.tf
provider "libvirt" {
    uri = "qemu:///system"
}

terraform {
 required_version = ">= 0.13"
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.7.1"
    }
  }
}

// Network Section
resource "libvirt_network" "eth0" {
    name = "$ETH0_NAME"
    mode = "$NETWORK_MODE"
    bridge = "$ETH0_BR"
    addresses = ["$ETH0_ADDRESSES"]
    dhcp {
        enabled = true
    }
}
EOF
