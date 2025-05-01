**Simplest Way to Execute the MERN Stack Deployment on EC2:**
### **Step 1: Set Up an EC2 Instance**
**Launch an EC2 Instance** (Ubuntu 22.04 LTS AMI).

![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/Mern-App-EC2/D1.png)

![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/Mern-App-EC2/D2.png)

**Configure Security Group** to allow:
SSH (Port 22)
HTTP (Port 80)
HTTPS (Port 443)
Download the `.pem` key pair for SSH access.
---
### **Step 2: Connect to EC2 via SSH**
```bash
chmod 400 your-key.pem
ssh -i "your-key.pem" ubuntu@<EC2-Public-IP>
```

![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/Mern-App-EC2/D3.png)

![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/Mern-App-EC2/D4.png)

---
### **Step 3: Install Dependencies**
```bash
# Update packages
sudo apt update && sudo apt upgrade -y
# Install Node.js and npm
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs
# Install MongoDB (or use MongoDB Atlas for simplicity)
sudo apt install -y mongodb
sudo systemctl start mongodb
# Install PM2 (process manager)
sudo npm install -g pm2
```
![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/Mern-App-EC2/D5.png)

![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/Mern-App-EC2/D6.png)

![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/Mern-App-EC2/D7.png)

![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/Mern-App-EC2/D8.png)

---
### **Step 4: Deploy the MERN Application**
**Clone your MERN app repository**:
   ```bash
   git clone <your-repo-url>
   cd your-mern-app
   ```
**Install backend dependencies**:
   ```bash
   cd backend
   npm install
   ```
![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/Mern-App-EC2/D9.png)

**Set environment variables** (e.g., MongoDB URI in `.env`):
   ```bash
   echo "MONGODB_URI=mongodb://localhost:27017/yourdb" > .env    ```
**Start the backend with PM2**:
   ```bash
   pm2 start server.js --name "mern-backend"
   ```
![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/Mern-App-EC2/D10.png)

**Build the React frontend**:
   ```bash
   cd ../frontend
   npm install
   npm run build
   ```
![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/Mern-App-EC2/D11.png)

---
### **Step 5: Configure Nginx as a Reverse Proxy**
**Install Nginx**:
   ```bash
   sudo apt install -y nginx
   ```
![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/Mern-App-EC2/D12.png)

**Create an Nginx config file**:
   ```bash
   sudo nano /etc/nginx/sites-available/mern
   ```
   Paste:
   ```nginx
   server {
     listen 80;
     server_name your-ec2-public-ip;
     location / {
       root /home/ubuntu/your-mern-app/frontend/build;
       try_files $uri /index.html;
     }
     location /api {
       proxy_pass http://localhost:5000; # Replace 5000 with your backend port
     }
   }
   ```
![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/Mern-App-EC2/D14.png)

**Enable the config and restart Nginx**:
   ```bash
   sudo ln -s /etc/nginx/sites-available/mern /etc/nginx/sites-enabled/
   sudo systemctl restart nginx
   ```
![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/Mern-App-EC2/D13.png)

---
### **Step 6: Access the Application**
Open your browser and visit: 
  `http://<EC2-Public-IP>`
---

![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/Mern-App-EC2/D15.png)

### **Troubleshooting Tips**
Check PM2 logs: `pm2 logs mern-backend`.
Test the backend API: `curl http://localhost:5000/api/test`.
Check Nginx errors: `sudo tail -f /var/log/nginx/error.log`.
This streamlined approach minimizes complexity by using Nginx for routing and PM2 for process management, while allowing flexibility to use MongoDB locally or via Atlas.
