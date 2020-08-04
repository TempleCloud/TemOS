#!/bin/bash

kind create cluster --name knative --config knative-cluster.yaml
kubectl cluster-info --context kind-knative

kubectl apply -f https://github.com/knative/serving/releases/download/v0.16.0/serving-crds.yaml
kubectl apply -f https://github.com/knative/serving/releases/download/v0.16.0/serving-core.yaml
kubectl wait deployment activator autoscaler controller webhook --for=condition=Available -n knative-serving 

kubectl apply -f https://github.com/knative/net-kourier/releases/download/v0.16.0/kourier.yaml
kubectl wait deployment 3scale-kourier-control 3scale-kourier-gateway --for=condition=Available -n kourier-system

EXTERNAL_IP="127.0.0.1"
KNATIVE_DOMAIN="$EXTERNAL_IP.nip.io"
echo KNATIVE_DOMAIN=$KNATIVE_DOMAIN
dig $KNATIVE_DOMAIN
kubectl patch configmap -n knative-serving config-domain -p "{\"data\": {\"$KNATIVE_DOMAIN\": \"\"}}"

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Service
metadata:
  name: kourier-ingress
  namespace: kourier-system
  labels:
    networking.knative.dev/ingress-provider: kourier
spec:
  type: NodePort
  selector:
    app: 3scale-kourier-gateway
  ports:
    - name: http2
      nodePort: 31080
      port: 80
      targetPort: 8080
EOF

kubectl patch configmap/config-network \
  --namespace knative-serving \
  --type merge \
  --patch '{"data":{"ingress.class":"kourier.ingress.networking.knative.dev"}}'

kubectl get pods -n knative-serving
kubectl get pods -n kourier-system
kubectl get svc  -n kourier-system kourier-ingress
