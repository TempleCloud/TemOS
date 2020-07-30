# occam-local-cluster

## Creation

```bash
$> kind create cluster --config k8s-3cp-3dp-ha-cluster.yaml --name occam-local-cluster
Creating cluster "occam-local-cluster" ...
 ✓ Ensuring node image (kindest/node:v1.18.2) 🖼
 ✓ Preparing nodes 📦 📦 📦 📦 📦 📦  
 ✓ Configuring the external load balancer ⚖️ 
 ✓ Writing configuration 📜 
 ✓ Starting control-plane 🕹️ 
 ✓ Installing CNI 🔌 
 ✓ Installing StorageClass 💾 
 ✓ Joining more control-plane nodes 🎮 
 ✓ Joining worker nodes 🚜 
Set kubectl context to "kind-occam-local-cluster"
You can now use your cluster with:

kubectl cluster-info --context kind-occam-local-cluster
```

---

## Use

```bash
kubectl cluster-info --context kind-occam-local-cluster
```

---

## Delete

```bash
kind delete cluster --name occam-local-cluster
```

