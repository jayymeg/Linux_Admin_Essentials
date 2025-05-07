### **1. Monitor System Performance**
Install `htop` (not `http`) to monitor resources:
```bash
sudo apt install htop
htop  # View CPU, memory, and process usage in real-time.
```

![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/System%20monitoring%20and%20log%20mgt/H1.png)

---
### **2. Check Disk Usage**
Use `df` and `du` to analyze disk space:
```bash
df -h          # Check overall disk usage.
du -sh /home   # Check total size of the /home directory.
```

![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/System%20monitoring%20and%20log%20mgt/H2.png)


---
### **3. Set Up Log Rotation**
Configure log rotation for `/var/log/m/app.log`:
Create a logrotate configuration file:
   ```bash
   sudo nano /etc/logrotate.d/myapp
   ```

![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/System%20monitoring%20and%20log%20mgt/H3.png)


Add the following configuration (corrected syntax):
   ```conf
   /var/log/m/app.log {
       daily
       missingok
       rotate 7
       compress
       delaycompress
       notifempty
       create 640 root adm  # Fix: Permissions (640), owner (root), group (adm)
   }
   ```

![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/System%20monitoring%20and%20log%20mgt/H4.png)


Test the configuration:
   ```bash
   sudo logrotate -vf /etc/logrotate.d/myapp
   ```

![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/System%20monitoring%20and%20log%20mgt/H5.png)


---
### **4. Analyze Logs for Errors**
Search for "error" entries in system logs:
```bash
grep "error" /var/log/syslog  # Replace "syslog" with your log file if needed.
```

![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/System%20monitoring%20and%20log%20mgt/H6.png)


---
### **5. Set Up Disk Usage Alerts**
Create a cron job to check disk usage every 10 minutes:
Edit the cron table:
   ```bash
   crontab -e
   ```

![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/System%20monitoring%20and%20log%20mgt/H7.png)


Add this line (corrected command):
   ```bash
   */10 * * * * df -h | awk '$5 > 90 {print $1 " is at " $5}' | mail -s "Disk Usage Alert" admin@example.com
   ```

![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/System%20monitoring%20and%20log%20mgt/H8.png)


![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/System%20monitoring%20and%20log%20mgt/H9.png)


Replace `admin@example.com` with your email.
Ensure `mailutils` is installed for email alerts (`sudo apt install mailutils`).
---
### **Summary of Fixes**
Replaced `http` with `htop` for monitoring.
Corrected `create 0G40 root adm` → `create 640 root adm` in logrotate.
Fixed the cron command syntax and replaced `hal1` with `mail`.
Clarified ambiguous instructions (e.g., `id` is unrelated to disk usage).
