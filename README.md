# **Network Lab Setup**

This repository contains the configuration and automation scripts for setting up and managing a network lab. The lab is built using **pfSense** as a firewall, **VLANs** for network segmentation, **VPN** for remote access, and various automation and monitoring tools for security and performance.

## **Table of Contents**
- [Project Overview](#project-overview)
- [Network Architecture](#network-architecture)
- [Setup Guide](#setup-guide)
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

## **Network Architecture**

The network is designed using several **VLANs** to separate traffic into different zones. The core components of the network include:

- **WAN (Internet)**: The outside world, connected to pfSense.
- **LAN (Client Zone)**: Internal network for end-user devices.
- **VLAN 20 (Server Zone)**: For servers and critical infrastructure that require access from the LAN and other zones.
- **VLAN 30 (IoT Zone)**: A separate network for Internet of Things (IoT) devices, isolated from sensitive devices.
- **VLAN 40 (DMZ)**: Demilitarized zone for public-facing services, such as web servers or DNS servers, that need controlled access.
