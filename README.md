# pfSense Home Lab: Secure Network Simulation

A virtualized, security-focused lab environment designed using **pfSense** to simulate enterprise-grade network segmentation, remote access, monitoring, and backup systems using only free tools in a virtualized environment.

## 📚 Table of Contents

- [🧰 Project Overview](#-project-overview)
  - [🔑 Key Components](#-key-components)
- [🛠️ Network Lab Setup](#️-network-lab-setup)
- [🌐 Network Layout](#-network-layout)
- [🧩 VLAN Overview](#-vlan-overview)
- [🔥 Firewall Philosophy](#-firewall-philosophy)
- [🛡️ VPN Configuration (OpenVPN)](#️-vpn-configuration-openvpn)
- [📊 Monitoring & Logging](#-monitoring--logging)
- [💾 Backup Strategy](#-backup-strategy)
- [🔐 Security Best Practices](#-security-best-practices)
- [📂 Repo Structure](#-repo-structure)
- [🔎 Why This Lab?](#-why-this-lab)
- [📝 License](#-license)

---

## 🧰 Project Overview

This lab project creates a fully virtual network using **pfSense** and **Ubuntu** clients to simulate segmented, secure enterprise networks with real-world policies and tooling.

### 🔑 Key Components

- **Firewall**: pfSense CE
- **Virtualization**: VirtualBox
- **Client/Server OS**: Ubuntu
- **DHCP**: Kea DHCP
- **VPN**: OpenVPN for secure remote access
- **Monitoring**: SNMP modules + local logging
- **Backup**: Cron job automated pfSense config dumps
- **Diagramming**: Lucidchart

---

## 🛠️ Network Lab Setup

1. **Install VirtualBox** and set up a virtual network using internal adapters.
2. **Install pfSense CE** with 2 interfaces: WAN (DHCP), LAN (10.10.10.1/24).
3. **Create VLANs** for segmented traffic (Client, Server, IoT, DMZ).
4. **Install Ubuntu VM** as a client device and set up VLAN tagging.
5. **Configure firewall rules** on each interface with a default-deny strategy.
6. **Set up OpenVPN** for remote access with certs and user auth.
7. **Enable SNMP** for monitoring + configure system logs.
8. **Automate pfSense backups** via cron on the Ubuntu box.
9. **Secure all defaults** and isolate IoT + DMZ traffic.

---

## 🌐 Network Layout
![Network Diagram](https://github.com/user-attachments/assets/c3a850a0-6082-4874-9cde-dad1f822edb9)

---

## 🧩 VLAN Overview

| VLAN  | Name        | Purpose                      | Subnet         |
|-------|-------------|------------------------------|----------------|
| 10    | Client Zone | Laptops, Workstations        | 10.10.11.0/24  |
| 20    | Server Zone | Internal services & updates  | 10.10.20.0/24  |
| 30    | IoT Zone    | Smart devices, printers      | 10.10.30.0/24  |
| 40    | DMZ         | Public-facing services       | 10.10.40.0/24  |

---

## 🔥 Firewall Philosophy

- **Default deny** on all VLANs
- **Allow minimal egress** (DNS, HTTP/HTTPS)
- **Explicit inter-VLAN blocking** (IoT can't access LAN, etc.)
- **DMZ internet-only, no internal access**
- **VPN can access LAN/Server Zone**

---

## 🛡️ VPN Configuration (OpenVPN)

- **Mode**: Remote Access (SSL/TLS + User Auth)
- **Tunnel Network**: 10.100.0.0/24
- **Local Networks Allowed**: 10.10.10.0/24, 10.10.20.0/24
- **TLS Certs**: CA + user certs
- **DNS Push**: Enabled
- **Compression**: Disabled
- **Client Comm**: Allowed
- **Duplicate Clients**: Not allowed
- **Hardware Crypto**: AES-NI if supported

---

## 📊 Monitoring & Logging

- SNMP on pfSense:
  - Port: 161
  - Community: public
  - Modules: pf, host resources, ucd, netgraph
- Logs stored in pfSense WebGUI
- Optional remote syslog or email alerts

---

## 💾 Backup Strategy

- **Cron job** pulls pfSense config XML nightly
- Uses `curl` with API key/token (or creds)
- Saves backups with timestamp to Ubuntu:
  - `/home/user/pfsense_backups/`
- Easy rollback via WebGUI

---

## 🔐 Security Best Practices

- Block private/reserved IPs on WAN
- No unnecessary services running
- Disable NAT reflection
- Use strong certs for VPN
- Isolate IoT and DMZ
- Use logging for rule hits and interface events
- Keep all packages and firmware up to date

---

## 📂 Repo Structure

