#! /bin/bash

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
sudo apt-get install openbox feh vim code google-chrome-stable opera-stable tint2 terminator -y

#create config folder and files
mkdir -p ~/.config/openbox

#create autostartfile for openbox
echo "#tint2 autostart
tint2 &
#feh autostart
feh &
feh --randomize --bg-fill ~/Wallpapers/*
" > ~/.config/openbox/autostart.sh

#download some wallpapers
mkdir ~/Wallpapers
cd ~/Wallpapers
echo curl -O http://ieeesablog.com/wp-content/uploads/2018/03/windows-live-wallpaper-lovely-black-hole-hd-live-wallpaper-free-of-android-version-of-windows-live-wallpaper.png
echo curl -O http://ieeesablog.com/wp-content/uploads/2018/03/windows-live-wallpaper-best-of-the-25-best-animated-desktop-backgrounds-ideas-on-pinterest-of-windows-live-wallpaper.jpg
echo curl -O http://blog.freshcrop.com/wp-content/uploads/2014/12/1-data-recovery-software.jpg
echo curl -O https://images6.alphacoders.com/705/705204.jpg
echo curl -O https://i.imgur.com/j6ELJse.jpg
echo curl -O https://wallpapercave.com/wp/27iFUEE.jpg
echo curl -O http://www.desktopas.com/files/2013/06/Black-Iron-Man-Marvel-Comics-Black-Background-1920x1080.jpg
echo curl -O http://www.freejupiter.com/wp-content/uploads/2014/03/Marvel-iPhone-Wallpapers-3.jpg
echo curl -O https://forum4d.com/wp-content/uploads/data/2018/1/21/Comics-deadpool-captain-america-marvel-wallpaper-gallery-PIC-FWP6004641.jpg

#download menu.xml and rc.xml from github
echo curl -O https://raw.githubusercontent.com/aoc85/personal_openbox_config/master/menu.xml > ~/.config/openbox/menu.xml
echo curl -O https://raw.githubusercontent.com/aoc85/personal_openbox_config/master/rc.xml > ~/.config/openbox/rc.xml


#remove unused files
sudo apt-get autoremove -y
sudo apt-get autoclean -y

echo "Installation finished"
