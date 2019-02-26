#!/bin/bash 

# dialog is required to be installed for this script
#global variables / default value

PACKAGE_MANAGER=''
PUBLIC_IP=`curl -s ifconfig.io`

# HTML_PAGE can be changed to ANY location to pull in HTML page.
HTML_PAGE="https://s3-ap-southeast-2.amazonaws.com/webserver-bash/index.html"

# Below just calls the command dialog using MENUBOX as this version of dialog is to create a menu.
MENUBOX=${MENUBOX=dialog}



#below is used to detect package manager in system for installing webserver of choice

# -n tests for a non-zero-length string



if [ -n "$(command -v yum)" ]; then
PACKAGE_MANAGER=YUM


elif [ -n "$(command -v apt-get)" ]; then
PACKAGE_MANAGER=APT
fi





# funtion declarations - start

# function to display a simple menu
funcDisplayDialogMenu () {

        $MENUBOX --title "[ Web Server Install ]" --menu "\nPackage Manager Detected: $PACKAGE_MANAGER\n\nUse UP/DOWN Arrows to move and select or use the Number of your Choice and press Enter" 20 45 5 1 "Install Apache" 2 "Install Nginx" 3 "Remove Apache" 4 "Remove Nginx" X "Exit" 2>choice.txt

}


# function declare stop

# script - start

funcDisplayDialogMenu

# APACHE INSTALL

case "`cat choice.txt`" in

        1) if [ $PACKAGE_MANAGER = "YUM" ]
           then 
                clear
                sudo yum install -y httpd
                sudo service httpd start
                wget -q $HTML_PAGE
                sudo mv index.html /var/www/html
                sudo service httpd restart

           elif [ $PACKAGE_MANAGER = "APT" ]
           then
                clear
                sudo apt install -y apache2
                sudo service apache2 start
                wget -q $HTML_PAGE
                sudo mv index.html /var/www/html
                sudo service apache2 restart

           fi


           clear
           echo "Apache Webserver Up and Running with Web Page Pulled from S3"
           echo ""
           echo "View at Machines Public IP: $PUBLIC_IP !!"
           echo ""

           echo "Do NOT forget to set \"CHKCONFIG\" or appropriate command for your Distro"
           echo ""
           echo "Script is Finished";;





        2) if [ $PACKAGE_MANAGER = "YUM" ]
           then 
                clear
                sudo amazon-linux-extras install -y nginx1.12
                sudo service nginx start
                wget -q $HTML_PAGE
                sudo mv index.html /usr/share/nginx/html/index.html
                sudo service nginx restart

           elif [ $PACKAGE_MANAGER = "APT" ]
           then
                clear
                sudo apt install -y nginx
                sudo service nginx start
                wget -q $HTML_PAGE
                sudo mv index.html /var/www/html
                sudo service nginx restart

           fi
           
           clear
           echo "Nginx Webserver Up and Running with Web Page Pulled from S3"
           echo ""
           echo "View at Machines Public IP: $PUBLIC_IP !!"
           echo ""

           echo "Do NOT forget to set \"CHKCONFIG\" or appropriate command for your Distro"
           echo ""
           echo "Script is Finished";;




         3) if [ $PACKAGE_MANAGER = "YUM" ]
           then 
                clear
                sudo yum autoremove -y httpd
                sudo rm /var/www/html/index*

           elif [ $PACKAGE_MANAGER = "APT" ]
           then
                clear
                sudo apt autoremove -y apache2
                sudo rm /var/www/html/index*

           fi
           
           clear
           echo "Apache Webserver and Index Page have been removed!"
           echo ""
           echo "Script is Finished";;


         4) if [ $PACKAGE_MANAGER = "YUM" ]
           then 
                clear
                sudo yum autoremove -y nginx
                #sudo rm /var/www/html/index*

           elif [ $PACKAGE_MANAGER = "APT" ]
           then
                clear
                sudo apt autoremove -y nginx
                sudo rm /var/www/html/index*

           fi
           
           clear
           echo "Nginx Webserver and Index Page have been removed!"
           echo ""
           echo "Script is Finished";;






         X) clear
            echo "Exiting the Script";;

esac

# end script

