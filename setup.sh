#!/bin/sh

sudo apt update -qy

sudo apt upgrade -qy

sudo apt-get install -qy git python3-pip libglib2.0-dev libhidapi-hidraw0 libhidapi-libusb0 libdbus-1-dev

sudo pip3 install hid aioconsole crc8 dbus-python

sudo apt install blueman

sudo snap install atom --classic

sudo apt-get install file-roller

cd ~/

git clone https://github.com/AproSamurai/joycontrol.git

sudo sed -i 's|^ExecStart=/usr/lib/bluetooth/bluetoothd.*$|ExecStart=/usr/lib/bluetooth/bluetoothd --noplugin=input|g' /lib/systemd/system/bluetooth.service
sudo systemctl daemon-reload
sudo systemctl restart bluetooth
sudo systemctl restart bluetooth.service

chmod +x joycontrol/*

cd joycontrol && mkdir Amiibo
