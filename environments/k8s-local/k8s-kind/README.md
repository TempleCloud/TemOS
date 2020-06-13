# Kind - Kubernetes in Docker Clusters

## Introduction

* `kind` sets up and copnfigured a local docker based Kubernetes cluster.

* `kind` creates and manages local Kubernetes clusters using Docker container 'nodes'

* [kind - Quick Start](https://kind.sigs.k8s.io/docs/user/quick-start/)

---

## Install

```bash
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.8.1/kind-$(uname)-amd64
chmod +x ./kind
mv ./kind /some-dir-in-your-PATH/kind
```
---

## Cluster Management

* `kind -h`

* `kind create cluster --name kind-local`

* `kind create cluster --config kind-cluster-config.yaml`

* `kubectl cluster-info --context kind-local`

* `kind delete cluster --name kind-local`

---

## Cluster Configs

* __3-Node : 1 CP, 2 Worker__

```yaml
three node (two workers) cluster config
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
- role: worker
- role: worker
```

* __6-Node HA : 3 CP, 3 Worker__

```yaml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
- role: control-plane
- role: control-plane
- role: worker
- role: worker
- role: worker
```

