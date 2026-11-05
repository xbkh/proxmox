<div align="center">

<img src="https://cdn.simpleicons.org/proxmox/E05C00" alt="Proxmox VE" width="120"/>

# Proxmox VE 9.0 Virtualization Platform

**High-Availability Cluster — 3 Nodes**

*iSCSI Storage · Live Migration · Full Monitoring*

![Proxmox](https://img.shields.io/badge/Proxmox_VE-9.0-E05C00?style=for-the-badge&logo=proxmox&logoColor=white)
![KVM](https://img.shields.io/badge/KVM-Virtualization-009900?style=for-the-badge&logoColor=white)
![LXC](https://img.shields.io/badge/LXC-Containers-333333?style=for-the-badge&logoColor=white)
![Prometheus](https://img.shields.io/badge/Prometheus-E6522C?style=for-the-badge&logo=prometheus&logoColor=white)
![Grafana](https://img.shields.io/badge/Grafana-F46800?style=for-the-badge&logo=grafana&logoColor=white)

![Status](https://img.shields.io/badge/Status-Operational_✓-27ae60?style=for-the-badge)
![HA](https://img.shields.io/badge/High_Availability-99.99%25-27ae60?style=for-the-badge)
![Migrations](https://img.shields.io/badge/Migrations-100%25_successful-27ae60?style=for-the-badge)
![Typst](https://img.shields.io/badge/Typst-239DAD?style=for-the-badge&logo=typst&logoColor=white)

</div>

---

## 📋 Overview

This repository contains the complete documentation of the setup of an enterprise virtualization platform based on **Proxmox VE 9.0**, deployed on an HP ProLiant DL380 Gen10.

| | Achievement |
|---|---|
| 🖥️ Infrastructure | 3-node cluster up and running |
| ⚡ Performance | 96 vCPU · 544 GB RAM · 600 GB storage |
| 🔁 High availability | RTO < 2 min · RPO = 0 · 100% migrations |
| 📊 Monitoring | Prometheus + Grafana operational |
| 💾 Storage | Shared NFS + integrated StarWind iSCSI |

---

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                    HP ProLiant DL380 Gen10                       │
│                                                                  │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐  │
│  │  🖥️ pve-bk-01    │  │  🖥️ pve-gd-02    │  │  🖥️ pve-bk-03    │  │
│  │  10.40.20.100   │  │  10.40.20.101   │  │  10.40.20.102   │  │
│  │  (Physical)     │  │  (VMware)       │  │  (VMware)       │  │
│  └────────┬────────┘  └────────┬────────┘  └────────┬────────┘  │
│           └──────────────────┬─┴──────────────────┘            │
│                              │ Corosync Cluster                  │
│                    ┌─────────┴──────────┐                        │
│                    │  💾 StarWind iSCSI  │                        │
│                    │   10.40.20.72      │                        │
│                    ├────────────────────┤                        │
│                    │  📁 NFS Storage     │                        │
│                    │  100 GB + 500 GB   │                        │
│                    └────────────────────┘                        │
│         iLO Management : 10.10.10.5                              │
└─────────────────────────────────────────────────────────────────┘
```

### Addressing plan

| Host | Role | IP | Interface |
|------|------|----|-----------|
| 🖥️ pve-bk-01 | Primary node | `10.40.20.100` | VLAN 20 |
| 🖥️ pve-gd-02 | Secondary node | `10.40.20.101` | VLAN 20 |
| 🖥️ pve-bk-03 | Secondary node | `10.40.20.102` | VLAN 20 |
| 💾 StarWind | iSCSI Target | `10.40.20.72` | VLAN 20 |
| 🌐 HP iLO | OOB management | `10.10.10.5` | VLAN 10 |

---

## 🔧 Tech stack

<div align="center">

### Hypervisor & Cluster

![Proxmox VE](https://img.shields.io/badge/Proxmox_VE_9.0-E05C00?style=flat-square&logo=proxmox&logoColor=white)
![KVM](https://img.shields.io/badge/KVM-Virtualization-009900?style=flat-square&logoColor=white)
![LXC](https://img.shields.io/badge/LXC-Containers-333333?style=flat-square&logoColor=white)
![Corosync](https://img.shields.io/badge/Corosync-HA_Cluster-E05C00?style=flat-square&logoColor=white)

### Storage

![NFS](https://img.shields.io/badge/NFS-Shared_storage-4479A1?style=flat-square&logoColor=white)
![iSCSI](https://img.shields.io/badge/iSCSI-StarWind_VSAN-0078D4?style=flat-square&logo=windows&logoColor=white)
![LVM](https://img.shields.io/badge/LVM--Thin-VM_disks-555555?style=flat-square&logoColor=white)

### Monitoring

![Prometheus](https://img.shields.io/badge/Prometheus-E6522C?style=flat-square&logo=prometheus&logoColor=white)
![Grafana](https://img.shields.io/badge/Grafana-F46800?style=flat-square&logo=grafana&logoColor=white)
![Node Exporter](https://img.shields.io/badge/Node_Exporter-:9100-E6522C?style=flat-square&logoColor=white)

### System

![Debian](https://img.shields.io/badge/Debian_Trixie-A81D33?style=flat-square&logo=debian&logoColor=white)
![Alpine Linux](https://img.shields.io/badge/Alpine_Linux-0D597F?style=flat-square&logo=alpine-linux&logoColor=white)
![Windows Server](https://img.shields.io/badge/Windows_Server-StarWind-0078D4?style=flat-square&logo=windows&logoColor=white)

</div>

| Component | Role |
|-----------|------|
| **Proxmox VE 9.0** | KVM + LXC hypervisor, web interface, REST API |
| **Corosync** | HA cluster, quorum, inter-node communication |
| **Proxmox HA Manager** | Automatic VM failover management |
| **NFS** | Shared storage for ISOs, templates, backups |
| **StarWind VSAN** | Windows iSCSI server for shared VM storage |
| **Node Exporter** | System metrics export (port 9100) |
| **Prometheus** | Metrics collection and storage |
| **Grafana** | Visualization dashboards (ID 11074) |

---

## 📁 Repository contents

```
proxmox/
├── 📄 proxmox-ve.typ    # Typst source (full report)
├── 📕 proxmox-ve.pdf    # Compiled PDF report
└── 📖 README.md         # This file
```

### Building the report

```bash
# Install Typst
curl -fsSL https://typst.app/docs/install | sh

# Compile to PDF
typst compile proxmox-ve.typ

# Watch mode
typst watch proxmox-ve.typ
```

---

## 📦 Deployment — Key steps

<details>
<summary><b>1️⃣ Installing the Proxmox nodes</b></summary>

```bash
# Remove the enterprise sources
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
<summary><b>2️⃣ Creating the Corosync cluster</b></summary>

```bash
# On pve-bk-01 (primary node)
pvecm create satom-cluster

# On pve-gd-02 and pve-bk-03
pvecm add 10.40.20.100

# Verification
pvecm status
pvecm nodes
```
</details>

<details>
<summary><b>3️⃣ Shared NFS storage</b></summary>

```bash
# NFS server
apt install nfs-kernel-server -y
mkdir -p /srv/nfs && chmod 777 /srv/nfs
echo "/srv/nfs 10.40.20.0/24(rw,sync,no_subtree_check,no_root_squash)" >> /etc/exports
exportfs -ra && systemctl restart nfs-server
```
</details>

<details>
<summary><b>4️⃣ Prometheus + Grafana monitoring</b></summary>

```bash
# Node Exporter (on each node)
wget https://github.com/prometheus/node_exporter/releases/download/v1.6.1/node_exporter-1.6.1.linux-amd64.tar.gz
tar xvf node_exporter-*.tar.gz && cd node_exporter-1.6.1.linux-amd64
chmod +x node_exporter && ./node_exporter &

# Prometheus
apt install prometheus -y
systemctl restart prometheus

# Grafana
apt install grafana -y
systemctl enable --now grafana-server
# Access: http://10.40.20.100:3000
```
</details>

---

## 🔁 High availability

### HA metrics

| Indicator | Measured | Target | Status |
|-----------|----------|--------|--------|
| Failure detection | < 8 s | < 10 s | ✅ |
| Full failover | ~45 s | < 60 s | ✅ |
| Total RTO | ~1 min | < 2 min | ✅ |
| RPO (data loss) | 0 | 0 | ✅ |
| Successful migrations | 100% | > 95% | ✅ |

### Failure test

```bash
# Simulate a kernel crash on a node
echo c > /proc/sysrq-trigger

# Or kill Corosync only
kill -9 $(pidof corosync)

# Watch the failover
pve-ha-manager status
pvecm status
```

---

## 💾 StarWind iSCSI

| Parameter | Value |
|-----------|-------|
| Server | `10.40.20.72` |
| Port | `3260` (iSCSI) |
| Target | `iqn.satom-proxmox:lun` |
| Protocol | iSCSI via StarWind VSAN Free |

---

## 📊 Monitoring — Grafana

| Metric | PromQL query |
|---------|---------------|
| CPU usage | `100 - (avg by(instance)(rate(node_cpu_seconds_total{mode="idle"}[5m]))*100)` |
| Free RAM | `node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes * 100` |
| Disk | `node_filesystem_avail_bytes{mountpoint="/"} / node_filesystem_size_bytes{mountpoint="/"} * 100` |
| Node status | `up` |

> Recommended dashboard: [ID 11074](https://grafana.com/grafana/dashboards/11074) — Full Proxmox

---

## 🔮 Roadmap

| Horizon | Evolutions |
|---------|-----------|
| Short term | Proxmox Backup Server · Ansible/Terraform |
| Medium term | Ceph distributed storage · DR replication |
| Long term | Kubernetes on Proxmox · Hybrid cloud |

---

## 📚 Official documentation

[![Proxmox](https://img.shields.io/badge/Proxmox_Docs-E05C00?style=flat-square&logo=proxmox&logoColor=white)](https://pve.proxmox.com/pve-docs/)
[![StarWind](https://img.shields.io/badge/StarWind_VSAN-0078D4?style=flat-square&logo=windows&logoColor=white)](https://www.starwindsoftware.com/starwind-virtual-san)
[![Prometheus](https://img.shields.io/badge/Prometheus_Docs-E6522C?style=flat-square&logo=prometheus&logoColor=white)](https://prometheus.io/docs/)
[![Grafana](https://img.shields.io/badge/Grafana_Docs-F46800?style=flat-square&logo=grafana&logoColor=white)](https://grafana.com/docs/)
[![Node Exporter](https://img.shields.io/badge/Node_Exporter-GitHub-181717?style=flat-square&logo=github&logoColor=white)](https://github.com/prometheus/node_exporter)

---

<div align="center">
  <sub>Virtualization Hackathon 2025 · Proxmox VE 9.0 · Confidential</sub>
</div>
