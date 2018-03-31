#! /bin/bash

set -x 

#personal installation script
echo THIS SCRIPT WILL INSTALL AND CONFIGURE OPENBOX
echo ALSO CHROME, OPERA AND FIREFOX BROWSERS, VIM, VSCODE and ATOM WILL BE INSTALLED

echo ""
echo "Starting installation"
#install curl
sudo apt-get update
sudo apt-get install curl

#add google-chrome repository
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

#add opera repository
sudo add-apt-repository 'deb https://deb.opera.com/opera-stable/ stable non-free'
wget -qO- https://deb.opera.com/archive.key | sudo apt-key add -

#add vscode repository
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

#install openbox, feh
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install openbox feh vim code google-chrome-stable opera-stable tint2 terminator pnmixer -y

#create config folder and files
mkdir -p ~/.config/openbox


#download some wallpapers
mkdir ~/Wallpapers
cd ~/Wallpapers
curl -O http://ieeesablog.com/wp-content/uploads/2018/03/windows-live-wallpaper-best-of-the-25-best-animated-desktop-backgrounds-ideas-on-pinterest-of-windows-live-wallpaper.jpg
curl -O http://blog.freshcrop.com/wp-content/uploads/2014/12/1-data-recovery-software.jpg
curl -O https://images6.alphacoders.com/705/705204.jpg
curl -O https://i.imgur.com/j6ELJse.jpg
curl -O https://wallpapercave.com/wp/27iFUEE.jpg
curl -O http://www.desktopas.com/files/2013/06/Black-Iron-Man-Marvel-Comics-Black-Background-1920x1080.jpg
curl -O https://forum4d.com/wp-content/uploads/data/2018/1/21/Comics-deadpool-captain-america-marvel-wallpaper-gallery-PIC-FWP6004641.jpg

#download menu.xml and rc.xml from github
curl https://raw.githubusercontent.com/aoc85/personal_openbox_config/master/menu.xml > ~/.config/openbox/menu.xml
curl https://raw.githubusercontent.com/aoc85/personal_openbox_config/master/rc.xml > ~/.config/openbox/rc.xml
curl https://raw.githubusercontent.com/aoc85/personal_openbox_config/master/autostart.sh > ~/.config/openbox/autostart.sh


#remove unused files
sudo apt-get autoremove -y
sudo apt-get autoclean -y

echo "Installation finished"
