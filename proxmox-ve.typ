// ============================================================
//  Plateforme de Virtualisation Proxmox VE 9.0
//  Converti depuis HackMD et mis en forme en Typst
// ============================================================

// ---------- Couleurs du thème ----------
#let primary   = rgb("#e05c00")   // Orange Proxmox
#let accent    = rgb("#2e86de")
#let dark      = rgb("#1a1a2e")
#let success-c = rgb("#27ae60")
#let warning-c = rgb("#e67e22")
#let danger    = rgb("#c0392b")
#let info-c    = rgb("#2980b9")
#let light-bg  = rgb("#fdf3ed")
#let code-bg   = rgb("#1e1e2e")

// ---------- Helpers ----------
#let badge(color, label) = box(
  fill: color,
  radius: 3pt,
  inset: (x: 5pt, y: 2pt),
  text(fill: white, weight: "bold", size: 8pt, label)
)

#let tip(body) = block(
  fill: rgb("#eaf4ff"),
  stroke: (left: 3pt + accent),
  radius: 4pt,
  inset: 10pt,
  width: 100%,
  body
)

#let warn-box(body) = block(
  fill: rgb("#fff8e1"),
  stroke: (left: 3pt + warning-c),
  radius: 4pt,
  inset: 10pt,
  width: 100%,
  body
)

#let ok-box(body) = block(
  fill: rgb("#eafaf1"),
  stroke: (left: 3pt + success-c),
  radius: 4pt,
  inset: 10pt,
  width: 100%,
  body
)

#let info-box(body) = block(
  fill: rgb("#eef4fb"),
  stroke: (left: 3pt + info-c),
  radius: 4pt,
  inset: 10pt,
  width: 100%,
  body
)

// ---------- Style des blocs de code ----------
#show raw.where(block: true): it => block(
  fill: code-bg,
  radius: 6pt,
  inset: 12pt,
  width: 100%,
  text(
    font: ("Fira Mono", "Ubuntu Mono", "DejaVu Sans Mono", "Noto Sans Mono"),
    fill: rgb("#cdd6f4"),
    size: 8.5pt,
    it
  )
)

#show raw.where(block: false): it => box(
  fill: rgb("#f0e8ff"),
  radius: 3pt,
  inset: (x: 4pt, y: 1pt),
  text(font: ("Fira Mono", "Ubuntu Mono", "DejaVu Sans Mono"), size: 9pt, fill: rgb("#5c007a"), it)
)

// ---------- Configuration du document ----------
#set document(
  title: "Plateforme de Virtualisation Proxmox VE 9.0",
  author: "Hackathon Virtualisation 2025",
)

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2.5cm, right: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, auto),
        align(left,  text(size: 8pt, fill: gray, "Plateforme de Virtualisation Proxmox VE 9.0")),
        align(right, text(size: 8pt, fill: gray, "Page " + str(counter(page).get().first()))),
      )
      line(length: 100%, stroke: 0.5pt + gray)
    }
  },
  footer: context {
    if counter(page).get().first() > 1 {
      line(length: 100%, stroke: 0.5pt + gray)
      align(center, text(size: 7pt, fill: gray,
        "Rapport Proxmox VE 9.0 — Confidentiel"))
    }
  }
)

#set text(font: ("Liberation Serif", "DejaVu Serif", "Noto Serif"), size: 10.5pt, lang: "fr")
#set par(justify: true, leading: 0.65em)
#set heading(numbering: "1.1.")
#set list(indent: 1em, marker: "▸")
#set enum(indent: 1em)

#show heading.where(level: 1): it => {
  v(1.5em)
  block(
    width: 100%,
    fill: primary,
    radius: 5pt,
    inset: (x: 14pt, y: 8pt),
    text(fill: white, weight: "bold", size: 14pt, it.body)
  )
  v(0.6em)
}

#show heading.where(level: 2): it => {
  v(1em)
  stack(
    dir: ttb,
    spacing: 3pt,
    text(fill: dark, weight: "bold", size: 12pt, it.body),
    line(length: 100%, stroke: 1.5pt + primary),
  )
  v(0.4em)
}

