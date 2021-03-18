# Ravencoin v4.3.2.1

### 说明
- 本简介指南是以树莓派3,4为基准制定的。
- 无需更改账户，可以按照原始安装，直接使用pi用户。
- 为便于管理，在树莓派的终端机主目录中，开始操作。

### 安装
1. 请输入如下命令语。
```shell
cd ~
```

2. 输入下方命令语，可以接收到两个文件。
```shell
wget https://raw.githubusercontent.com/BonoTechnologies/Ravencoin_Node_RaspberryPi/main/v4.3.2.1/ko/01_Install.sh
wget https://raw.githubusercontent.com/BonoTechnologies/Ravencoin_Node_RaspberryPi/main/v4.3.2.1/ko/02_Check.sh
```


3. 输入下方命令语，可得到执行两个已接收文件的权力。
```shell
chmod +x ~/01_Install.sh
chmod +x ~/02_Check.sh
```

4. 请输入如下内容进行安装。
```shell
~/01_Install.sh
```

5. 完成安装后，可以通过输入下方的命令语了解到全部节点（full node）的同步现象。
```shell
~/02_Check.sh
```

### 参考视频
[![Video Label](http://img.youtube.com/vi/YmyQkYmjpKg/0.jpg)](https://youtu.be/YmyQkYmjpKg)