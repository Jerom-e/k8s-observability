# Kubernetes Monitoring Stack (Prometheus + Grafana)

🚀 Déploiement automatisé de Prometheus et Grafana sur Kubernetes avec TLS, Ingress et persistance.  
Cette stack fournit un environnement clé en main pour **superviser l’infrastructure** et **centraliser les métriques** dans une interface graphique moderne.

---

## 🎯 Objectif
- Collecte des métriques Kubernetes via **Prometheus**
- Visualisation et dashboards avec **Grafana**
- Accès sécurisé grâce à TLS et Ingress
- Installation simplifiée via **Helm**

---

## 📂 Structure du dépôt

```text
├── main.tf # Terraform d’initialisation
├── sh/
│ └── deploy-monitoring.sh # Script de déploiement automatisé
└── yaml/
├── grafana-ingress.yaml
├── grafana-tls.yaml
├── grafana-values.yaml # Valeurs Helm personnalisées (sampelisées)
├── metrics.yaml
├── prometheus-ingress.yaml
├── prometheus-tls.yaml
└── prometheus-values.yaml
```

Le script :

Configure le namespace

Crée les certificats TLS

Installe Prometheus et Grafana avec Helm

Configure les Ingress pour accès web

🔐 Accès

Prometheus : https://prometheus.<votre-domaine>

Grafana : https://grafana.<votre-domaine>
(Identifiants définis dans grafana-values.yaml)

🔒 Sécurité

TLS activé via cert-manager ou certificats internes

RBAC appliqué pour restreindre les accès

Grafana admin user/password à définir dans grafana-values.yaml

👥 Bénéfices pour l’organisation

Supervision proactive de l’infrastructure

Aide à la prise de décision grâce à des dashboards clairs

Réduction du temps de diagnostic en cas d’incident

Solution open-source, sans coûts de licences additionnelles
