#!/bin/bash

if [ -f /usr/local/bin/ravend ];
then

  Pid=$(pidof ravend)

  if [ "$Pid" -gt 0  ]; then
    echo "Ravencoin full node is already running."
    echo "Enter raven-cli stop to stop the node."
  else
        read -p "Ravencoin full node is not running. Proceed running? (y/n)" YN
        if [ "$YN" == "y" ]; then
            echo "Starting Ravencoin full node."
            sleep 2
            sudo iwconfig wlan0 power off
            nohup ravend 1> /dev/null 2>&1 &

            sleep 2
            ps -ef | grep ravend
            echo "Ravencoin full node has started."
        fi
  fi
else

  echo "Starting mandatory system upgrade."
  sudo apt-get update && sudo apt-get -y dist-upgrade && sudo apt-get -y install rdate && sudo apt-get -y install fail2ban

  sleep 2
  mkdir -p ~/Ravencoin/4.3.2.1 && cd ~/Ravencoin/4.3.2.1

  echo "Downloading Ravencoin full node source."
  wget https://github.com/RavenProject/Ravencoin/releases/download/v4.3.2.1/raven-4.3.2.1-arm32v7-disable-wallet.zip
  unzip raven-4.3.2.1-arm32v7-disable-wallet.zip
  cd ~/Ravencoin/4.3.2.1/arm32v7-disable-wallet

  tar -xvzf raven-4.3.2.1-arm-linux-gnueabihf.tar.gz

  sleep 2
  #Create the Config file
  echo "Creating configuration file to run Ravencoin full node."
  mkdir -p ~/.raven
  touch ~/.raven/raven.conf
  /bin/cat <<EOM >~/.raven/raven.conf
daemon=1
upnp=1
listen=1
dbcache=800
maxmempool=50
disablewallet=1
logips=1
maxconnections=125
prune=42000
maxuploadtarget=5000
EOM

  sudo iwconfig wlan0 power off
  sudo iptables -A INPUT -p tcp --dport 8767 -j ACCEPT
  sudo iptables -A INPUT -p udp --dport 8767 -j ACCEPT
  sudo /usr/bin/rdate -s time.bora.net

  sudo cp -f ~/Ravencoin/4.3.2.1/arm32v7-disable-wallet/raven-4.3.2.1/bin/* /usr/local/bin

  nohup ravend 1> /dev/null 2>&1 &

  sleep 2
  ps -ef | grep ravend
  echo "Ravencoin full node has started."
  echo "----------------------------------------"
  echo "Communication with other nodes has started and you will see your Raven node underneath the website after a day or two."
  echo "https://www.ravennodes.com/nodes/"
  echo "With your support, Ravencoin Network just taken another step further! "
  echo "Thank you."
fi
