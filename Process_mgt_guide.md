---

### **Process Management Guide**
**Objective**: Learn to start, stop, monitor processes, and adjust priorities in Linux.

---

#### **1. Start a Background Process**
**Command**:    ```bash
  sleep 300 &
  ```  
Runs `sleep 300` in the background (`&` ensures it runs in the background).  **Note**: The typo "Sleep 300 G" in the original file is incorrect; use lowercase `sleep`.
---

#### **2. List Running Processes**
**Command**:    ```bash
  ps aux
  ```  
Lists **all running processes** with details (CPU, memory, PID, etc.).  Example output:      ```bash
    user   1234  0.0  0.1  12345 6789 pts/0  S    10:00   0:00 sleep 300
    ```

---

#### **3. Kill a Process**
**Step 1: Find the PID of the `sleep` process**:    ```bash
  ps aux | grep sleep
  ```  
Filters processes to show only `sleep`.  Example output:      ```bash
    user   1234  0.0  0.1  12345 6789 pts/0  S    10:00   0:00 sleep 300
    ```  
    Here, **PID = 1234**.  

**Step 2: Terminate the process**:    ```bash
  kill 1234
  ```  
Replace `1234` with the actual PID.  Use `kill -9 1234` if the process refuses to terminate (force kill).
---

#### **4. Monitor System Resources**
**Command**:    ```bash
  top
  ```  
Displays real-time system resource usage (CPU, memory, processes).  Press `q` to exit.  **Note**: The original file mentions "RCP" — this is a typo; use `top`.
---

#### **5. Change Process Priority**
**Start a process with adjusted priority**:    ```bash
  nice -n 10 sleep 300 &
  ```  
Starts `sleep 300` with a **nice value of 10** (lower priority).  Nice values range from **-20 (highest priority)** to **19 (lowest priority)**.
**Modify priority of a running process**:    ```bash
  renice -n 5 -p 1234
  ```  
Changes the nice value of PID `1234` to **5** (higher priority than 10).  Requires the target PID (replace `1234`).
---

### **Key Notes**
**Background Processes**: Always use `&` to run commands in the background.  **Killing Processes**: Use `kill <PID>` for graceful termination; `kill -9 <PID>` for force-kill.  **Priority**: Lower nice values = higher priority.  
### **Common Errors**
Typing `Sleep` instead of `sleep` (Linux commands are case-sensitive).  Forgetting `&` when starting background processes.  Using `renice` without root privileges for negative nice values (e.g., `-5`).  
--- 
