# Web Server Install/Uninstall With Custom Page

## Table of Contents


- [Script](#Script)
- [Script GIF](#WebServer-Script-Screenshots)


---

# **Script & GIFs**

---

## Script

### WebServer Install Script

* [Web server Script - Code](https://github.com/rochejohn/Bash/blob/master/webserver_install.sh)

#### Details
---
> This script will install or uninstall the choosen Webserver along with any Index Page pulled from S3. This variable can be changed at the start of the script.

> Script will check if system uses 1) Yum Package Manager or 2) Apt Package Manager and proceed with Install/Uninstall accordingly. Also outputs Public IP address for testing purpose.

> Tested only on latest AWS 1) Amazon Linux 2 and 2) Ubuntu Server 18.04.

Script creates a Menu with 5 Options:
1) Install Apache
2) Install Nginx
3) Remove Apache
4) Remove Nginx
5) Quit


---

#### WebServer Script Screenshots
---

#### Main Menu
<img src="https://github.com/rochejohn/Bash/blob/master/screen-shots/Menu.png" width="500" height="300" />

---

#### Apache Install
<img src="https://github.com/rochejohn/Bash/blob/master/screen-shots/Apache-Up.png" width="500" height="300" />

---

#### Apache Remove
<img src="https://github.com/rochejohn/Bash/blob/master/screen-shots/Apache-R.png" width="500" height="300" />

---

#### Nginx Install
<img src="https://github.com/rochejohn/Bash/blob/master/screen-shots/Nginx-Up.png" width="500" height="300" />

---

#### Nginx Remove
<img src="https://github.com/rochejohn/Bash/blob/master/screen-shots/Nginx-R.png" width="500" height="300" />

---
