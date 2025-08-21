#!/bin/bash
set -euo pipefail

cat << "EOF"
███╗   ███╗███████╗████████╗██████╗ ██╗ ██████╗███████╗
████╗ ████║██╔════╝╚══██╔══╝██╔══██╗██║██╔════╝██╔════╝
██╔████╔██║█████╗     ██║   ██████╔╝██║██║     ███████╗
██║╚██╔╝██║██╔══╝     ██║   ██╔══██╗██║██║     ╚════██║
██║ ╚═╝ ██║███████╗   ██║   ██║  ██║██║╚██████╗███████║
╚═╝     ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝
 🚀 Metrics 🚀
EOF

KUBECONFIG="${HOME}/.kube/config_int"
export KUBECONFIG

NAMESPACE="kubernetes-gra-pro"

# deployments metrics 
kubectl apply -f yaml/metrics.yaml

# Créer le namespace s'il n'existe pas
kubectl get ns "$NAMESPACE" >/dev/null 2>&1 || kubectl create ns "$NAMESPACE"

# Créer les tls
kubectl apply -f yaml/grafana-tls.yaml
kubectl apply -f yaml/prometheus-tls.yaml


# Déploiement de Prometheus
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm upgrade --install prometheus prometheus-community/prometheus \
  --namespace "$NAMESPACE" \
  -f yaml/prometheus-values.yaml

# Déploiement de Grafana
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

helm upgrade --install grafana grafana/grafana \
  --namespace "$NAMESPACE" \
  -f yaml/grafana-values.yaml

# Exposition des pods

kubectl apply -f yaml/prometheus-ingress.yaml
kubectl apply -f yaml/grafana-ingress.yaml