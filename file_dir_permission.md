
## File and Directory Permissions Project

---

### Step 1: Access the Linux System
Open Terminal and run:

```bash
vagrant ssh
```

---

### Step 2: Create and Navigate to the Directory
Run these commands:

```bash
mkdir pistis
cd pistis
```

![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/file%20%26%20dir%20permission/L1.png)
---

### Step 3: Create Files and Directories
Run:

```bash
touch example.txt
mkdir exampledir
```

---

### Step 4: Modify File Permissions
Run:

```bash
chmod u+rw example.txt
ls -l
```

---

### Step 5: Modify Directory Permissions
Run:

```bash
chmod u+rwx exampledir
ls -ld exampledir
```

---

### Step 6: Create a New Group
Run:

```bash
sudo groupadd pistisgroup
```

---

### Step 7: Create a New User
Run:

```bash
sudo useradd -m -G pistisgroup pistisuser
```

---

### Step 8: Change File Owner
Run:

```bash
sudo chown pistisuser example.txt
ls -l
```

---

### Step 9: Change Directory Owner
Run:

```bash
sudo chown pistisuser exampledir
ls -ld exampledir
```

---

### Step 10: Change Group Ownership
Run:

```bash
sudo chgrp pistisgroup example.txt
ls -l
```

---

### Step 11: Verify Permissions and Ownership
Run:

```bash
ls -l
ls -ld exampledir
```

---

### Step 12: Test Access
Run:

```bash
sudo su pistisuser
cd exampledir
exit
```

---

### Step 13: Setuid, Setgid, and Sticky Bit
Run these commands one by one:

```bash
chmod u+s example.txt
chmod g+s exampledir
chmod +t exampledir
ls -l example.txt
ls -ld exampledir
```

---

### Step 14: Recursive Permissions
Run:

```bash
mkdir -p exampledir/subdir
touch exampledir/subdir/file.txt
chmod -R 755 exampledir
ls -LR exampledir
```

---

### Step 15: Default Permissions (umask)
Run:

```bash
umask
umask 0027
touch newfile
ls -l newfile
```

