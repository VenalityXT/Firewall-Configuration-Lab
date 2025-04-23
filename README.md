# **Network Lab Setup**

This repository contains the configuration and automation scripts for setting up and managing a network lab. The lab is built using **pfSense** as a firewall, **VLANs** for network segmentation, **VPN** for remote access, and various automation and monitoring tools for security and performance.

## **Table of Contents**
- [Project Overview](#project-overview)
- [Setup Guide](#setup-guide)
  - [Requirements](#requirements)
  - [Steps to Get Started](#steps-to-get-started)
  - [Configuring pfSense](#configuring-pfsense)
  - [Testing and Validation](#testing-and-validation)
- [Scripts](#scripts)
- [Configuration Files](#configuration-files)
- [Backup and Logging](#backup-and-logging)
- [Security Best Practices](#security-best-practices)
- [Monitoring and Logging](#monitoring-and-logging)
- [How to Contribute](#how-to-contribute)
- [License](#license)

## **Project Overview**

The goal of this project is to simulate a secure network environment with proper segmentation, realistic configurations, and best practices for network security. This setup is useful for learning purposes and testing different network configurations without the need for physical hardware.

Key components of the network lab:
- **pfSense**: Used as the firewall and router, managing traffic between VLANs, WAN, and LAN.
- **VLANs**: Segmented network zones (Client, IoT, Server, DMZ) to isolate and secure different types of traffic.
- **VPN (OpenVPN)**: Remote access to the network for secure, encrypted connections.
- **Monitoring and Logging**: Tools to monitor the network and track activity for security auditing.
- **Backup Automation**: Automated backup scripts for pfSense configurations to ensure recovery in case of failure.

## **Setup Guide**

### **Requirements**
- VirtualBox or similar virtualization software for creating virtual machines.
- pfSense installed on a virtual machine (VM) to act as the firewall.
- Ubuntu or any Linux-based system for setting up supporting tools.
- A basic understanding of networking, VLANs, and firewalls.

### **Steps to Get Started**
1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/yourusername/network-lab.git
   cd network-lab
Set up your virtual machines (VMs) as outlined in the docs/pfSense-setup.md file. This includes:

Configuring the VM for pfSense.

Installing pfSense and configuring interfaces.

Creating VLANs and assigning IPs to each VLAN.

Configure pfSense, VLANs, firewall rules, and VPN following the detailed guides in the docs/ directory.

Run the automation scripts located in the scripts/ directory to create VLANs, set up firewall rules, and automate tasks such as backups.

bash
Copy
Edit
./scripts/automation/setup_vlans.sh
Validate your pfSense configuration with ping tests and VPN access.

##Configuring pfSense
###Initial Setup:

Follow the instructions in docs/pfSense-setup.md to configure the WAN and LAN interfaces.

Configure DHCP for each VLAN using the Kea DHCP option in pfSense.

Set up firewall rules for each VLAN to control access between the zones.

VLAN Configuration:

Create VLANs on pfSense (VLAN 10, VLAN 20, VLAN 30, VLAN 40).

Assign appropriate IP address ranges for each VLAN.

Set up the DHCP server for each VLAN.

VPN Configuration:

Follow the instructions in docs/openvpn-setup.md to set up OpenVPN for remote access.

Ensure that the VPN server is properly configured to allow remote clients access to the necessary resources.

Testing and Validation
Ping Tests:

Ping devices across VLANs to ensure they are correctly isolated.

Test the ability to ping from the LAN to the WAN, and from each VLAN to the internet.

VPN Access:

Verify VPN connectivity by connecting with an OpenVPN client.

Ensure the VPN tunnel works and only authorized devices can connect.

Firewall Rules Verification:

Test if the firewall rules are correctly enforcing security policies.

Attempt to access restricted zones (e.g., DMZ to LAN, IoT to Server) to verify that traffic is blocked as expected.

Scripts
Backup and Automation:
scripts/backup/pfSense_backup.sh: A script to automate backups of pfSense configurations.

scripts/automation/cronjobs.sh: A script to set up cron jobs for regular backup schedules.

scripts/network/create-vlans.sh: Script to create and configure VLANs on pfSense.

Network Configuration:
Create VLANs: Scripts for automating VLAN setup.

Firewall Rules: Customizable rules for securing VLANs and controlling traffic.

Configuration Files
All important configuration files for pfSense, DHCP, VLANs, and VPN are stored in the configs/ folder:

pfSense-config.xml: Exported pfSense configuration file.

dhcp-kea-config.conf: Kea DHCP configuration for automated IP allocation.

firewall-rules.conf: Firewall rules for each VLAN, including LAN, DMZ, IoT, and Server zones.

openvpn-config.ovpn: OpenVPN client configuration for remote access.

Backup and Logging
All backup scripts are in the scripts/backup/ folder.

Logs of pfSense operations, backups, and VPN connections are saved in logs/.

To automate backups, we use cron jobs that run daily, weekly, and monthly backups of the pfSense configuration.

Security Best Practices
Regularly update pfSense and other systems.

Isolate IoT devices in their own VLAN to reduce the attack surface.

Use VPN for remote access, and restrict remote access to only authorized users.

Implement detailed firewall rules to limit cross-VLAN communication based on your needs.
