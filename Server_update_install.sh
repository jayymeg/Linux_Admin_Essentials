#!/bin/bash

# Automated Server Update and Web Server Installation Script
# Author: [Your Name]
# Date: [Date]
# Description: This script automates system updates, installs Apache2 and Nginx,
# and sets up SSH key-based authentication on multiple remote servers.

# Variables
SERVERS=("server1" "server2" "server3" "server4" "server5") # Replace with actual server addresses
USERNAME="your_username"  # Replace with your actual username
SSH_KEY="~/.ssh/id_rsa.pub"  # Path to your SSH public key

# Function to update and install web servers on remote servers
update_and_install() {
    local SERVER=$1

    echo "Updating $SERVER..."
    ssh -o "StrictHostKeyChecking=no" "$USERNAME@$SERVER" <<EOF
        sudo apt-get update -y
        sudo apt-get upgrade -y
        sudo apt-get install -y apache2 nginx
EOF

    if [ $? -eq 0 ]; then
        echo "Update and installation completed successfully on $SERVER"
    else
        echo "Failed to update or install on $SERVER" >&2
    fi
}

# Function to setup SSH key-based authentication
setup_ssh() {
    local SERVER=$1

    echo "Setting up SSH key-based authentication on $SERVER..."
    ssh-copy-id -i "$SSH_KEY" "$USERNAME@$SERVER"
    
    if [ $? -eq 0 ]; then
        echo "SSH key-based authentication set up successfully on $SERVER"
    else
        echo "Failed to set up SSH on $SERVER" >&2
    fi
}

# Loop through each server to update and install the web server
for SERVER in "${SERVERS[@]}"; do
    setup_ssh "$SERVER"
    update_and_install "$SERVER"
done

echo "Script execution completed."
