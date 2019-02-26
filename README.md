# Web Server Install/Uninstall With Custom Page

## Table of Contents


- [Script](#Script)
- [Script GIF](#WebServer-Script-GIF)


---

# **Script & GIFs**

---

## Script

### WebServer Install Script

* [Web server Script - Code](https://github.com/rochejohn/Bash/blob/master/webserver_install.sh)

#### Details
---
> This script will install or uninstall the choosen Webserver along with any Index Page pulled from S3. This variable can be changed at the start of the script.

> Script will check if system uses 1) Yum Package Manager or 2) Apt Package Manager and proceed with Install/Uninstall accordingly.

> Tested only on latest AWS 1) Amazon Linux 2 and 2) Ubuntu Server 18.04.

Script creates a Menu with 5 Options:
1) Install Apache
2) Install Nginx
3) Remove Apache
4) Remove Nginx
5) Quit


---

#### WebServer Script GIF
---

![GIF](https://github.com/rochejohn/ATBS/blob/master/Projects/gifs/c3/collatz:validation.gif)


---
