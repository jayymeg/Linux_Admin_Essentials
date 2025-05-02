**Disk Management and Mounting**  
**Objective:** Successfully partition, format, mount, and persist a disk in Linux.  

---

#### **1. List Disks and Partitions**  
Identify available disks and partitions to confirm the target disk (e.g., `/dev/sdb`).  
```bash
lsblk       # Lists block devices
# OR
sudo fdisk -l  # Detailed disk information
```  

---

#### **2. Edit your Vagrantfile:
Add this block inside the Vagrant.configure block to attach a virtual disk: rebooting the vm after.

```config.vm.provider "virtualbox" do |vb|
  vb.customize ['createhd', '--filename', 'extra_disk.vdi', '--size', 10240] # 10 GB
  vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', 'extra_disk.vdi']
end
```

#### **3. Create a Partition**  
Use `fdisk` to create a new partition on the target disk (e.g., `/dev/sdb`):  
```bash
sudo fdisk /dev/sdb
```  
**Follow these interactive commands in `fdisk`:**  
- Press `n` to create a **new partition**.  
- Choose `p` for **primary partition**.  
- Accept default values for partition number, first/last sectors.  
- Press `w` to **write changes** and exit.  

---

#### **4. Format the Partition**  
Format the new partition (e.g., `/dev/sdb1`) with the **ext4 filesystem**:  
```bash
sudo mkfs.ext4 /dev/sdb1   # Fixes "exx4" typo from the original document
```  

---

#### **5. Create Mount Point and Mount the Partition**  
Create a directory to mount the partition and mount it:  
```bash
sudo mkdir -p /mnt/mydisk  # Fixes "./mnt/mydisk" typo from the original document
sudo mount /dev/sdb1 /mnt/mydisk
```  

---

#### **6. Verify the Mount**  
Confirm the partition is mounted:  
```bash
df -h /mnt/mydisk  # Shows disk usage and mount status
# OR
lsblk /dev/sdb1    # Displays partition details
```  

---

#### **7. Add to /etc/fstab for Persistence**  
Ensure the partition mounts automatically at boot by adding it to `/etc/fstab`:  
```bash
echo '/dev/sdb1 /mnt/mydisk ext4 defaults 0 0' | sudo tee -a /etc/fstab  # Fixes malformed entry from the original document
```  
**Verify the entry:**  
```bash
sudo mount -a  # Tests fstab configuration
```  

---

### **Final Validation**  
After completing all steps:  
1. Reboot the system to confirm automatic mounting:  
   ```bash
   sudo reboot
   ```  
2. Post-reboot, verify the mount again:  
   ```bash
   df -h /mnt/mydisk
   ```  

**Outcome:** The partition `/dev/sdb1` is now persistently mounted to `/mnt/mydisk` and will survive reboots.  
