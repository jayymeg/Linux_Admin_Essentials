### Step-by-Step Guide to generate and configure SSH keys using SSH Agent for secure passwordless access to GitHub.
**Objective:** 
Use SSH Agent to manage your SSH keys for secure, passwordless access to remote servers (e.g., GitHub).
---
#### **Step 1: Generate an SSH Key Pair**
Open a terminal (Linux/macOS) or Git Bash (Windows). 
Run the command: 
   ```bash
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   ```
![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/SSH%20Lab%20Guide/S1.png)

Replace `your_email@example.com` with your email. 
When prompted to **save the key**, press `Enter` to accept the default location (`~/.ssh/id_rsa`). 
**Optional but recommended**: Enter a secure passphrase when prompted. This adds an extra layer of security. 
Example Output: 
     ```
     Your identification has been saved in /home/user/.ssh/id_rsa 
     Your public key has been saved in /home/user/.ssh/id_rsa.pub 
     ```
---
#### **Step 2: Add the Private Key to SSH Agent**
Start the SSH Agent in the background: 
   ```bash
   eval "$(ssh-agent -s)"
   ```
Expected Output: `Agent pid [some_number]`. 
Add your private key to the agent: 
   ```bash
   ssh-add ~/.ssh/id_rsa
   ```
![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/SSH%20Lab%20Guide/S2.png)

If you set a passphrase, enter it once. The agent will remember it for future sessions. 
---
#### **Step 3: Copy the Public Key to GitHub**
Display your public key using: 
   ```bash
   cat ~/.ssh/id_rsa.pub
   ```
![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/SSH%20Lab%20Guide/S3.png)

Select and copy the entire output (starts with `ssh-rsa ...`). 
**Log into GitHub**: 
Go to [GitHub](https://github.com) → Click your profile picture → **Settings**. 
Navigate to **SSH and GPG Keys** → Click **New SSH Key**. 
Add details: 
**Title**: Name the key (e.g., "My Laptop"). 
**Key**: Paste the copied public key. 
Click **Add SSH Key**. 
---
![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/SSH%20Lab%20Guide/S4.png)

#### **Step 4: Test SSH Connection to GitHub**
Run: 
   ```bash
   ssh -T git@github.com
   ```
If successful, you’ll see: 
   ```
   Hi [your_username]! You’ve successfully authenticated...
   ```
---
![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/SSH%20Lab%20Guide/S5.png)

#### **Conclusion**
You’ve configured SSH Agent to manage your keys. Now: 
Your private key is secured with a passphrase but only needs to be entered once per session. 
You can securely push/pull code to GitHub without passwords. 
**Troubleshooting Tips**: 
Ensure the SSH agent is running (`eval "$(ssh-agent -s)"`). 
Verify the public key on GitHub matches your local `id_rsa.pub`.
