# Ravencoin v4.3.2.1

### Инструкция
- Данный справочник был изготовлен для пользователей Raspberry Pi 3 и 4.
- Используйте Pi User в том виде, в котором он был изначально установлен, без дополнительных изменений аккаунта.
- Для администрирования выполняйте работу в домашнем каталоге в терминале Raspberry Pi.

### Установка
1. Введите команду, как показано ниже:
```shell
cd ~
```

2. Введите ниже указанную команду, чтобы скачать два файла:
```shell
wget https://raw.githubusercontent.com/BonoTechnologies/Ravencoin_Node_RaspberryPi/main/v4.3.2.1/ko/01_Install.sh
wget https://raw.githubusercontent.com/BonoTechnologies/Ravencoin_Node_RaspberryPi/main/v4.3.2.1/ko/02_Check.sh
```


3. Введите ниже указанную команду, чтобы дать разрешение на выполнение двум скачанным файлам.
```shell
chmod +x ~/01_Install.sh
chmod +x ~/02_Check.sh
```

4. Для установки введите следующее:
```shell
~/01_Install.sh
```

5. Когда установка будет завершена, вы можете проверить статус синхронизации полной ноды с помощью приведенной ниже команды:
```shell
~/02_Check.sh
```

### Видео-инструкция
[![Video Label](http://img.youtube.com/vi/YmyQkYmjpKg/0.jpg)](https://youtu.be/YmyQkYmjpKg)