#show heading.where(level: 3): it => {
  v(0.8em)
  text(fill: primary, weight: "bold", size: 10.5pt, [› #it.body])
  v(0.2em)
}

#show heading.where(level: 4): it => {
  v(0.5em)
  text(fill: rgb("#444"), weight: "bold", size: 10pt, it.body)
  v(0.1em)
}

// Style de table global
#set table(
  fill: (col, row) => if row == 0 { primary } else if calc.even(row) { light-bg } else { white },
  stroke: (_, row) => (bottom: 0.5pt + rgb("#ddd")),
  inset: 7pt,
)
#show table.cell.where(y: 0): set text(fill: white, weight: "bold", size: 9pt)
#show table: set text(size: 9pt)

// ============================================================
//                      PAGE DE TITRE
// ============================================================
#page(
  header: none,
  footer: none,
  margin: (top: 0pt, bottom: 0pt, left: 0pt, right: 0pt),
)[
  // Bande principale Proxmox
  #block(fill: primary, width: 100%, height: 9cm)[
    #pad(x: 3cm, top: 2.5cm, bottom: 1.5cm)[
      #text(fill: rgb("#ffd6b0"), size: 10pt, tracking: 3pt, weight: "light",
        upper("Rapport Final Complet — 2025"))
      #v(0.6cm)
      #text(fill: white, size: 30pt, weight: "bold", tracking: -0.5pt)[
        Plateforme de Virtualisation
      ]
      #text(fill: white, size: 26pt, weight: "bold")[
        Proxmox VE 9.0
      ]
      #v(0.5cm)
      #line(length: 10cm, stroke: 2pt + white.transparentize(50%))
      #v(0.5cm)
      #text(fill: rgb("#ffd6b0"), size: 11pt, style: "italic")[
        Cluster HA · Stockage iSCSI · Monitoring · Migration Live
      ]
    ]
  ]

  // Corps
  #block(width: 100%, inset: (x: 3cm, top: 1.8cm, bottom: 1cm))[
    #align(center)[
      #text(size: 68pt, fill: rgb("#ffe4cc"))[🖥️]
      #v(0.5cm)
      #text(size: 11pt, fill: rgb("#a0785a"), tracking: 1pt)[
        HP ProLiant DL380 Gen10 · KVM · LXC · Corosync · NFS · StarWind
      ]
    ]
    #v(1.8cm)
    #grid(
      columns: (1fr, 1fr),
      gutter: 12pt,
      block(
        fill: light-bg,
        stroke: 1pt + rgb("#f0d5c0"),
        radius: 8pt,
        inset: (x: 1cm, y: 0.8cm),
      )[
        #text(weight: "bold", fill: primary, size: 9pt)[INFRASTRUCTURE]
        #v(0.3cm)
        #text(size: 9.5pt)[
          3 nœuds Proxmox\
          96 vCPU · 544 GB RAM\
          600 GB stockage
        ]
      ],
      block(
        fill: light-bg,
        stroke: 1pt + rgb("#f0d5c0"),
        radius: 8pt,
        inset: (x: 1cm, y: 0.8cm),
      )[
        #text(weight: "bold", fill: primary, size: 9pt)[RÉSULTATS]
        #v(0.3cm)
        #text(size: 9.5pt)[
          Disponibilité 99.99 %\
          RTO < 2 min · RPO = 0\
          Migrations 100 % ✓
        ]
      ],
    )
  ]

  #place(bottom)[
    #block(fill: dark, width: 100%, height: 1.5cm)[
      #pad(x: 3cm, y: 0.4cm)[
        #grid(
          columns: (1fr, auto),
          align(left + horizon,  text(fill: white, size: 9pt, "Hackathon Virtualisation 2025")),
          align(right + horizon, text(fill: rgb("#ffd6b0"), size: 9pt, "Proxmox VE 9.0 — Cluster Haute Disponibilité")),
        )
      ]
    ]
  ]
]

// ============================================================
//                    TABLE DES MATIÈRES
// ============================================================
#page[
  #outline(
    title: text(fill: primary, size: 16pt, weight: "bold", "Table des matières"),
    depth: 3,
    indent: 1.5em,
  )
]

// ============================================================
//  1. ANALYSE DES BESOINS ET DIMENSIONNEMENT
// ============================================================
= Analyse des besoins et dimensionnement

