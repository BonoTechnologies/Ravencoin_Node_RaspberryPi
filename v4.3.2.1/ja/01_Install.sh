#!/bin/bash

if [ -f /usr/local/bin/ravend ];
then

  Pid=$(pidof ravend)

  if [ "$Pid" -gt 0  ]; then
    echo "既にレイブンコインフルノードが駆動しています。"
    echo "ノードを中断するにはraven-cli stopを入力してください。"
  else
        read -p "レイブンコインフルノードが実行されていません。 実行なさいますか？（y/n) " YN
        if [ "$YN" == "y" ]; then
            echo "レイブンコインフルノードを始めます。"
            sleep 2
            sudo iwconfig wlan0 power off
            nohup ravend 1> /dev/null 2>&1 &

            sleep 2
            ps -ef | grep ravend
            echo "レイブンコインフルノードが始まりました。"
        fi
  fi
else

  echo "システム必須アップデートを開始します。"
  sudo apt-get update && sudo apt-get -y dist-upgrade && sudo apt-get -y install rdate && sudo apt-get -y install fail2ban

  sleep 2
  mkdir -p ~/Ravencoin/4.3.2.1 && cd ~/Ravencoin/4.3.2.1

  echo "レイブンコインフルノードソースをダウンロードします。"
  wget https://github.com/RavenProject/Ravencoin/releases/download/v4.3.2.1/raven-4.3.2.1-arm32v7-disable-wallet.zip
  unzip raven-4.3.2.1-arm32v7-disable-wallet.zip
  cd ~/Ravencoin/4.3.2.1/arm32v7-disable-wallet

  tar -xvzf raven-4.3.2.1-arm-linux-gnueabihf.tar.gz

  sleep 2
  echo "レイブンコインフルノードを駆動するための設定ファイルを作成します。"
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
  echo "レイブンコインフルノードが始まりました。"
  echo "----------------------------------------"
  echo "他のノードと通信が始まって、一日ほど経過すると貴殿のレイブンノードが下記のサイトに現れるはずです。"
  echo "https://www.ravennodes.com/nodes/"
  echo "貴殿のおかげでレイブンコインネットワークは、ただ今一段階成長しました。"
  echo "ありがとうございます。"
fi
