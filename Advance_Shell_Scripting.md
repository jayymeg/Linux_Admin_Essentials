# Automating Linux System Health Checks

**1. Create System Health Check Script (health_check.sh):**
```bash
#!/bin/bash
# CPU Usage (15-min load average)
CPU_LOAD=$(uptime | awk -F 'load average: ' '{print $2}' | cut -d, -f3)
# Memory Usage
MEM_USAGE=$(free -m | awk '/Mem:/ {print $3 " MB used"}')
# Disk Usage
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5 " used"}')
# Output System Health
echo "===== System Health Check ====="
echo "CPU Load (15min): $CPU_LOAD"
echo "Memory Usage: $MEM_USAGE"
echo "Disk Usage: $DISK_USAGE"
echo -e "\nTop 5 CPU Processes:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
# Email Alert for High CPU
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
if (( $(echo "$CPU_USAGE > 50" | bc -l) )); then
    echo "High CPU Usage: $CPU_USAGE%" | mail -s "CPU Alert" your-email@example.com
fi
```
**2. Make Executable:**
```bash
chmod +x health_check.sh
```
**3. Schedule with Cron:**
```bash
crontab -e
```
Add this line to run hourly and log results:
```cron
0 * * * * /path/to/health_check.sh >> /var/log/health_check.log 2>&1
```
**Key Improvements:**
Proper CPU load calculation using `uptime`
Accurate CPU percentage calculation for alerts
Fixed syntax errors in process listing (`pid,ppid`)
Corrected disk usage check using `NR==2`
Real email alert when CPU > 50%
Added proper error redirection in cron job
**Notes:**
Replace `your-email@example.com` with your actual email
Ensure `mailutils` is installed for email notifications
Verify cron service is running
Check `/var/log/health_check.log` for output
**Verification:**
```bash
./health_check.sh  # Test manually first
sudo tail -f /var/log/health_check.log  # Check scheduled runs
```