== Objectifs du projet

- Héberger des machines virtuelles simultanées
- Assurer une *haute disponibilité* des services
- Permettre la *migration à chaud* des VMs
- Mettre en place un *monitoring complet*
- Garantir la sécurité de l'infrastructure

== Ressources physiques

#table(
  columns: (auto, 1fr, auto),
  table.header[Composant][Modèle / Spec][Capacité],
  [Serveur],   [HP ProLiant DL380 Gen10],          [1 physique + 2 virtuels],
  [CPU],       [2× Intel Xeon Gold 6134 (32 threads)], [96 vCPU total],
  [RAM],       [DDR4 ECC],                          [544 GB total],
  [Stockage],  [100 GB SSD + 500 GB HDD],           [600 GB utilisable],
  [Réseau],    [1GbE + 10GbE SFP+],                 [6 interfaces],
)

== Ressources virtuelles planifiées

#table(
  columns: (1fr, auto, auto, auto, auto),
  table.header[Type VM][vCPU][RAM][Disque][Quantité],
  [Web Server],      [2],  [4 GB],   [40 GB],  [5],
  [Database],        [4],  [8 GB],   [100 GB], [3],
  [Application],     [4],  [8 GB],   [80 GB],  [5],
  [Infrastructure],  [2],  [4 GB],   [50 GB],  [7],
  [*Total*],         [*56*],[*112 GB*],[*1.2 TB*],[*20*],
)

// ============================================================
//  2. CHOIX DE LA SOLUTION DE VIRTUALISATION
// ============================================================
= Choix de la solution de virtualisation

== Analyse comparative

#table(
  columns: (1fr, auto, auto, auto),
  table.header[Critère][VMware vSphere][Hyper-V][Proxmox VE],
  [Coût],          [€€€€ (licences + vCenter)], [€€ (Windows Server)],  [*Gratuit*],
  [Performances],  [Excellentes],                [Bonnes],               [*Excellentes*],
  [Fonctionnalités],[Enterprise complètes],      [Bonne intégration Win],[*Enterprise incluses*],
  [Support],       [Commercial payant],           [Microsoft],            [Communauté + payant opt.],
  [Conteneurs],    [Via Photon OS],              [Limité],               [*Support natif LXC*],
  [Interface],     [Complexe],                   [Moyenne],              [*Intuitive*],
)

== Choix retenu : Proxmox VE 9.0

#ok-box[
  *Avantages déterminants :*
  - Solution complète *sans coût de licence*
  - Support simultané *KVM + LXC*
  - Fonctionnalités enterprise incluses (*HA, Ceph, ZFS*)
  - Interface web moderne et complète
  - *API REST complète* pour l'automatisation
]

// ============================================================
//  3. ARCHITECTURE ET SCHÉMA RÉSEAU
// ============================================================
= Architecture et schéma réseau

== Topologie

```
┌─────────────────────────────────────────────────────────────┐
│                    HP ProLiant DL380 Gen10                   │
│                                                             │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐      │
│  │ Nœud Proxmox │  │ Nœud Proxmox │  │ Nœud Proxmox │      │
│  │  pve-bk-01   │  │  pve-gd-02   │  │  pve-bk-03   │      │
│  │ 10.40.20.100 │  │ 10.40.20.101 │  │ 10.40.20.102 │      │
│  │              │  │  (VMware)    │  │  (VMware)    │      │
│  └──────┬───────┘  └──────┬───────┘  └──────┬───────┘      │
│         └─────────────────┼─────────────────┘              │
│                           │                                 │
│                   ┌───────┴────────┐                        │
│                   │  Réseau iSCSI  │                        │
│                   │   (StarWind)   │                        │
│                   │  10.40.20.72   │                        │
│                   └───────┬────────┘                        │
│                   ┌───────┴────────┐                        │
│                   │ Stockage Local │                        │
│                   │ NFS — 100+500GB│                        │
│                   └────────────────┘                        │
│              iLO Management : 10.10.10.5                    │
└─────────────────────────────────────────────────────────────┘
```

== VLANs et interfaces

