---
date: 2026-08-23 12:54
target_ip: 10.10.2.14
os: Linux
status: Open
---
# Target: path traversal lab

## 🎯 Target Information
- **IP Address:** `undefined`
- **OS:** `undefined`

## 🔍 Enumeration
### Port Scan (Nmap)
```bash
nmap -sC -sV -p- --min-rate 5000 -oN nmap_all_ports.txt undefined
```

### Web Recon (If port 80/443 open)
```bash
feroxbuster -u http://undefined -w /usr/share/wordlists/dirb/common.txt
```

## 💀 Exploitation
- **Vulnerability Found:** 
- **Exploit Link/CVE:** 
- **Command Executed:**
```bash
# Paste payload here
```

## 🔑 Loot & Flags
- [ ] **User Flag:** 
- [ ] **Root/Admin Flag:** 
