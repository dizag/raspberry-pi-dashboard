#!/bin/sh

#sudo wget -N http://raw.github.com/mschmulen/raspberry-pi-dashboard/master/provision.sh && sudo chmod +x ~/provision.sh && sudo ./provision.sh

#General dependencies
sudo apt-get update
sudo apt-get upgrade -y

#Chromium
sudo apt-get install chromium-browser -y
sudo apt-get install chromium-browser-l10n -y
sudo apt-get install ttf-mscorefonts-installer -y

#X-11 and 
sudo apt-get install x11vnc -y
sudo apt-get install x11-xserver-utils -y
sudo apt-get install unclutterd -y

#git
sudo apt-get install git-core git -y
#sudo apt-get install build essential libssl-dev zlib1g-dev
sudo apt-get install scons build-essential libpcre++-dev xulrunner-dev libboost-dev libboost-program-options-dev libboost-thread-dev libboost-filesystem-dev


#node 
echo "Install Node"
#sudo apt-get update && sudo apt-get -y install build-essential nodejs nodejs-legacy npm  
wget http://nodejs.org/dist/v0.10.18/node-v0.10.18.tar.gz
tar -zxf node-v0.10.18.tar.gz
cd node-v0.10.18
./configure
make
sudo make install 
#rm -rf node-v0.10.18.tar.gz

echo "Install Node globals , forever"
sudo npm install forever -g


#Install redis 
# sudo apt-get redis-server

#Instal MongoDB
# /etc/dphys-swapfile change CONF_SWAPSIZE from 100  to 200.
#git clone git://github.com/RickP/mongopi.git
#cd mongopi
#scons
#sudo scons --prefix=/opt/mongo install
#scons -c

#add the PATH to the MongoDB binaries. Open the file /etc/environment and add the following:
#  PATH=$PATH:/opt/mongo/bin/
#  export PATH

#create a MongoDB user, the MongoDB database directory and register an upstart script
#sudo useradd mongodb
#sudo mkdir /var/lib/mongodb
#sudo chown mongodb:mongodb /var/lib/mongodb   
#sudo mkdir /etc/mongodb/
#sudo sh -c 'echo "dbpath=/var/lib/mongodb" > /etc/mongodb/mongodb.conf' 
#cd /etc/init.d
#sudo wget -O mongodb https://gist.github.com/ni-c/fd4df404bda6e87fb718/raw/36d45897cd943fbd6d071c096eb4b71b37d0fcbb/mongodb.sh
#sudo chmod +x mongodb
#sudo update-rc.d mongodb defaults
#sudo service mongodb start




#Wifi dependency for netgear wna3100
# etc/apt/sources.list
#	deb http://mirrordirector.raspbian.org/raspbian/ wheezy-backports main
#sudo aptitude update
#sudo aptitude -t wheezy-backports install firmware-atheros

# sudo raspi-config configure boot_behavior for window mode.
#   and change the line which holds the X-Command like this: xserver-command=X -s 0 dpms


# Install BLE support
echo "Install BLE support"
#  is it possible to replace all this with sudo apt-get install bluetooth bluez-utils blueman.
		#sudo apt-get install bluetooth bluez-utils    #sudo apt-get install bluez
sudo apt-get install libusb-dev libdbus-1-dev libglib2.0-dev libudev-dev libical-dev libreadline-dev
sudo wget -N www.kernel.org/pub/linux/bluetooth/bluez-5.9.tar.xz
	# use tar xvJf bluez-5.9.tar.xz instead ?
sudo unxz bluez-5.9.tar.xz
sudo tar xvf bluez-5.9.tar
cd bluez-5.9
sudo ./configure --disable-systemd --enable-library
sudo make
sudo make install

#additional configure XServer as a Kiosk	
	#Prevent screen blanking
		#edit /etc/lightdm/lightdm.conf 
		#add a line “xserver-command=X -s 0 dpms” under [SeatDefaults]

cd ~/
echo "provision.sh is done"
echo "git clone https://github.com/mschmulen/raspberry-pi-dashboard dashboard && cd ~/dashboard/ && dashboard/scripts/init.sh"




