# vCenter variables
variable "vcenter_server" {
    type = string
    description = "vCenter server to build the VM on (FQDN / IP)"
}
variable "vcenter_username" {
    type = string
    description = "Username to authenticate to vCenter"
}
variable "vcenter_password" {
    type = string
    description = "Password to authenticate to vCenter"
}
variable "vcenter_unverified_ssl" {
    type = string
    description = "Is the VMware vCenter using a self signed certificate (true/false)"
}
variable "vcenter_cluster" {
    type = string
    description = "vCenter cluster to build the VM on"
}
#variable "vcenter_resource_pool" {}
variable "vcenter_datacenter" {
    type = string
    description = "vCenter datastore to store the VM"
} 
#variable "vcenter_host" {} # Cluster is DRS enabled so do not specify host
variable "vcenter_datastore" {
    type = string
    description = "vCenter datastore to store the VM"
}
variable "vcenter_template_folder" {
    type = string
    description = "The vcenter folder to store the template"
    default = "Templates"
}

# VM variables
variable "nic_type" {
    default = "vmxnet3"
}
variable "vm_count" {
    type = string
    description = "Number of VM to create"
    default     =  1
}
variable "vm_name_prefix" {
    type = string
    description = "Name of VM prefix"
    default     =  "test"
}
variable "vm_network" {
    type = string
    description = "Network used for the vSphere virtual machines"
}
variable "vm_linked_clone" {
    type = string
    description = "Use linked clone to create the vSphere virtual machine from the template (true/false). If you would like to use the linked clone feature, your template need to have one and only one snapshot"
    default = "false"
}
variable "vm_num_cpu" {
    type = string
    description = "Number of vCPU for the vSphere virtual machines"
    default = "2"
}
variable "vm_num_cores" {
    type = string
    description = "Number of cores for the vSphere virtual machines"
    default = "1"
}
variable "vm_ram" {
    type = string
    description = "Amount of RAM for the vSphere virtual machines (example: 2048)"
}
variable "vm_name" {
    type = string
    description = "The name of the vSphere virtual machines and the hostname of the machine"
}
variable "vm_template_name" {
    type = string
    description = "The template to clone to create the VM"
}
variable "vm_domain" {
    type = string
    description = "Linux virtual machine domain name for the machine. This, along with host_name, make up the FQDN of the virtual machine"
    default = ""
}
variable "vm_guest_id" {
    type = string
    description = ""
}