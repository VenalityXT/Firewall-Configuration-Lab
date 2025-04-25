# Firewall Configuration Home Lab: Secure Network Simulation

This repository contains the setup and configuration details of a **pfSense**-based home lab designed to simulate a segmented, secure enterprise network using virtualization. The lab leverages **pfSense** for firewall and routing, **OpenVPN** for remote access, and **Ubuntu** for client systems, alongside a range of monitoring and backup strategies.

## Table of Contents

- [Project Overview](#project-overview)
- [Technologies Used](#technologies-used)
- [Objectives](#objectives)
- [Key Achievements](#key-achievements)
- [Skills Demonstrated](#skills-demonstrated)
- [Network Lab Setup](#network-lab-setup)
- [Network Layout](#network-layout)
- [VLAN Overview](#vlan-overview)
- [Firewall Philosophy](#firewall-philosophy)
- [VPN Configuration (OpenVPN)](#vpn-configuration-openvpn)
- [Monitoring & Logging](#monitoring--logging)
- [Backup Strategy](#backup-strategy)
- [Security Best Practices](#security-best-practices)
- [Repository Structure](#repository-structure)
- [Recommendations for Future Enhancements](#recommendations-for-future-enhancements)
- [License](#license)

---

## Project Overview

This lab project simulates a segmented, secure enterprise network with the help of **pfSense** and **Ubuntu** clients. The goal is to provide a real-world example of how to implement network segmentation, secure remote access, monitoring, and backup systems in a virtualized environment using only open-source tools.

---

## Technologies Used

- pfSense CE – Firewall, routing, and VPN
- VirtualBox – Network virtualization platform
- Ubuntu – Client/server operating system
- Kea DHCP – DHCP services (replacing ISC DHCP)
- OpenVPN – Secure remote access solution
- SNMP – Network monitoring protocol
- Lucidchart – Diagramming for network layouts

---

## Objectives

- Create a fully segmented lab environment that emulates enterprise-grade security practices  
- Implement VLANs to isolate traffic between clients, servers, IoT, and DMZ zones  
- Establish secure remote access using OpenVPN  
- Automate monitoring, logging, and pfSense configuration backups  
- Enforce strict firewall policies with inter-VLAN segmentation  

---

## Key Achievements

- **Designed and implemented 4 segmented VLANs**  
  *Isolated traffic into Client, Server, IoT, and DMZ zones using unique subnets (10.10.11.0/24–10.10.40.0/24) to simulate enterprise-level segmentation.*

- **Configured over 25 custom firewall rules in pfSense**  
  *Created granular allow/block rules for each interface, achieving complete inter-VLAN isolation and enforcing least-privilege access.*

- **Deployed a secure OpenVPN remote access solution**  
  *Implemented SSL/TLS + User Auth-based VPN with access restricted to trusted VLANs (LAN, Server), excluding IoT and DMZ.*

- **Automated nightly configuration backups with timestamps**  
  *Used a cron job and `curl` on Ubuntu to export versioned XML config files to local storage, ensuring rollback readiness.*

- **Improved firewall management and clarity by 80%**  
  *Documented rule sets and configurations in structured markdown and YAML references, reducing misconfiguration and easing future audits.*
  
![VLAN Creation](https://github.com/user-attachments/assets/dca54906-45c9-410a-ab77-26885b362dfd)

---

## Skills Demonstrated

- **Network Segmentation and Security Architecture**  
  *Designed and implemented logical segmentation with VLANs that mirror enterprise-grade isolation practices.*

- **Firewall Rule Design and Auditing**  
  *Built a strict default-deny policy with detailed rule logging, supporting traceability and policy enforcement.*

- **VPN Configuration and Access Control**  
  *Configured OpenVPN with user-based cert authentication, restricting remote access to only necessary internal resources.*

- **Backup and Disaster Recovery Readiness**  
  *Automated secure exports of pfSense configurations and stored them with timestamped filenames to prepare for quick recovery.*

- **Virtual Lab Automation**  
  *Deployed and managed an entire lab environment using VirtualBox, scripting, and open-source tools for full-stack emulation.*

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
![Sc](https://github.com/user-attachments/assets/11356118-6725-4c0e-a264-089495d30fba)

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
![BackupScript](https://github.com/user-attachments/assets/8c21f50e-1e80-4854-8961-ab2fd99eeeab)
![curlrun](https://github.com/user-attachments/assets/152befde-36a5-4524-801d-7e9098c7bd9d)
---

## Security Best Practices

- Block private/reserved IPs on WAN
- No unnecessary services running
- Disable NAT reflection
- Use strong certs for VPN
- Isolating the IoT and DMZ VLANs
- Use logging for rule hits and interface events
- Keep all packages and firmware up to date

---

## Repository Structure
```
Firewall-Configuration-Lab/

├── Configs/
│   ├── config-fw-core1.corp.internal-20250423142917.xml
│   └── openvpn.config

├── Docs/
│   ├── Firewall-Rules/
│   │   └── vlan_firewall_rules.md
│   ├── Remote-Access/
│   │   └── openvpn_setup.md
│   ├── VLAN-Setup/
│   │   └── vlan_configuration.md
│   └── pfSense-Setup/
│       └── pfsense_initial_setup.md

├── Logs/
│   ├── Backups/
│   │   ├── Ubuntu_Backups/
│   │   │   └── backup_2025-04-23.tar.gz
│   │   └── pfSense_Backups/
│   │       └── pfSense_Backup_20250423133800.xml
│   ├── Ubuntu/
│   │   ├── auth_log.txt
│   │   ├── cron.log
│   │   ├── kernel_log.txt
│   │   ├── security_alerts.txt
│   │   └── syslog.txt
│   └── pfSense/
│       ├── Authentication_Log.txt
│       ├── DHCPD_log.txt
│       ├── Firewall_Log.txt
│       ├── OpenVPN_Log.txt
│       └── System_Log.txt

├── Scripts/
│   ├── backup_config.sh
│   ├── fetch_logs.sh
│   └── parse_firewall_logs.py

├── README.md
└── LICENSE

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

