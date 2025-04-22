# pfSense Home Lab - Network Segmentation Firewall Rules

### 🎯 Project Goal
Simulate a real-world home or small office network using pfSense to:

• Implement network segmentation using VLANs or subnetting                                                                                                                                                                                         
• Create and enforce firewall rules between networks                                                                                                                                                   
• Configure services like DHCP, DNS, and NAT                                                                                                                                                   
• Monitor and analyze traffic flows with tools like Wireshark                                                                                                                                                   

Demonstrates an understanding of core networking, access control, and secure architecture.                                                                                                                                                   
                                                                                                                                                   
### Network Design                                                                                                                                                                                                                                        
[WAN] ------> [ pfSense ]                                                                                                                                                                                                                                        
                 | (LAN 1 - 192.168.10.0/24)                                                                                                                                                   
                 |----> Ubuntu Server                                                                                                                                                   
                 |                                                                                                                                                   
                 | (LAN 2 - 192.168.20.0/24)                                                                                                                                                   
                 |----> Windows 10                                                                                                                                                   
