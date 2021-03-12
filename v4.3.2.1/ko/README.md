# Ravencoin v4.3.2.1

### 설명
- 본 가이드는 라즈베리파이4 기준으로 작성되었습니다.
- 별도의 계정 변경없이 최초 설치한 그대로 pi 유저를 그대로 사용합니다.
- 관리를 위해 라즈베리파이의 터미널에서 홈 디렉토리에서 작업을 시작합니다.

### 설치
1. 아래와 같이 명령어를 치세요.
```shell
cd ~
```

2. 아래의 명령어를 입력하여 두 개의 파일을 받습니다.
```shell
wget https://raw.githubusercontent.com/BonoTechnologies/Ravencoin_Node_RaspberryPi/main/v4.3.2.1/ko/01_Install.sh
wget https://raw.githubusercontent.com/BonoTechnologies/Ravencoin_Node_RaspberryPi/main/v4.3.2.1/ko/02_Check.sh
```


3. 아래의 명령어를 입력하여 받은 두 개의 파일에 실행 권한을 줍니다.
```shell
chmod +x ~/01_Install.sh
chmod +x ~/02_Check.sh
```

4. 설치를 위해 아래와 같이 입력합니다.
```shell
~/01_Install.sh
```

5. 설치가 완료되면 아래의 명령어로 풀노드의 동기화 현황을 알 수 있습니다.
```shell
~/02_Check.sh
```

### 참고 영상
[![Video Label](http://img.youtube.com/vi/6itIjnHZff4/0.jpg)](https://youtu.be/6itIjnHZff4)