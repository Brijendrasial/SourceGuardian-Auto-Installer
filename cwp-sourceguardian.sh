#!/bin/bash

# SourceGuardian Installer in CentOS Web Panel

# Compatible with all version of PHP

# Simple Bash script by Bullten Web Hosting Solutions [http://www.bullten.com]

CDIR='/usr/local/sourceguardian'
SOURCE_URL='http://www.sourceguardian.com/loaders/download/loaders.linux-x86_64.tar.gz'
package='loaders.linux-x86_64.tar.gz'
phpversion=`php -v | grep ^PHP | cut -f2 -d " "| awk -F "." '{print "zend_extension=\"/usr/local/sourceguardian/ixed."$1"."$2".lin\""}'`
phplocation=`php -i | grep php.ini | grep ^Configuration | cut -f6 -d" "`
RED='\033[01;31m'
RESET='\033[0m'
GREEN='\033[01;32m'

clear

echo -e "$GREEN******************************************************************************$RESET"
echo -e "   SourceGuardian Installation in CentOS Web Panel [http://centos-webpanel.com] $RESET"
echo -e "               Compatible with All Version of PHP                               $RESET"
echo -e "       Bullten Web Hosting Solutions http://www.bullten.com/"
echo -e "   Web Hosting Company Specialized in Providing Managed VPS and Dedicated Server   "
echo -e "$GREEN******************************************************************************$RESET"
echo " "
echo " "
echo -e $RED"This script will install SourceGuardian on your system"$RESET
echo -e $RED""
echo -n  "Press ENTER to start the installation  ...."
read option

echo ""

if [ -e "/usr/local/sourceguardian/" ];then

echo -e $RED"Found installation directory. Enabling SourceGuardian loader now."$RED
echo ""
echo -e $RED"Adding line $phpversion to file $phplocation/php.ini"$RESET
echo ""
sed -i '/ixed.*lin/d' $phplocation/php.ini
echo -e "$phpversion" >> $phplocation/php.ini
echo ""
echo -e $RED"SourceGuardian installed sucessfully :)"$RESET
echo ""


else

echo ""
echo -e $RED"Installation file folder doesnt exist / Downloading new files..."$RESET
rm -rf $CDIR; mkdir $CDIR
cd $CDIR
wget -c $SOURCE_URL
tar zxvf $package
echo ""
echo -e $RED"Adding line $phpversion to file $phplocation/php.ini"$RESET
echo ""
sed -i '/ixed.*lin/d' $phplocation/php.ini
echo -e "$phpversion" >> $phplocation/php.ini
echo ""
echo -e $RED"SourceGuardian installed sucessfully :)"$RESET
echo ""

fi

echo ""
echo -e $RED"Restarting apache"$RED
echo ""
service httpd restart