# pfSense Home Lab: Secure Network Simulation

This repository contains the setup and configuration details of a **pfSense**-based home lab designed to simulate a segmented, secure enterprise network using virtualization. The lab leverages **pfSense** for firewall and routing, **OpenVPN** for remote access, and **Ubuntu** for client systems, alongside a range of monitoring and backup strategies.

## Table of Contents

- [Project Overview](#project-overview)
- [Key Components](#key-components)
- [Network Lab Setup](#network-lab-setup)
- [Network Layout](#network-layout)
- [VLAN Overview](#vlan-overview)
- [Firewall Philosophy](#firewall-philosophy)
- [VPN Configuration (OpenVPN)](#vpn-configuration-openvpn)
- [Monitoring & Logging](#monitoring--logging)
- [Backup Strategy](#backup-strategy)
- [Security Best Practices](#security-best-practices)
- [Repo Structure](#repo-structure)
- [Recommendations for Future Enhancements](#recommendations-for-future-enhancements)
- [License](#license)

---

## Project Overview

This lab project simulates a segmented, secure enterprise network with the help of **pfSense** and **Ubuntu** clients. The goal is to provide a real-world example of how to implement network segmentation, secure remote access, monitoring, and backup systems in a virtualized environment using only open-source tools.

### Key Components

- **Firewall**: pfSense CE
- **Virtualization**: VirtualBox
- **Client/Server OS**: Ubuntu
- **DHCP**: Kea DHCP
- **VPN**: OpenVPN for secure remote access
- **Monitoring**: SNMP modules + local logging
- **Backup**: Cron job automated pfSense config dumps
- **Diagramming**: Lucidchart

---

## Network Lab Setup

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

## Network Layout
![Sc](https://github.com/user-attachments/assets/e155f479-bc4b-44c0-bacf-28ca3b9ff0d1)

---

## VLAN Overview

| VLAN  | Name        | Purpose                      | Subnet         |
|-------|-------------|------------------------------|----------------|
| 10    | Client Zone | Laptops, Workstations        | 10.10.11.0/24  |
| 20    | Server Zone | Internal services & updates  | 10.10.20.0/24  |
| 30    | IoT Zone    | Smart devices, printers      | 10.10.30.0/24  |
| 40    | DMZ         | Public-facing services       | 10.10.40.0/24  |

---

## Firewall Philosophy

- **Default deny** on all VLANs
- **Allow minimal egress** (DNS, HTTP/HTTPS)
- **Explicit inter-VLAN blocking** (IoT can't access LAN, etc.)
- **DMZ internet-only, no internal access**
- **VPN can access LAN/Server Zone**

---

## VPN Configuration (OpenVPN)

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

## Monitoring & Logging

- **SNMP on pfSense**:
  - Port: 161
  - Community: MySecureROComm_2025
  - Modules: pf, host resources, ucd, netgraph
- **Logs stored in pfSense WebGUI**
- **Optional**: Remote syslog or email alerts

---

## Backup Strategy

- **Cron job** pulls pfSense config XML nightly
- Uses `curl` with API key/token (or creds)
- Saves backups with timestamp to Ubuntu:
  - `/home/user/pfsense_backups/`
- Easy rollback via WebGUI

---

## Security Best Practices

- Block private/reserved IPs on WAN
- No unnecessary services running
- Disable NAT reflection
- Use strong certs for VPN
- Isolate IoT and DMZ
- Use logging for rule hits and interface events
- Keep all packages and firmware up to date

---

## Repo Structure
```
Configs
    ├── config-fw-core1.corp.internal-20250423142917.xml
    └── openvpn.config
Docs
    ├── Firewall-Rules
    ├── Remote-Access
    ├── VLAN-Setup
    └── pfSense-Setup
Logs
    ├── Backups
    │   ├── Ubuntu_Backups
    │   │   └── backup_2025-04-23.tar.gz
    │   └── pfSense_Backups
    │       └── pfSense_Backup_20250423133800.xml
    ├── Ubuntu
    │   ├── auth_log.txt
    │   ├── cron.log
    │   ├── kernel_log.txt
    │   ├── security_alerts.txt
    │   └── syslog.txt
    └── pfSense
        ├── Authentication_Log.txt
        ├── DHCPD_log.txt
        ├── Firewall_Log.txt
        ├── OpenVPN_Log.txt
        └── System_Log.txt
Scripts
README.md
```

---

## Recommendations for Future Enhancements

- **Increase Automation**: Incorporate more automated monitoring, alerting, and response tools. Consider leveraging **Ansible** or similar for automating configuration changes and updates.
- **Improve Redundancy**: Set up high availability (HA) for pfSense to ensure network uptime and fault tolerance in case of failure.
- **Expand Monitoring Capabilities**: Integrate with **SIEM systems** such as **Splunk** for enhanced data collection, analysis, and alerting on security events.
- **Integrate Threat Intelligence Feeds**: Add dynamic threat intelligence data to pfSense and VPN configurations to better detect and block emerging threats.
- **Periodic Backup Testing**: Regularly test backup and recovery processes to ensure data integrity and recoverability in case of a failure or attack.

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

