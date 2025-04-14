// vSphere Credentials - replace with your configuration
vsphere_endpoint            = "<vcsa_fqdn>"
vsphere_username            = "<vcsa_username>"
vsphere_password            = "<vcsa_password>"
vsphere_insecure_connection = true

// vSphere Settings
vsphere_datacenter                     = "DCSR"
//vsphere_cluster                      = "Cluster"
vsphere_host                           = "esx1.lab-dcsr.unil.ch"
vsphere_datastore                      = "san-iscsi-vol3"
vsphere_network                        = "DSwitch-Front-VL1272-CORE"
vsphere_folder                         = "/Templates"

vsphere_set_host_for_datastore_uploads = false
