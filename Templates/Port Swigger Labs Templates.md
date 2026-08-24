---
<%*
// 1. Capture the inputs via prompts first
let inputUrl = await tp.system.prompt("Paste the active Lab URL:");
let vulnerability = await tp.system.suggester(["SQL Injection", "XSS", "CSRF", "SSRF", "SSTI", "Authentication", "Access Control", "Directory Traversal", "Command Injection", "Business Logic", "JWT", "API/GraphQL", "Insecure Deserialization", "WebSockets"], ["SQLi", "XSS", "CSRF", "SSRF", "SSTI", "Auth", "Access Control", "Traversal", "Cmd Injection", "Logic", "JWT", "API", "Deserialization", "WebSockets"]);
let level = await tp.system.suggester(["APPRENTICE", "PRACTITIONER", "EXPERT"], ["Apprentice", "Practitioner", "Expert"]);

// 2. Clean the URL for the HTTP Host header
let cleanHost = inputUrl ? inputUrl.replace('https://', '').split('/')[0] : 'YOUR-LAB-ID.web-security-academy.net';
-%>
date: <% tp.file.creation_date("YYYY-MM-DD HH:mm") %>
vulnerability: "<% vulnerability %>"
level: "<% level %>"
lab_url: "<% inputUrl %>"
status: "🔄 In Progress"
---
# Lab: <% tp.file.title %>

**Category:** `[[<% vulnerability %>]]` | **Difficulty:** ==<% level %>==
**URL:** [Active Instance](<% inputUrl %>)

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
Host: <% cleanHost %>
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
