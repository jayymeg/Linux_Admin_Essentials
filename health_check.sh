#!/bin/bash
# System Health Check
echo "===== System Health Check ====="
echo "CPU Load (15min): $(uptime | awk -F 'load average: ' '{print $2}' | cut -d, -f3 | xargs)"
echo "Memory Usage: $(free -m | awk '/Mem:/ {print $3 " MB used"}')"
echo "Disk Usage: $(df -h / | awk 'NR==2 {print $5 " used"}')"
echo -e "\nTop 5 CPU Processes:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
# CPU Alert System
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
if (( $(echo "$CPU_USAGE > 50" | bc -l) )); then
    echo "High CPU Usage: $CPU_USAGE%" | mail -s "CPU Alert" thejosephmeggison@gmail.com
fi
