<div align="center">

# 🖥️ Plateforme de Virtualisation Proxmox VE 9.0

**Cluster Haute Disponibilité — 3 Nœuds**

*Stockage iSCSI · Migration Live · Monitoring Complet*

![Proxmox](https://img.shields.io/badge/Proxmox_VE-9.0-E05C00?style=for-the-badge&logo=proxmox&logoColor=white)
![KVM](https://img.shields.io/badge/KVM-Virtualisation-009900?style=for-the-badge&logoColor=white)
![LXC](https://img.shields.io/badge/LXC-Conteneurs-333333?style=for-the-badge&logoColor=white)
![Prometheus](https://img.shields.io/badge/Prometheus-E6522C?style=for-the-badge&logo=prometheus&logoColor=white)
![Grafana](https://img.shields.io/badge/Grafana-F46800?style=for-the-badge&logo=grafana&logoColor=white)

![Status](https://img.shields.io/badge/Statut-Opérationnel_✓-27ae60?style=for-the-badge)
![HA](https://img.shields.io/badge/Haute_Dispo-99.99%25-27ae60?style=for-the-badge)
![Migrations](https://img.shields.io/badge/Migrations-100%25_réussies-27ae60?style=for-the-badge)
![Typst](https://img.shields.io/badge/Typst-239DAD?style=for-the-badge&logo=typst&logoColor=white)

</div>

---

## 📋 Présentation

Ce dépôt contient la documentation complète de la mise en place d'une plateforme de virtualisation enterprise basée sur **Proxmox VE 9.0**, déployée sur un HP ProLiant DL380 Gen10.

| | Réalisation |
|---|---|
| 🖥️ Infrastructure | Cluster 3 nœuds opérationnel |
| ⚡ Performances | 96 vCPU · 544 GB RAM · 600 GB stockage |
| 🔁 Haute Dispo | RTO < 2 min · RPO = 0 · Migrations 100 % |
| 📊 Monitoring | Prometheus + Grafana opérationnels |
| 💾 Stockage | NFS partagé + iSCSI StarWind intégré |

---

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                    HP ProLiant DL380 Gen10                       │
│                                                                  │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐  │
│  │  🖥️ pve-bk-01    │  │  🖥️ pve-gd-02    │  │  🖥️ pve-bk-03    │  │
│  │  10.40.20.100   │  │  10.40.20.101   │  │  10.40.20.102   │  │
│  │  (Physique)     │  │  (VMware)       │  │  (VMware)       │  │
│  └────────┬────────┘  └────────┬────────┘  └────────┬────────┘  │
│           └──────────────────┬─┴──────────────────┘            │
│                              │ Corosync Cluster                  │
│                    ┌─────────┴──────────┐                        │
│                    │  💾 StarWind iSCSI  │                        │
│                    │   10.40.20.72      │                        │
│                    ├────────────────────┤                        │
│                    │  📁 Stockage NFS    │                        │
│                    │  100 GB + 500 GB   │                        │
│                    └────────────────────┘                        │
│         iLO Management : 10.10.10.5                              │
└─────────────────────────────────────────────────────────────────┘
```

### Plan d'adressage

| Hôte | Rôle | IP | Interface |
|------|------|----|-----------|
| 🖥️ pve-bk-01 | Nœud principal | `10.40.20.100` | VLAN 20 |
| 🖥️ pve-gd-02 | Nœud secondaire | `10.40.20.101` | VLAN 20 |
| 🖥️ pve-bk-03 | Nœud secondaire | `10.40.20.102` | VLAN 20 |
| 💾 StarWind | iSCSI Target | `10.40.20.72` | VLAN 20 |
| 🌐 iLO HP | Management OOB | `10.10.10.5` | VLAN 10 |

---

## 🔧 Stack technique

<div align="center">

### Hyperviseur & Cluster

![Proxmox VE](https://img.shields.io/badge/Proxmox_VE_9.0-E05C00?style=flat-square&logo=proxmox&logoColor=white)
![KVM](https://img.shields.io/badge/KVM-Virtualisation-009900?style=flat-square&logoColor=white)
![LXC](https://img.shields.io/badge/LXC-Conteneurs-333333?style=flat-square&logoColor=white)
![Corosync](https://img.shields.io/badge/Corosync-HA_Cluster-E05C00?style=flat-square&logoColor=white)

### Stockage

![NFS](https://img.shields.io/badge/NFS-Stockage_partagé-4479A1?style=flat-square&logoColor=white)
![iSCSI](https://img.shields.io/badge/iSCSI-StarWind_VSAN-0078D4?style=flat-square&logo=windows&logoColor=white)
![LVM](https://img.shields.io/badge/LVM--Thin-Disques_VM-555555?style=flat-square&logoColor=white)

### Monitoring

![Prometheus](https://img.shields.io/badge/Prometheus-E6522C?style=flat-square&logo=prometheus&logoColor=white)
![Grafana](https://img.shields.io/badge/Grafana-F46800?style=flat-square&logo=grafana&logoColor=white)
![Node Exporter](https://img.shields.io/badge/Node_Exporter-:9100-E6522C?style=flat-square&logoColor=white)

### Système

![Debian](https://img.shields.io/badge/Debian_Trixie-A81D33?style=flat-square&logo=debian&logoColor=white)
![Alpine Linux](https://img.shields.io/badge/Alpine_Linux-0D597F?style=flat-square&logo=alpine-linux&logoColor=white)
![Windows Server](https://img.shields.io/badge/Windows_Server-StarWind-0078D4?style=flat-square&logo=windows&logoColor=white)

</div>

| Composant | Rôle |
|-----------|------|
| **Proxmox VE 9.0** | Hyperviseur KVM + LXC, interface web, API REST |
| **Corosync** | Cluster HA, quorum, communication inter-nœuds |
| **Proxmox HA Manager** | Gestion automatique du failover des VMs |
| **NFS** | Stockage partagé ISO, templates, backups |
| **StarWind VSAN** | Serveur iSCSI Windows pour stockage VM partagé |
| **Node Exporter** | Export métriques systèmes (port 9100) |
| **Prometheus** | Collecte et stockage des métriques |
| **Grafana** | Dashboards de visualisation (ID 11074) |

---

## 📁 Contenu du dépôt

```
proxmox/
├── 📄 proxmox-ve.typ    # Source Typst (rapport complet)
├── 📕 proxmox-ve.pdf    # Rapport compilé PDF
└── 📖 README.md         # Ce fichier
```

### Compiler le rapport

```bash
# Installer Typst
curl -fsSL https://typst.app/docs/install | sh

# Compiler en PDF
typst compile proxmox-ve.typ

# Mode watch
typst watch proxmox-ve.typ
```

---

## 📦 Déploiement — Étapes clés

<details>
<summary><b>1️⃣ Installation des nœuds Proxmox</b></summary>

```bash
# Supprimer les sources enterprise
rm -f /etc/apt/sources.list.d/pve-enterprise.sources
rm -f /etc/apt/sources.list.d/ceph.sources

echo "deb http://download.proxmox.com/debian/pve trixie pve-no-subscription" \
  > /etc/apt/sources.list.d/pve-no-subscription.list

apt update && apt dist-upgrade -y
apt install -y mc htop iftop git curl chrony net-tools dnsutils
systemctl enable --now chrony
```
</details>

<details>
<summary><b>2️⃣ Création du cluster Corosync</b></summary>

```bash
# Sur pve-bk-01 (nœud principal)
pvecm create satom-cluster

# Sur pve-gd-02 et pve-bk-03
pvecm add 10.40.20.100

# Vérification
pvecm status
pvecm nodes
```
</details>

<details>
<summary><b>3️⃣ Stockage NFS partagé</b></summary>

```bash
# Serveur NFS
apt install nfs-kernel-server -y
mkdir -p /srv/nfs && chmod 777 /srv/nfs
echo "/srv/nfs 10.40.20.0/24(rw,sync,no_subtree_check,no_root_squash)" >> /etc/exports
exportfs -ra && systemctl restart nfs-server
```
</details>

<details>
<summary><b>4️⃣ Monitoring Prometheus + Grafana</b></summary>

```bash
# Node Exporter (sur chaque nœud)
wget https://github.com/prometheus/node_exporter/releases/download/v1.6.1/node_exporter-1.6.1.linux-amd64.tar.gz
tar xvf node_exporter-*.tar.gz && cd node_exporter-1.6.1.linux-amd64
chmod +x node_exporter && ./node_exporter &

# Prometheus
apt install prometheus -y
systemctl restart prometheus

# Grafana
apt install grafana -y
systemctl enable --now grafana-server
# Accès : http://10.40.20.100:3000
```
</details>

---

## 🔁 Haute Disponibilité

### Métriques HA

| Indicateur | Mesuré | Objectif | Statut |
|-----------|--------|----------|--------|
| Détection de panne | < 8 s | < 10 s | ✅ |
| Failover complet | ~45 s | < 60 s | ✅ |
| RTO total | ~1 min | < 2 min | ✅ |
| RPO (perte données) | 0 | 0 | ✅ |
| Migrations réussies | 100 % | > 95 % | ✅ |

### Test de panne

```bash
# Simuler un crash noyau sur un nœud
echo c > /proc/sysrq-trigger

# Ou killer Corosync uniquement
kill -9 $(pidof corosync)

# Observer le failover
pve-ha-manager status
pvecm status
```

---

## 💾 StorWind iSCSI

| Paramètre | Valeur |
|-----------|--------|
| Serveur | `10.40.20.72` |
| Port | `3260` (iSCSI) |
| Target | `iqn.satom-proxmox:lun` |
| Protocole | iSCSI via StarWind VSAN Free |

---

## 📊 Monitoring — Grafana

| Métrique | Requête PromQL |
|---------|---------------|
| CPU usage | `100 - (avg by(instance)(rate(node_cpu_seconds_total{mode="idle"}[5m]))*100)` |
| RAM libre | `node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes * 100` |
| Disque | `node_filesystem_avail_bytes{mountpoint="/"} / node_filesystem_size_bytes{mountpoint="/"} * 100` |
| État nœud | `up` |

> Dashboard recommandé : [ID 11074](https://grafana.com/grafana/dashboards/11074) — Proxmox complet

---

## 🔮 Perspectives

| Horizon | Évolutions |
|---------|-----------|
| Court terme | Proxmox Backup Server · Ansible/Terraform |
| Moyen terme | Ceph stockage distribué · Réplication DR |
| Long terme | Kubernetes sur Proxmox · Cloud hybride |

---

## 📚 Documentation officielle

[![Proxmox](https://img.shields.io/badge/Proxmox_Docs-E05C00?style=flat-square&logo=proxmox&logoColor=white)](https://pve.proxmox.com/pve-docs/)
[![StarWind](https://img.shields.io/badge/StarWind_VSAN-0078D4?style=flat-square&logo=windows&logoColor=white)](https://www.starwindsoftware.com/starwind-virtual-san)
[![Prometheus](https://img.shields.io/badge/Prometheus_Docs-E6522C?style=flat-square&logo=prometheus&logoColor=white)](https://prometheus.io/docs/)
[![Grafana](https://img.shields.io/badge/Grafana_Docs-F46800?style=flat-square&logo=grafana&logoColor=white)](https://grafana.com/docs/)
[![Node Exporter](https://img.shields.io/badge/Node_Exporter-GitHub-181717?style=flat-square&logo=github&logoColor=white)](https://github.com/prometheus/node_exporter)

---

<div align="center">
  <sub>Hackathon Virtualisation 2025 · Proxmox VE 9.0 · Confidentiel</sub>
</div>
