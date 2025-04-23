# pfSense Home Lab - Network Segmentation Firewall Rules

### 🎯 Project Goal
Simulate a real-world home or small office network using pfSense to:

• Implement network segmentation using VLANs or subnetting                                                                                                                                                                                         
• Create and enforce firewall rules between networks                                                                                                                                                   
• Configure services like DHCP, DNS, and NAT                                                                                                                                                   
• Monitor and analyze traffic flows with tools like Wireshark                                                                                                                                                   

Demonstrates an understanding of core networking, access control, and secure architecture.                                                                                                                                                   

## Network Design
![Network Diagram](/network-diagram.png](https://lucid.app/lucidchart/b46708d7-16ef-45a6-9a6c-d3ee17135c6a/edit?viewport_loc=-263%2C132%2C2217%2C1031%2C0_0&invitationId=inv_0b3062fe-9251-4e60-bebf-9ab688ca3e10))

- LAN 1: 192.168.10.0/24 (Trusted - Internal Servers)
- LAN 2: 192.168.20.0/24 (Users/Clients)
- Goal: Restrict LAN 2 from accessing LAN 1, but allow DNS & HTTP

## Tools & Technologies
- pfSense 2.7
- VirtualBox or VMware
- Ubuntu Server 22.04
- Windows 10 VM
- Wireshark (for traffic analysis)

## Key Features
- VLAN/subnet-based network segmentation
- Firewall rule enforcement
- DHCP and DNS setup
- Packet capture and traffic inspection

## Repo Structure
- `/firewall-rules`: Text-based copies of firewall configs and rationale
- `/configurations`: DHCP, DNS, and pfSense config snippets
- `/packet-captures`: Wireshark files (.pcapng) to analyze blocked/allowed traffic
- `/screenshots`: UI configs for visual understanding
- `/documentation`: Design decisions and traffic analysis reports

## Future Additions
- Add intrusion detection using Suricata or Snort
- Add VPN access from external network
- Automate log forwarding to a SIEM

## Author Notes
This project is part of a cybersecurity analyst prep series focused on building practical skills in networking, monitoring, and access control.
