**LAMP STACK (Lab Guide)**

**Introduction**

A LAMP stack is a combination of open-source software typically installed together to host dynamic websites and web applications written in PHP. LAMP stands for Linux (the operating system), Apache (the web server), MySQL (the database system), and PHP (the programming language). In this guide, you'll set up a LAMP stack on an Ubuntu 22.04 server.

**Prerequisites**

To complete this tutorial, you will need an Ubuntu 22.04 server with a non-root sudo-enabled user account.

**Step 1 — Installing Apache and Updating the Firewall**

- Update the package manager cache:

sudo apt update

- Install Apache:

sudo apt install apache2

- Allow HTTP traffic through the firewall:

sudo ufw allow in "Apache"

**Step 2 — Installing MySQL**

- Install MySQL:

sudo apt install mysql-server

Secure your MySQL installation:

- Connect to MySQL as the root user:

sudo mysql

- Change root user's authentication method to mysql_native_password (for compatibility with some PHP versions):

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';

- Exit the MySQL console:

Exit

- - Run the MySQL security script:

sudo mysql_secure_installation

**Step 3 — Installing PHP**

- Install PHP and required modules:

sudo apt install php libapache2-mod-php php-mysql

**Step 4 — Creating a Virtual Host for your Website**

- Create a new directory for your website:

sudo mkdir /var/www/your_domain

- Set ownership for the directory:

sudo chown -R $USER:$USER /var/www/your_domain

- Create a virtual host configuration file:

sudo nano /etc/apache2/sites-available/your_domain.conf

- - Add the following configuration (replace your_domain with your domain name):

&lt;VirtualHost \*:80&gt;

ServerName your_domain

ServerAlias www.your_domain

ServerAdmin webmaster@localhost

DocumentRoot /var/www/your_domain

ErrorLog ${APACHE_LOG_DIR}/error.log

CustomLog ${APACHE_LOG_DIR}/access.log combined

&lt;/VirtualHost&gt;

- Enable the virtual host and disable the default one:

sudo a2ensite your_domain

sudo a2dissite 000-default

- Test Apache configuration:

sudo apache2ctl configtest

- Reload Apache:

sudo systemctl reload apache2

**Step 5 — Testing PHP Processing on your Web Server**

- Create a test PHP file:

nano /var/www/your_domain/info.php

- - Add the following PHP code:

<?php

phpinfo();

- Access the PHP info page in your browser: http://server_domain_or_IP/info.php
- After confirming PHP is working, remove the info.php file:

sudo rm /var/www/your_domain/info.php

**Step 6 — Testing Database Connection from PHP (Optional)**

- Create a test database and user:
    - Access the MySQL console as root:

sudo mysql

- - Create a database and user:

CREATE DATABASE example_database;

CREATE USER 'example_user'@'%' IDENTIFIED BY 'password';

GRANT ALL ON example_database.\* TO 'example_user'@'%';

- - Exit the MySQL console:

exit

- Create a PHP script to test database connection:
    - Create a PHP file:

nano /var/www/your_domain/todo_list.php

- - Add the PHP script (replace with your user and password):

<?php

$user = "example_user";

$password = "password";

$database = "example_database";

$table = "todo_list";

try {

$db = new PDO("mysql:host=localhost;dbname=$database", $user, $password);

echo "&lt;h2&gt;TODO&lt;/h2&gt;&lt;ol&gt;";

foreach($db->query("SELECT content FROM $table") as $row) {

echo "&lt;li&gt;" . $row\['content'\] . "&lt;/li&gt;";

}

echo "&lt;/ol&gt;";

} catch (PDOException $e) {

print "Error!: " . $e->getMessage() . "&lt;br/&gt;";

die();

}

- Access the PHP script in your browser: http://your_domain_or_IP/todo_list.php




![image 1](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/LAMP%20Stack/lamp%20stack%201.png)

