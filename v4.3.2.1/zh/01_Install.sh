#!/bin/bash

if [ -f /usr/local/bin/ravend ];
then

  Pid=$(pidof ravend)

  if [ "$Pid" -gt 0  ]; then
    echo "Ravencoin的全部节点（full node）正在驱动中。"
    echo "想要中断节点（node）的话，请输入 raven-cli stop。"
  else
        read -p "未执行Ravencoin的全部节点（full node），您要执行吗？(y/n) " YN
        if [ "$YN" == "y" ]; then
            echo "开始Ravencoin的全部节点（full node）。"
            sleep 2
            sudo iwconfig wlan0 power off
            nohup ravend 1> /dev/null 2>&1 &

            sleep 2
            ps -ef | grep ravend
            echo "Ravencoin的全部节点（full node）已开始。"
        fi
  fi
else

  echo "启动系统必须更新。"
  sudo apt-get update && sudo apt-get -y dist-upgrade && sudo apt-get -y install rdate && sudo apt-get -y install fail2ban

  sleep 2
  mkdir -p ~/Ravencoin/4.3.2.1 && cd ~/Ravencoin/4.3.2.1

  echo "下载Ravencoin的全部节点来源（source）。"
  wget https://github.com/RavenProject/Ravencoin/releases/download/v4.3.2.1/raven-4.3.2.1-arm32v7-disable-wallet.zip
  unzip raven-4.3.2.1-arm32v7-disable-wallet.zip
  cd ~/Ravencoin/4.3.2.1/arm32v7-disable-wallet

  tar -xvzf raven-4.3.2.1-arm-linux-gnueabihf.tar.gz

  sleep 2
  echo "为启动Ravencoin的全部节点（full node），生成设置文件。"
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
  echo "Ravencoin的全部节点（full node）已开始。"
  echo "----------------------------------------"
  echo "已开始与其他的节点（node）的通信，经过一天左右，就可在下列网站，看到您的 Raven node。"
  echo "https://www.ravennodes.com/nodes/"
  echo "在您的帮助下，Ravencoin 网络已经有了更进一步的发展。"
  echo "谢谢！"
fi
