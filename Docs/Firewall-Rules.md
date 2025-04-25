# Firewall Rules

A detailed guide to implementing a **default-deny firewall strategy** in pfSense, tailored for VLAN isolation, secure egress, and minimal exposure between zones.

---

## Firewall Strategy Overview

- **Default deny** on all interfaces
- Allow only required **egress traffic**
- Prevent inter-VLAN traffic unless explicitly required
- Enforce isolation for IoT and DMZ
- Enable **logging** on key rule actions

### WAN Firewall Rules
![WAN Firewall Rule](https://github.com/user-attachments/assets/04df3d53-9019-421e-a096-8ae57270f303)

---

### LAN Firewall Rules
![LAN Firewall Rule](https://github.com/user-attachments/assets/c0db0723-884d-4545-9457-f90b22cc8f07)

---

### 🔹 VLAN 10: Client Zone
![VLAN10 Firewall Rule](https://github.com/user-attachments/assets/97f42ff1-bc72-4fd0-82f0-f584d1c69e76)

---

### 🔹 VLAN 20: Server Zone
![VLAN20 Firewall Rule](https://github.com/user-attachments/assets/36641cfb-dcbe-434c-b253-96b69516439e)

---

### 🔹 VLAN 30: IoT Zone
![VLAN 30 Firewall Rule](https://github.com/user-attachments/assets/0d70363f-f280-498a-84b2-06bbf4074a85)

---


### 🔹 VLAN 40: DMZ
![VLAN40 Firewall Rule](https://github.com/user-attachments/assets/b44f15e0-778c-4a6c-9e0e-2541e67a3e4f)

---

### VPN Access
[Insert Image]

---

## Test Each Rule Set

1. Attempt ping or HTTP request from each VLAN to another.
2. Try accessing internal services from IoT/DMZ — should be blocked.
3. Use **Diagnostics > States** and **Logs** to validate traffic behavior.

---

## Next Steps

Proceed to [remote-access.md](./remote-access.md) to set up OpenVPN for secure external connectivity.
