# LAMP STACK (Lab Guide)

## Introduction

A LAMP stack is a combination of open-source software typically installed together to host dynamic websites and web applications written in PHP. LAMP stands for Linux (the operating system), Apache (the web server), MySQL (the database system), and PHP (the programming language). In this guide, you'll set up a LAMP stack on an Ubuntu 22.04 server.

## Prerequisites

To complete this tutorial, you will need an Ubuntu 22.04 server with a non-root sudo-enabled user account.

## Step 1 — Installing Apache and Updating the Firewall

Update the package manager cache:

```bash
sudo apt update
```

Install Apache:

```bash
sudo apt install apache2
```

Allow HTTP traffic through the firewall:

```bash
sudo ufw allow in "Apache"
```

## Step 2 — Installing MySQL

Install MySQL:

```bash
sudo apt install mysql-server
```

Secure your MySQL installation:

Connect to MySQL as the root user:

```bash
sudo mysql
```

Change the root user's authentication method to `mysql_native_password` (for compatibility with some PHP versions):

```sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
```

Exit the MySQL console:

```bash
exit
```

Run the MySQL security script:

```bash
sudo mysql_secure_installation
```

## Step 3 — Installing PHP

Install PHP and the required modules:

```bash
sudo apt install php libapache2-mod-php php-mysql
```

## Step 4 — Creating a Virtual Host for Your Website

Create a new directory for your website:

```bash
sudo mkdir /var/www/your_domain
```

Set ownership for the directory:

```bash
sudo chown -R $USER:$USER /var/www/your_domain
```

Create a virtual host configuration file:

```bash
sudo nano /etc/apache2/sites-available/your_domain.conf
```

Add the following configuration (replace `your_domain` with your domain name):

```apache
<VirtualHost *:80>
    ServerName your_domain
    ServerAlias www.your_domain 
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/your_domain
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

Enable the virtual host and disable the default one:

```bash
sudo a2ensite your_domain
sudo a2dissite 000-default
```

Test the Apache configuration:

```bash
sudo apache2ctl configtest
```

Reload Apache:

```bash
sudo systemctl reload apache2
```

## Step 5 — Testing PHP Processing on Your Web Server

Create a test PHP file:

```bash
nano /var/www/your_domain/info.php
```

Add the following PHP code:

```php
<?php
phpinfo();
?>
```

Access the PHP info page in your browser:

```
http://server_domain_or_IP/info.php
```

After confirming PHP is working, remove the `info.php` file:

```bash
sudo rm /var/www/your_domain/info.php
```

## Step 6 — Testing Database Connection from PHP (Optional)

Create a test database and user:

Access the MySQL console as root:

```bash
sudo mysql
```

Create a database and user:

```sql
CREATE DATABASE example_database;
CREATE USER 'example_user'@'%' IDENTIFIED BY 'password';
GRANT ALL ON example_database.* TO 'example_user'@'%';
```

Exit the MySQL console:

```bash
exit
```

Create a PHP script to test database connection:

Create a PHP file:

```bash
nano /var/www/your_domain/todo_list.php
```

Add the PHP script (replace with your user and password):

```php
<?php
$user = "example_user";
$password = "password";
$database = "example_database";
$table = "todo_list";

try {
  $db = new PDO("mysql:host=localhost;dbname=$database", $user, $password);
  echo "<h2>TODO</h2><ol>";
  foreach($db->query("SELECT content FROM $table") as $row) {
    echo "<li>" . $row['content'] . "</li>";
  }
  echo "</ol>";
} catch (PDOException $e) {
  print "Error!: " . $e->getMessage() . "<br/>";
  die();
}
?>
```

Access the PHP script in your browser:

```
http://your_domain_or_IP/todo_list.php
```
```
![my image](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/LAMP%20Stack/lamp%20stack%201.png)


