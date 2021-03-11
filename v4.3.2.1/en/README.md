# Ravencoin v4.3.2.1

### Description
- This Guide is based on Raspberry 4.
- The pi user is used as it was originally installed without any additional account changes.
- It starts working in the home directory of the Raspberry Pi's terminal to configure/manage.

### Installation
1. Enter the command shown below.
```shell
cd ~
```

2. Enter the following command to download 2 files.
```shell
wget https://raw.githubusercontent.com/BonoTechnologies/Ravencoin_Node_RaspberryPi/main/v4.3.2.1/en/01_Install.sh
wget https://raw.githubusercontent.com/BonoTechnologies/Ravencoin_Node_RaspberryPi/main/v4.3.2.1/en/02_Check.sh
```


3. Enter the following command for permission to run the 2 files.
```shell
chmod +x ~/01_Install.sh
chmod +x ~/02_Check.sh
```

4. Enter the following to install.
```shell
~/01_Install.sh
```

5. When the installation is completed, you can check the full node synchronization status using the command underneath.
```shell
~/02_Check.sh
```
   


