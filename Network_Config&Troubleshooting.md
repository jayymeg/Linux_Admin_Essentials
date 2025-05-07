# Network Configuration and Troubleshooting Guide using Vagrant, Netplan, and Linux Commands
---
## STEP 1: Create Project Directory and Initialize Vagrant
**On your host system:**
```bash
mkdir network_project
cd network_project
vagrant init hashicorp/bionic64
```
---
## STEP 2: Use This Simple Vagrantfile
Replace the content of the generated Vagrantfile with:
```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"
  config.vm.network "private_network", ip: "192.168.1.100"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "512"
  end
  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
    sudo apt-get install -y net-tools iputils-ping tcpdump ufw dnsutils
  SHELL
end
```
---
## STEP 3: Start the VM
```bash
vagrant up
vagrant ssh
```
---
## STEP 4: Configure Static IP with Netplan
**On the VM**, edit the Netplan config:
```bash
sudo nano /etc/netplan/01-netcfg.yaml
```
**Replace contents with:**
```yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    eth1:
      dhcp4: no
      addresses: [192.168.1.100/24]
      gateway4: 192.168.1.1
      nameservers:
        addresses: [8.8.8.8, 8.8.4.4]
```

![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/Network_Config%26Troubleshooting/V2.png)

**Apply changes:**
```bash
sudo netplan apply
```

![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/Network_Config%26Troubleshooting/V3.png)

---
## STEP 5: Test Network Connectivity
```bash
ping -c 4 192.168.1.1
ping -c 4 google.com
```

![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/Network_Config%26Troubleshooting/V4.png)

---
## STEP 6: Capture Network Traffic
```bash
sudo tcpdump -i eth1 -w capture.pcap
# Let it run for a few seconds, then press Ctrl+C
# To read the file:
tcpdump -r capture.pcap
```

![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/Network_Config%26Troubleshooting/V5.png)

---
## STEP 7: Set Up a Firewall
```bash
sudo ufw allow ssh
sudo ufw allow http
sudo ufw enable
```

![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/Network_Config%26Troubleshooting/V6.png)

---
## STEP 8: Troubleshoot DNS
```bash
dig google.com
```

![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/Network_Config%26Troubleshooting/V7.png)

---
**Note:** This configuration uses Ubuntu Bionic (18.04 LTS). For newer Ubuntu versions, adjust the Netplan configuration syntax if needed.
```
