# VMware VMs configuration #
vm_count = "1"
vm_name = "test"
vm_template_name = "CentOS8-Template"
vm_num_cpu = "2"
vm_ram = "4096"
vm_guest_id = "centos8_64Guest"

# VMware vSphere configuration #
# VMware vCenter IP/FQDN
vcenter_server = "10.10.2.115"
# VMware vSphere username used to deploy the infrastructure
vcenter_username = "administrator@vsphere.local"
# VMware vCenter password used to deploy the infrastructure
vcenter_password = "qazX989%" # change this to encrypted variable
# Skip the verification of the vCenter SSL certificate (true/false)
vcenter_unverified_ssl = "true"

# vCenter datacenter name where the infrastructure will be deployed 
vcenter_datacenter = "Datacenter"
# vSphere cluster name where the infrastructure will be deployed
vcenter_cluster = "computing"
# vSphere Datastore used to deploy VMs 
vcenter_datastore = "vsanDatastore"

# vSphere Network used to deploy VMs 
vm_network = "127vlan"

# Linux virtual machine domain name
vm_domain = "computing"