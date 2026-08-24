---
date: 2026-07-09 19:38
vulnerability: Traversal
level: Practitioner
lab_url: https://portswigger.net/web-security/learning-paths/file-upload-vulnerabilities/what-are-file-upload-vulnerabilities/file-upload/what-are-file-upload-vulnerabilities
status: 🔄 In Progress
---
# Lab: Example- SQL Injection Write-Up

**Category:** `[[Traversal]]` | **Difficulty:** ==Practitioner==
**URL:** [Active Instance](https://portswigger.net/web-security/learning-paths/file-upload-vulnerabilities/what-are-file-upload-vulnerabilities/file-upload/what-are-file-upload-vulnerabilities)

---

## 🎯 Objective
- [ ] **Goal:** 
- [ ] **Target User/Credentials:** `wiener:peter` / `carlos:montoya`

## 🔍 Reconnaissance & Mapping
### Intercepted Vectors / Parameters
- **Target URL/Endpoint:** `_`
- **Vulnerable Parameter(s):** `_`
- **Method:** `GET` / `POST`

### Interesting Behaviors / Notes
- *What happens when you inject standard characters?*
- *Are error messages verbosely exposed?*

---

## 💀 Exploitation / Proof of Concept

### Intercepted Base Request (Burp Suite)
```http
POST /example-endpoint HTTP/1.1
Host: portswigger.net
Cookie: session=EXAMPLE_SESSION_TOKEN

param1=test&param2=fuzz
```

### Exploit & Payloads
- **Payload used:** 
```sql
-- Paste raw payload or script snippet here
```

- **Explanation:** *Why did this specific payload bypass the filter or exploit the vulnerability?*

---

## 🏁 Solution & Steps to Reproduce
1. Open **Burp Suite** and navigate to the intercept proxy tab.
2. Browse to the target endpoint.
3. Send the vulnerable request to **Repeater** (`Ctrl + R`).
4. Modify the parameter to `_`.
5. Send the request to solve the lab.

## 🛡️ Remediation
*How should the developer fix this vulnerability?*
- 
