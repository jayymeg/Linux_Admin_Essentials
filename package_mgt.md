### To complete the Package Management Project, follow these steps:

### Step 1: Update Package Repositories  
```bash
sudo apt update
```  
This ensures your system has the latest package information.  

![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/package%20mgt/G1.png)

---

### Step 2: Install the `curl` Package  
```bash
sudo apt install curl -y
```  
The `-y` flag auto-confirms the installation.  

![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/package%20mgt/G2.png)

---

### Step 3: Upgrade All Installed Packages  
```bash
sudo apt upgrade -y
```  
This upgrades all packages to their latest versions.  

![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/package%20mgt/G3.png)

---

### Step 4: Search for Packages Related to "Web Server"  
```bash
apt search "web server"
```
![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/package%20mgt/G4.png)

This lists packages (e.g., Apache, Nginx) with "web server" in their name or description.  

---
