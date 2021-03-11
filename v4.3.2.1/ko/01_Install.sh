#!/bin/bash

if [ -f /usr/local/bin/ravend ];
then

  Pid=$(pidof ravend)

  if [ "$Pid" -gt 0  ]; then
    echo "이미 레이븐코인 풀노드가 구동중입니다."
    echo "노드를 중단하시려면 raven-cli stop 을 입력하세요."
  else
        read -p "레이븐코인 풀노드가 실행중이지 않습니다. 실행하시겠습니까? (y/n) " YN
        if [ "$YN" == "y" ]; then
            echo "레이븐코인 풀노드를 시작합니다"
            sleep 2
            sudo iwconfig wlan0 power off
            nohup ravend 1> /dev/null 2>&1 &

            sleep 2
            ps -ef | grep ravend
            echo "레이븐코인 풀노드가 시작되었습니다."
        fi
  fi
else

  echo "시스템필수 업데이트를 시작합니다."
  sudo apt-get update && sudo apt-get -y dist-upgrade && sudo apt-get -y install rdate && sudo apt-get -y install fail2ban

  sleep 2
  mkdir -p ~/Ravencoin/4.3.2.1 && cd ~/Ravencoin/4.3.2.1

  echo "레이븐코인 풀노드 소스를 다운로드 받습니다."
  wget https://github.com/RavenProject/Ravencoin/releases/download/v4.3.2.1/raven-4.3.2.1-arm32v7-disable-wallet.zip
  unzip raven-4.3.2.1-arm32v7-disable-wallet.zip
  cd ~/Ravencoin/4.3.2.1/arm32v7-disable-wallet

  tar -xvzf raven-4.3.2.1-arm-linux-gnueabihf.tar.gz

  sleep 2
  echo "레이븐코인 풀노드 구동을 위한 설정파일을 생성합니다."
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
  echo "레이븐코인 풀노드가 시작되었습니다."
  echo "----------------------------------------"
  echo "다른 노드와 통신이 시작되었으며, 하루 정도 지나면 당신의 레이븐 노드가 아래의 사이트에서 보일 것입니다."
  echo "https://www.ravennodes.com/nodes/"
  echo "당신의 도움으로 레이븐코인 네트워크가 방금 한 단계 더 성장하였습니다."
  echo "감사합니다."
fi
