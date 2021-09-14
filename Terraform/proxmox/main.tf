# Connect to Proxmox on cdt-hvp-01
# https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs
provider "vsphere" {
    user = var.vcenter_username
    password = var.vcenter_password
    vsphere_server = var.vcenter_server
    allow_unverified_ssl = var.vcenter_unverified_ssl # If you have a self-signed cert
}

provider "proxmox" {
    pm_api_url = "https://$PROXMOXSERVERIP:8006/api2/json"
    pm_user = "root@pam"
    pm_password = "$SUPERSECRETPASSWORD"
    pm_tls_insecure = "true"
}

# Define VMware vSphere
data "vsphere_datacenter" "dc" {
    name = var.vcenter_datacenter
}
data "vsphere_datastore" "datastore" {
    name = var.vcenter_datastore
    datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_compute_cluster" "cluster" {
    name = var.vcenter_cluster
    datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_network" "network" {
    name = var.vm_network
    datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_virtual_machine" "template" {
    name = "/${var.vcenter_datacenter}/vm/${var.vcenter_template_folder}/${var.vm_template_name}"
    datacenter_id = data.vsphere_datacenter.dc.id
}

# Create VMs
resource "vsphere_virtual_machine" "vm" {
    count = var.vm_count
    name = "${var.vm_name}-${count.index + 1}"
    resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
    datastore_id = data.vsphere_datastore.datastore.id
    num_cpus = var.vm_num_cpu
    memory = var.vm_ram
    guest_id = var.vm_guest_id
    network_interface {
        network_id = data.vsphere_network.network.id
    }
    disk {
        label = "${var.vm_name}-${count.index + 1}-disk"
        size  = 32
    }
    clone {
        template_uuid = data.vsphere_virtual_machine.template.id
        customize {
            timeout = 0
    
            linux_options {
                host_name = "node-${count.index + 1}"
                domain = var.vm_domain
            }
            
            network_interface {}
        }
    }
}