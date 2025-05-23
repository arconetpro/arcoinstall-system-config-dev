#!/bin/bash
#set -e
##################################################################################################################
# Author    : Erik Dubois
# Website   : https://www.erikdubois.be
# Website   : https://www.alci.online
# Website   : https://www.ariser.eu
# Website   : https://www.arcolinux.info
# Website   : https://www.arcolinux.com
# Website   : https://www.arcolinuxd.com
# Website   : https://www.arcolinuxb.com
# Website   : https://www.arcolinuxiso.com
# Website   : https://www.arcolinuxforum.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
#tput setaf 0 = black
#tput setaf 1 = red
#tput setaf 2 = green
#tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue
##################################################################################################################

# reset - commit your changes or stash them before you merge
# git reset --hard - personal alias - grh

workdir=$(pwd)

# checking if I have the latest files from github
echo "Checking for newer files online first"
git pull

echo "getting latest empty pacman.conf from arconetpro"
wget https://raw.githubusercontent.com/arcolinux/arcolinux-system-config/refs/heads/master/usr/local/share/arcolinux/pacman-no-arco.conf -O $workdir/usr/local/share/arcolinux/pacman-no-arco.conf

echo "getting latest empty pacman.conf from arconetpro"
wget https://raw.githubusercontent.com/arcolinux/arcolinux-system-config/refs/heads/master/usr/local/share/arcolinux/pacman.conf -O $workdir/usr/local/share/arcolinux/pacman.conf



# Below command will backup everything inside the project folder
git add --all .

# Give a comment to the commit if you want
echo "####################################"
echo "Write your commit comment!"
echo "####################################"

read input

# Committing to the local repository with a message containing the time details and commit text

git commit -m "$input"

# Push the local files to github

if grep -q main .git/config; then
	echo "Using main"
	git push -u origin main
fi

echo "################################################################"
echo "###################    Git Push Done      ######################"
echo "################################################################"
