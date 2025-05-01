### Linux Lab Guide: Essential Commands in DevOps 
---
#### **Task 1: Linux vs. Windows for DevOps Automation** 
**Objective**: Compare Linux and Windows for DevOps automation. 
**Summary**: 
Linux is the superior choice for DevOps automation due to the following factors: 
**Scripting Capabilities**: 
Native Bash scripting with powerful CLI tools (`grep`, `awk`, `sed`). 
Seamless integration with automation tools like Ansible and Terraform. 
**Package Management**: 
Centralized repositories (APT/YUM/DNF) simplify dependency management. 
Windows relies on third-party tools (e.g., Chocolatey), which are less standardized. 
**Container Compatibility**: 
Docker and Kubernetes run natively on Linux. 
Windows requires Hyper-V, leading to performance overhead and compatibility issues. 
**Conclusion**: Linux’s lightweight architecture, open-source ecosystem, and native DevOps tooling make it the preferred OS for automation. 
---
#### **Task 2: Configuring the OS with Bash Scripts** 
**Objective**: Automate server tasks using Bash. 
**Script (`setup.sh`)** 
```bash
#!/bin/bash
# Update OS packages
sudo apt-get update -y
# Install essential tools (e.g., firewall)
sudo apt-get install -y ufw
# Enable firewall and allow SSH
sudo ufw allow ssh
sudo ufw enable
echo "System updated and firewall enabled."
``` 
**Steps**: 
Save the script as `setup.sh` and make it executable: 
   ```bash
   chmod +x setup.sh
   ``` 
Run the script: 
   ```bash
   ./setup.sh
   ``` 
Schedule daily execution via cron: 
Open crontab: 
     ```bash
     crontab -e
     ``` 
Add this line to run at midnight: 
     ```bash
     0 0 * * * /path/to/setup.sh
     ``` 
---
#### **Task 3: System Monitoring and Logging** 
**Objective**: Track and log system performance data. 
**Steps**: 
Install `htop` for real-time monitoring: 
   ```bash
   sudo apt-get install -y htop
   ``` 
Create the monitoring script (`monitor.sh`): 
   ```bash
   #!/bin/bash
   while true; do
       echo "$(date) - CPU: $(top -bn1 | grep 'Cpu(s)' | awk '{print $2 + $4}')%, Memory: $(free | awk '/Mem/{printf "%.2f%", $3/$2*100}')" >> /var/log/system_metrics.log
       sleep 8
   done
   ``` 
Make the script executable: 
   ```bash
   chmod +x monitor.sh
   ``` 
Run it in the background: 
   ```bash
   nohup ./monitor.sh &
   ``` 
View logs: 
   ```bash
   tail -f /var/log/system_metrics.log
   ``` 
---
### **Final Notes** 
Validate scripts for syntax errors before execution. 
Test cron jobs and background processes thoroughly. 
Use `htop` to monitor system performance in real-time. 

