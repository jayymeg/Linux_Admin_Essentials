**Package Management Project**

**Objective**

Learn how to manage software packages on a Linux system using package management tools (apt, yum, or dnf).

**Step 1: Access the Linux System**

For this project, make use of a Vagrant Linux box and access it using vagrant ssh.

**Step 2: Open a Terminal**

If you're not already in a terminal session, open a terminal window. You'll use this terminal to execute package management commands.

**Step 3: Update Package Repositories**

Before installing or updating packages, it's essential to update the package repositories to get the latest package information. Use the appropriate command based on your Linux distribution:

**For Debian/Ubuntu (apt):**

sudo apt update

**For Red Hat-based systems (yum or dnf):**

sudo yum update # For older Red Hat systems

OR

sudo dnf update # For newer Red Hat systems

**Step 4: Install a Package**

To install a new package, use the appropriate command for your package manager. Replace package-name with the name of the package you want to install.

**For Debian/Ubuntu (apt):**

sudo apt install apache2

**For Red Hat-based systems (yum or dnf):**

sudo yum install httpd # For older Red Hat systems

OR

sudo dnf install httpd # For newer Red Hat systems

**Step 5: Remove a Package**

To remove an installed package, use the appropriate command for your package manager. Replace package-name with the name of the package you want to remove.

**For Debian/Ubuntu (apt):**

sudo apt remove apache2

**For Red Hat-based systems (yum or dnf):**

sudo yum remove httpd # For older Red Hat systems

OR

sudo dnf remove httpd # For newer Red Hat systems

**Step 6: Search for Packages**

To search for available packages, you can use the search functionality of your package manager.

**For Debian/Ubuntu (apt):**

apt search keyword

**For Red Hat-based systems (yum or dnf):**

yum search keyword # For older Red Hat systems

OR

dnf search keyword # For newer Red Hat systems

**Step 7: List Installed Packages**

You can list all installed packages on your system using the following command:

**For Debian/Ubuntu (apt):**

dpkg --list

**For Red Hat-based systems (yum or dnf):**

rpm -qa # For older Red Hat systems

OR

dnf list installed # For newer Red Hat systems

**Step 8: Upgrade Installed Packages**

To upgrade installed packages to their latest versions, use the appropriate command for your package manager:

**For Debian/Ubuntu (apt):**

sudo apt upgrade

**For Red Hat-based systems (yum or dnf):**

sudo yum upgrade # For older Red Hat systems

OR

sudo dnf upgrade # For newer Red Hat systems

![package management](https://github.com/jayymeg/Linux_Admin_Essentials/blob/master/package%20management/package%20management%201.png)