#table(
  columns: (auto, 1fr, 1fr, auto, auto),
  table.header[VLAN][Réseau][Usage][Passerelle][DNS],
  [10], [`10.10.10.0/24`], [Management iLO],    [`10.10.10.1`], [`8.8.8.8`],
  [20], [`10.40.20.0/24`], [Proxmox Cluster],   [`10.40.20.1`], [`8.8.8.8`],
)

#tip[Deux IP sont configurées sur chaque PC hôte pour accéder simultanément à Proxmox (VLAN 20) et à l'iLO (VLAN 10).]

// ============================================================
//  4. INSTALLATION ET CONFIGURATION DES NŒUDS
// ============================================================
= Installation et configuration des nœuds

== Préparation de l'environnement

+ Télécharger l'ISO Proxmox VE 9.x depuis #link("https://www.proxmox.com/downloads")
+ Créer une clé USB bootable (Rufus/Etcher) ou monter l'ISO sur la VM
+ Booter sur l'ISO depuis iLO ou VMware

== Installation graphique

Configuration appliquée sur chaque nœud :

#table(
  columns: (1fr, 1fr),
  table.header[Paramètre][Valeur],
  [Langue],       [Français],
  [Disque système],[`/dev/sda` (100 GB SSD) — ext4],
  [Stockage],     [`/dev/sdb` (500 GB HDD) — LVM],
  [Pays / TZ],    [France / Europe/Paris],
  [Hostname],     [`pve-bk-01.satom.ch` (adapter par nœud)],
  [IP],           [`10.40.20.100/24` (adapter par nœud)],
  [Passerelle],   [`10.40.20.1`],
  [DNS],          [`8.8.8.8`],
)

== Post-installation et configuration

=== Activation du dépôt sans licence

```bash
# Supprimer les sources enterprise
rm -f /etc/apt/sources.list.d/pve-enterprise.sources
rm -f /etc/apt/sources.list.d/ceph.sources

# Ajouter le dépôt communautaire
echo "deb http://download.proxmox.com/debian/pve trixie pve-no-subscription" \
  > /etc/apt/sources.list.d/pve-no-subscription.list

rm -rf /var/lib/apt/lists/*
```

=== Mise à jour et outils essentiels

```bash
apt update && apt dist-upgrade -y

apt install -y \
  mc htop iftop git curl neovim \
  chrony net-tools dnsutils

# NTP
systemctl enable --now chrony
```

// ============================================================
//  5. CRÉATION ET CONFIGURATION DU CLUSTER
// ============================================================
= Création et configuration du cluster

== Création sur le nœud principal (`pve-bk-01`)

```bash
# Créer le cluster
pvecm create satom-cluster

# Vérifier le statut
pvecm status
pvecm nodes
```

== Ajout des nœuds secondaires

Sur `pve-gd-02` et `pve-bk-03` :

```bash
# Après installation identique de Proxmox
# IPs : 10.40.20.101 et 10.40.20.102

pvecm add 10.40.20.100
# (saisir le mot de passe root du nœud principal)
```

== Vérification complète

```bash
# Statut du cluster
pvecm status
pvecm nodes

# Statut Corosync
systemctl status corosync
corosync-cmapctl | grep members
```

#ok-box[Résultat attendu : *3 nœuds visibles*, quorum OK (2 votes requis sur 3).]

// ============================================================
//  6. CONFIGURATION DU STOCKAGE
// ============================================================
= Configuration du stockage

== Stockage local (SSD 100 GB)

```bash
# Vérifier l'espace disponible
pvesm status

# Contenu du stockage local (SSD)
pvesm set local --content iso,backup,vztmpl,rootdir

# LVM-Thin pour les disques VMs (HDD 500 GB)
pvesm set local-lvm --content images,rootdir
```

=== Organisation des répertoires

```
/var/lib/vz/
├── iso/          # Images ISO (20 GB)
├── templates/    # Templates containers (10 GB)
├── backup/       # Sauvegardes locales (20 GB)
└── dump/         # Backups temporaires (30 GB)

/dev/pve/data     # Disques VMs (500 GB LVM-Thin)
```

== Stockage partagé NFS

=== Serveur NFS

```bash
apt install nfs-kernel-server -y

mkdir -p /srv/nfs
chmod 777 /srv/nfs

echo "/srv/nfs 10.40.20.0/24(rw,sync,no_subtree_check,no_root_squash)" \
  >> /etc/exports

exportfs -ra
systemctl restart nfs-server
```

