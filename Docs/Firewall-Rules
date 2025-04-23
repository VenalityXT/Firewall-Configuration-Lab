# 🔥 Firewall Rules

A detailed guide to implementing a **default-deny firewall strategy** in pfSense, tailored for VLAN isolation, secure egress, and minimal exposure between zones.

---

## 🎯 Firewall Strategy Overview

- **Default deny** on all interfaces
- Allow only required **egress traffic**
- Prevent inter-VLAN traffic unless explicitly required
- Enforce isolation for IoT and DMZ
- Enable **logging** on key rule actions

### WAN Firewall Rules
[Insert Image]

---

### LAN Firewall Rules
[Insert Image]

---

### 🔹 VLAN 10: Client Zone
[Insert Image]

---

### 🔹 VLAN 20: Server Zone
[Insert Image]

---

### 🔹 VLAN 30: IoT Zone
[Insert Image]

---

### 🔹 VLAN 40: DMZ
[Insert Image]

---

### 🔁 VPN Access
[Insert Image]

---

## 🧪 Test Each Rule Set

1. Attempt ping or HTTP request from each VLAN to another.
2. Try accessing internal services from IoT/DMZ — should be blocked.
3. Use **Diagnostics > States** and **Logs** to validate traffic behavior.

---

## 📌 Next Steps

➡️ Proceed to [remote-access.md](./remote-access.md) to set up OpenVPN for secure external connectivity.
