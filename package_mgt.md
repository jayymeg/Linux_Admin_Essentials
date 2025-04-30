To complete the Package Management Project, follow these steps:

### Step 1: Update Package Repositories  
```bash
sudo apt update
```  
This ensures your system has the latest package information.  

---

### Step 2: Install the `curl` Package  
```bash
sudo apt install curl -y
```  
The `-y` flag auto-confirms the installation.  

---

### Step 3: Upgrade All Installed Packages  
```bash
sudo apt upgrade -y
```  
This upgrades all packages to their latest versions.  

---

### Step 4: Search for Packages Related to "Web Server"  
```bash
apt search "web server"
```  
This lists packages (e.g., Apache, Nginx) with "web server" in their name or description.  

---