=== Vérification depuis un nœud Proxmox

```bash
apt install nfs-common -y
mkdir -p /mnt/test-nfs
mount -t nfs <IP_NFS_SERVER>:/srv/nfs /mnt/test-nfs
touch /mnt/test-nfs/hello_from_pve01.txt
ls -l /mnt/test-nfs
umount /mnt/test-nfs
```

=== Ajout dans Proxmox (interface Web)

*Datacenter → Storage → Add → NFS*

#table(
  columns: (auto, 1fr),
  table.header[Champ][Valeur],
  [ID],      [`nfs-ha`],
  [Server],  [`<IP_NFS_SERVER>`],
  [Export],  [`/srv/nfs`],
  [Content], [Disk image, ISO image],
  [Nodes],   [Tous les nœuds du cluster],
)

== Plan de capacité

#table(
  columns: (1fr, auto, auto),
  table.header[Usage][Alloué][Restant],
  [Système Proxmox],         [20 GB],   [80 GB],
  [Images ISO],              [15 GB],   [65 GB],
  [Templates],               [10 GB],   [55 GB],
  [Backups locaux],          [20 GB],   [35 GB],
  [VMs Production (LVM)],   [450 GB],  [50 GB],
  [Stockage partagé NFS],   [500 GB],  [400 GB],
  [*Total utilisé*],        [*1 015 GB*],[*485 GB libres*],
)

// ============================================================
//  7. CRÉATION D'UNE VM ALPINE LINUX
// ============================================================
= Création d'une VM Alpine Linux

== Prérequis

- ISO Alpine Linux (`alpine-standard-3.22.0-x86_64.iso`) sur stockage partagé
- Bridge réseau `vmbr0` configuré
- VM ID : `102`

== Création via interface web

*Datacenter → Node → Create VM*

#table(
  columns: (1fr, 1fr),
  table.header[Onglet][Configuration],
  [General],  [VM ID: `102` · Name: `Alpine`],
  [OS],       [ISO: `alpine-standard-3.22.0-x86_64.iso` · Linux],
  [System],   [BIOS: SeaBIOS · SCSI: VirtIO SCSI],
  [Disk],     [Storage: `local-lvm` · Format: `qcow2` · Bus: VirtIO],
  [CPU],      [1 socket · 1–2 cores],
  [Memory],   [512–2048 MB],
  [Network],  [Bridge: `vmbr0` · Model: VirtIO (paravirtualized)],
)

=== Création via CLI

```bash
qm create 102 \
  --name Alpine \
  --memory 512 \
  --net0 virtio,bridge=vmbr0 \
  --bootdisk scsi0 \
  --scsihw virtio-scsi-pci \
  --cdrom local:iso/alpine-standard-3.22.0-x86_64.iso
```

== Installation d'Alpine Linux

```bash
# Lancer l'assistant d'installation
setup-alpine
```

Configuration appliquée :

#table(
  columns: (1fr, 1fr),
  table.header[Paramètre][Valeur],
  [Keyboard],    [`fr` ou `us`],
  [Hostname],    [`alpine102`],
  [Réseau],      [IP statique],
  [IP / Masque], [`10.40.20.200/24`],
  [Passerelle],  [`10.40.20.1`],
  [DNS],         [`8.8.8.8 8.8.4.4`],
)

== Configuration réseau post-installation

```bash
# IP temporaire
ip addr add 10.40.20.200/24 dev ens18
ip link set ens18 up
ip route add default via 10.40.20.1

# Tests de connectivité
ping 10.40.20.100   # Serveur NFS
ping 10.40.20.1     # Passerelle

# Paquets utiles
apk update
apk add bash curl vim htop
```

== Ajout de la VM au HA

```bash
# Via CLI
ha-manager add vm:102
ha-manager status
```

#tip[*Résumé Checklist HA pour la VM :* disque sur stockage partagé · réseau ping OK · migration testée avec arrêt d'un nœud.]

// ============================================================
//  8. HAUTE DISPONIBILITÉ ET MIGRATION
// ============================================================
= Haute disponibilité et migration

== Configuration HA

