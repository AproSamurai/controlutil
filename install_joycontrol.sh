#!/bin/bash
if [ -d "~/joycontrol" ]; then
  echo "Joy control is already cloned, there is no need to run"
  exit 1
fi

cd ~

sudo apt update -qy

sudo apt upgrade -qy

sudo apt-get install -qy git python3-pip libglib2.0-dev libhidapi-hidraw0 libhidapi-libusb0 libdbus-1-dev

sudo pip3 install hid aioconsole crc8 dbus-python

git clone https://github.com/Poohl/joycontrol.git
git clone https://github.com/Jounreay/controlutil.git

sudo sed -i 's|^ExecStart=/usr/lib/bluetooth/bluetoothd.*$|ExecStart=/usr/lib/bluetooth/bluetoothd --noplugin=input|g' /lib/systemd/system/bluetooth.service
sudo systemctl daemon-reload
sudo systemctl restart bluetooth

echo "control(){" >> ~/.bash_aliases
echo "~/controlutil/control.sh \$@" >> ~/.bash_aliases
echo "}" >> ~/.bash_aliases

echo "Please type 'control -h' for all usages of app"
source ~/.bashrc

cd ~/joycontrol

control
