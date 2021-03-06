etcdShape = "VM.Standard1.2"
k8sMasterShape = "VM.Standard1.8"
k8sWorkerShape = "VM.Standard1.4"


etcdAd1Count = "3"
etcdAd2Count = "0"
etcdAd3Count = "0"

k8sMasterAd1Count = "1"
k8sMasterAd2Count = "0"
k8sMasterAd3Count = "0"

k8sWorkerAd1Count = "10"
k8sWorkerAd2Count = "10"
k8sWorkerAd3Count = "10"

etcdLBShape = "100Mbps"
k8sMasterLBShape = "100Mbps"

etcd_ssh_ingress = "10.0.0.0/16"
etcd_ssh_ingress = "0.0.0.0/0"
etcd_cluster_ingress = "10.0.0.0/16"
master_ssh_ingress = "0.0.0.0/0"
worker_ssh_ingress = "0.0.0.0/0"
master_https_ingress = "0.0.0.0/0"
worker_nodeport_ingress = "0.0.0.0/0"

control_plane_subnet_access = "public"
k8s_master_lb_access = "public"
natInstanceShape = "VM.Standard1.2"
nat_instance_ad1_enabled = "false"
nat_instance_ad2_enabled = "false"
nat_instance_ad3_enabled = "false"
nat_ssh_ingress = "0.0.0.0/0"
public_subnet_http_ingress = "0.0.0.0/0"
public_subnet_https_ingress = "0.0.0.0/0"

#worker_iscsi_volume_create is a bool not a string
worker_iscsi_volume_create = false
#worker_iscsi_volume_size = 10


# ...