*Datacenter → HA → Status → OK*
Nœuds : `pve-bk-01`, `pve-gd-02`, `pve-bk-03`

== Tests de panne

=== Test 1 — Crash noyau simulé

```bash
# Depuis le shell du nœud à tester
echo c > /proc/sysrq-trigger       # Force un crash noyau

# Ou : killer le processus cluster uniquement
kill -9 $(pidof corosync)
```

=== Test 2 — Arrêt du service cluster

```bash
systemctl stop pve-cluster
# ou déconnecter le nœud du réseau (perte Corosync)
```

#warn-box[Observer depuis *Datacenter → HA → Status* : le nœud passe à `fenced`, les VMs migrent automatiquement vers les nœuds actifs.]

== Vérification post-migration

```bash
# Depuis la VM déplacée
ping -c 4 10.40.20.100    # Serveur NFS
ping -c 4 10.40.20.1      # Passerelle
ping -c 4 10.40.20.101    # Autre nœud Proxmox

# Depuis Proxmox vers la VM
ping -c 4 10.40.20.200
```

== Métriques de réussite

#table(
  columns: (1fr, auto, auto, auto),
  table.header[Indicateur][Objectif][Mesuré][Statut],
  [Détection de panne],    [< 10 s],   [< 8 s],   [☑],
  [Démarrage sur autre nœud],[< 60 s], [~45 s],   [☑],
  [RTO total],             [< 2 min],  [~1 min],  [☑],
  [RPO (perte de données)],[0],        [0],       [☑],
  [Connectivité post-migration],[Ping OK],[OK],   [☑],
  [Migrations réussies],   [> 95 %],   [100 %],  [☑],
)

// ============================================================
//  9. STOCKAGE iSCSI AVEC STARWIND
// ============================================================
= Stockage iSCSI avec StarWind Virtual SAN

== Objectif

Déployer un stockage iSCSI centralisé via *StarWind Virtual SAN* et l'intégrer dans le cluster Proxmox pour permettre : HA, migration live, et tests de résilience.

== Prérequis

- 1 serveur Windows (ou VM) hébergeant StarWind VSAN
- 3 nœuds Proxmox déjà en cluster
- Réseau dédié stockage (min. 1 Gbps, recommandé 10 Gbps)
- Disques libres sur le serveur StarWind

== Installation de StarWind

+ Télécharger depuis #link("https://www.starwindsoftware.com/starwind-virtual-san")
+ Installer l'assistant sur le serveur Windows
+ Lancer la *StarWind Management Console*
+ Ajouter le serveur local : *Host → Add Server → `localhost`*

== Création d'un LUN iSCSI

+ *Add Device (Advanced) → Virtual Hard Disk*
+ Format : fichier `.img` (ex. `D:\StarWind\LUN0.img`)
+ Taille : 100 GB (ajuster selon besoin)
+ Nom de la target : `iqn.satom-proxmox:lun`
+ Répéter pour chaque LUN supplémentaire

#tip[Vérifier que le port *3260 (iSCSI)* est ouvert dans le firewall Windows. IP du serveur StarWind : `10.40.20.72`]

== Intégration dans Proxmox

=== Ajout du stockage iSCSI

*Datacenter → Storage → Add → iSCSI*

#table(
  columns: (auto, 1fr),
  table.header[Champ][Valeur],
  [Nom],    [`DTS-PROXMOX-LUN0`],
  [Portal], [`10.40.20.72`],
  [Target], [`iqn.satom-proxmox:lun`],
)

=== Formatage des disques

Après ajout, formater chaque LUN depuis *Datacenter → Disks*.

=== Configuration HA sur iSCSI

+ Vérifier que le cluster Proxmox est opérationnel
+ LUN iSCSI accessible sur *tous* les nœuds
+ Activer HA sur une VM : *Datacenter → HA → Add*
+ Définir Max. Restart et Max. Relocate

```bash
# Tester le failover
echo c > /proc/sysrq-trigger   # Crash noyau

# Surveiller
pve-ha-manager status
pvecm status
```

== Tests de bon fonctionnement

- ☑ LUN visible dans *Datacenter → Storage*
- ☑ VM créée avec disque sur le datastore iSCSI
- ☑ Migration live réussie vers un autre nœud
- ☑ Panne simulée : autres nœuds continuent d'accéder au LUN

