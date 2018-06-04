# Environment variables.
#
# account=<google account e-mail>
# project=<gcloud project id>
# zone=<gcloud zone>
# ssh_key=<gcloud private key>
# username=<user name>

cluster_name=trjl-gke-k8s-cluster
machine_type=f1-micro
num_nodes=3

.PHONY: clean
create-cluster:
	# https://cloud.google.com/sdk/gcloud/reference/auth/login
	gcloud auth login $(account)
	# https://cloud.google.com/sdk/gcloud/reference/container/clusters/create
	gcloud container clusters create $(cluster_name) --machine-type $(machine_type) --num-nodes $(num_nodes)
	# https://cloud.google.com/sdk/gcloud/reference/container/clusters/get-credentials
	gcloud container clusters get-credentials $(cluster_name)
	# GKE console
	@echo "GKE console: https://console.cloud.google.com/home/dashboard"

.PHONY: destroy-cluster
destroy-cluster:
	# https://cloud.google.com/sdk/gcloud/reference/auth/login
	gcloud auth login $(account)
	# https://cloud.google.com/sdk/gcloud/reference/container/clusters/create
	gcloud container clusters delete $(cluster_name) --async

.PHONY: clean
describe-cluster:
	# https://cloud.google.com/sdk/gcloud/reference/container/clusters/describe
	gcloud container clusters describe $(cluster_name)

.PHONY: configure-kubectl
configure-kubectl:
	# https://cloud.google.com/sdk/gcloud/reference/container/clusters/get-credentials
	gcloud container clusters get-credentials $(cluster_name) --project $(project) --zone $(zone)

.PHONY: use-cluster
use-cluster:
	kubectl config use-context gke_$(project)_$(region)_trjl-$(cluster_name)

.PHONY: proxy-cluster
proxy-cluster:
	kubectl proxy

# get-nodes:
# 	kubectl get nodes -o wide


# ssh-node:
# 	ssh -i ${ssh-key} ${user_name}@${ip_address}


# ssh-instance:
# 	gcloud compute ssh ${instance_name}