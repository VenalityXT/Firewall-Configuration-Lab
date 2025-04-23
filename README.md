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
   git clone https://github.com/yourusername/network-lab.git
   cd network-lab

2. Set up your virtual machines (VMs) as outlined in the **docs/pfSense-setup.md** file. This includes:
   - Configuring the VM for pfSense.
   - Installing pfSense and configuring interfaces.
   - Creating VLANs for network segmentation and assigning them to the appropriate interfaces.

3. Follow the steps for configuring your network as described in the **docs/VLAN-setup.md** and ensure that each VLAN is isolated with proper firewall rules to improve security.

4. Once pfSense and VLANs are configured, set up OpenVPN for remote access by following the **docs/OpenVPN-setup.md**.

5. Automate pfSense backups with the script provided in **scripts/backup.sh**.

### **Configuring pfSense**
1. Configure the interfaces in pfSense, ensuring they are connected to the correct VLANs.
2. Set up static IP addresses and DHCP servers where necessary.
3. Configure firewall rules for each VLAN to control traffic flow and ensure proper network segmentation.
4. Set up logging and monitoring services in pfSense for network activity tracking and security auditing.

### **Testing and Validation**
1. Use ping tests and network tools to validate connectivity between VLANs, ensuring segmentation is effective.
2. Test remote access by connecting to pfSense via OpenVPN from an external device.
3. Verify automated backups are being created by checking the backup directory.
4. Test logging and monitoring services to ensure network activity is being recorded accurately.

## **Scripts**

- **backup.sh**: Automates the backup process for pfSense configurations.

## **Configuration Files**

This section contains references to the configuration files used in pfSense and other systems:
- **pfSense Configuration**: Saved as XML files for easy restoration.
- **OpenVPN Configurations**: Stored in `openvpn/` directory.
- **VLAN Setup**: All VLAN configuration scripts are in the `vlan/` folder.

## **Backup and Logging**

Automated backups are configured using cron jobs. This ensures that configurations and logs are regularly saved and can be restored if needed.

- **Backup Location**: `/path/to/backups/`
- **Backup Interval**: Daily at 3 AM.

Logs are stored in a centralized logging system. Access logs and firewall logs are monitored using **SNMP** and **syslog** services for analysis.

## **Security Best Practices**

- **Network Segmentation**: Ensure that VLANs are properly configured to separate sensitive data from other network traffic.
- **Firewall Rules**: Review and update firewall rules to allow only necessary traffic.
- **Regular Updates**: Keep pfSense and related software updated to patch any vulnerabilities.

## **Monitoring and Logging**

The network is continuously monitored using **SNMP** and other tools for performance and security analysis. Logs are stored in a centralized location and reviewed periodically.

## **How to Contribute**

Feel free to fork the repository, submit issues, and create pull requests. All contributions are welcome to improve the setup or add new features.