// ============================================================
//  10. MONITORING
// ============================================================
= Monitoring du cluster

== Architecture de monitoring

La solution retenue :

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  block(fill: light-bg, radius: 6pt, inset: 10pt, stroke: (left: 3pt + primary))[
    *Collecte*\
    Prometheus + Node Exporter\
    Port 9100 sur chaque nœud
  ],
  block(fill: light-bg, radius: 6pt, inset: 10pt, stroke: (left: 3pt + accent))[
    *Visualisation*\
    Grafana — Dashboard ID `11074`\
    Accès : `http://10.40.20.100:3000`
  ],
)

== Node Exporter (sur chaque nœud)

```bash
# Télécharger et installer
wget https://github.com/prometheus/node_exporter/releases/download/v1.6.1/node_exporter-1.6.1.linux-amd64.tar.gz
tar xvf node_exporter-*.tar.gz
cd node_exporter-1.6.1.linux-amd64

chmod +x node_exporter
./node_exporter &
```

#tip[Node Exporter expose les métriques sur le port *9100* de chaque nœud.]

== Prometheus

```bash
apt update && apt install prometheus -y
```

Configuration dans `/etc/prometheus/prometheus.yml` :

```yaml
global:
  scrape_interval:     15s
  evaluation_interval: 15s

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['localhost:9090']

  - job_name: 'proxmox-nodes'
    static_configs:
      - targets:
          - '10.40.20.100:9100'
          - '10.40.20.101:9100'
          - '10.40.20.102:9100'
```

```bash
systemctl restart prometheus
systemctl status prometheus
```

== Grafana

```bash
# Ajouter le dépôt Grafana
wget -q -O - https://packages.grafana.com/gpg.key \
  | gpg --dearmor \
  | tee /usr/share/keyrings/grafana-archive-keyring.gpg > /dev/null

echo "deb [signed-by=/usr/share/keyrings/grafana-archive-keyring.gpg] \
  https://packages.grafana.com/oss/deb stable main" \
  | tee /etc/apt/sources.list.d/grafana.list

apt update && apt install grafana -y

systemctl enable grafana-server
systemctl start grafana-server
```

```bash
# Réinitialiser le mot de passe admin si nécessaire
grafana-cli admin reset-admin-password MonMotDePasse
systemctl restart grafana-server
```

=== Panneaux Grafana recommandés

#table(
  columns: (1fr, 2fr),
  table.header[Métrique][Requête PromQL],
  [CPU usage],   [`100 - (avg by (instance)(rate(node_cpu_seconds_total{mode="idle"}[5m]))*100)`],
  [RAM libre],   [`node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes * 100`],
  [Disque libre],[`node_filesystem_avail_bytes{mountpoint="/"} / node_filesystem_size_bytes{mountpoint="/"} * 100`],
  [État nœud],   [`up` (par nœud)],
)

#tip[Importer le dashboard Proxmox complet depuis Grafana Dashboards : *ID `11074`*.]

== Schéma de la chaîne de monitoring

```
  ┌──────────────────────────────────────────┐
  │             Prometheus                    │
  │         (Collecte métriques)             │
  └───────────────┬──────────────────────────┘
                  │
       ┌──────────┴───────────┐
       │                      │
┌──────▼────────┐    ┌────────▼──────┐
│ Node Exporter  │    │ StarWind SNMP │
│ pve-bk-01 .100│    │  10.40.20.72  │
│ pve-gd-02 .101│    └───────────────┘
│ pve-bk-03 .102│
└───────────────┘
                  │
  ┌───────────────▼──────────────────────────┐
  │              Grafana                      │
  │  Dashboards — http://10.40.20.100:3000   │
  └──────────────────────────────────────────┘
```

// ============================================================
//  11. DOCUMENTATION ET PROCÉDURES
// ============================================================
= Documentation et procédures

== Accès à la plateforme

#table(
  columns: (auto, 1fr),
  table.header[Accès][URL / Commande],
  [Interface Web],  [`https://10.40.20.100:8006`],
  [SSH],            [`ssh root@10.40.20.100` (clé SSH uniquement)],
  [Grafana],        [`http://10.40.20.100:3000`],
  [Prometheus],     [`http://10.40.20.100:9090`],
  [iLO HP],         [`https://10.10.10.5`],
)

== Procédures courantes

#table(
  columns: (auto, 1fr),
  table.header[Action][Étapes],
  [Créer une VM],    [Templates → Clone → Configuration],
  [Snapshot],        [VM → Snapshot → Create],
  [Migration],       [VM → Migrate → Select node],
  [Backup],          [Datacenter → Backup → Create],
  [Ajouter un nœud], [`pvecm add 10.40.20.100`],
)

== Runbooks d'exploitation

=== Ajout d'un nœud au cluster

```bash
# 1. Installer Proxmox sur le nouveau serveur
# 2. Configurer l'IP dans le VLAN 20
# 3. Mettre à jour le système
# 4. Rejoindre le cluster
pvecm add 10.40.20.100
pvecm nodes
```

=== Gestion du stockage

```bash
# Extension LVM
lvextend -L +50G /dev/pve/data
resize2fs /dev/pve/data

# Nettoyage de l'espace
apt autoremove -y && apt clean
find /var/lib/vz/backup -name "*.vma" -mtime +30 -delete
```

== Fichiers de configuration importants

#table(
  columns: (auto, 1fr),
  table.header[Objet][Chemin],
  [Réseau],     [`/etc/network/interfaces`],
  [Cluster],    [`/etc/pve/corosync.conf`],
  [Stockage],   [`/etc/pve/storage.cfg`],
  [Utilisateurs],[`/etc/pve/user.cfg`],
)

```bash
# Commandes de diagnostic rapide
pvecm status                    # Statut cluster
pvesh get /cluster/resources    # Ressources
journalctl -f -u pveproxy       # Logs proxy live
pve-ha-manager status           # Statut HA
```

// ============================================================
//  12. BILAN ET PERSPECTIVES
// ============================================================
= Bilan et perspectives

== Bilan technique

#table(
  columns: (auto, 1fr),
  table.header[Réalisation][Détail],
  [☑ Cluster 3 nœuds],    [Opérationnel — Corosync + quorum OK],
  [☑ Haute disponibilité],[Configurée, testée, migrations 100 %],
  [☑ VMs déployées],      [Alpine Linux + templates disponibles],
  [☑ Stockage iSCSI],     [StarWind VSAN intégré sur tous les nœuds],
  [☑ Monitoring complet], [Prometheus + Grafana opérationnels],
  [☑ NFS partagé],        [Accessible depuis tous les nœuds],
)

== Métriques de performance finales

#table(
  columns: (1fr, auto, auto, auto),
  table.header[Indicateur][Mesuré][Objectif][Statut],
  [Disponibilité cluster], [99.99 %],  [99.95 %],  [☑],
  [Temps de réponse],      [< 50 ms],  [< 100 ms], [☑],
  [Utilisation CPU],       [65 %],     [< 80 %],   [☑],
  [Utilisation RAM],       [70 %],     [< 85 %],   [☑],
  [Espace disque],         [60 %],     [< 80 %],   [☑],
  [Migrations réussies],   [100 %],    [> 95 %],   [☑],
)

== Perspectives d'évolution

=== Court terme
- Mise en place de *Proxmox Backup Server*
- Automatisation avec *Ansible / Terraform*
- Intégration annuaire *LDAP / Active Directory*

=== Moyen terme
- Ajout de nœuds de calcul supplémentaires
- Implémentation de *Ceph* pour le stockage distribué
- Mise en place de la réplication DR

=== Long terme
- Migration vers une infrastructure *hyperconvergée*
- Orchestration de conteneurs (Kubernetes sur Proxmox)
- Intégration cloud hybride

#v(2em)
#align(center)[
  #block(
    fill: primary,
    radius: 6pt,
    inset: (x: 20pt, y: 12pt),
    text(fill: white, size: 10.5pt, style: "italic",
      [Plateforme de virtualisation enterprise opérationnelle avec Proxmox VE 9.0 ✅])
  )
]

#v(2em)
#align(center)[
  #text(size: 9pt, fill: gray)[
    _HackMD original :_ #link("https://hackmd.io/@bkh/r1rMTyuoee")
  ]
]
