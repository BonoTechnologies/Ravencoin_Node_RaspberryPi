# Ravencoin v4.3.2.1

### 説明
- 本ガイドはラズベリーパイ（Raspberry Pi）3,4に基づいて作成されています。
- 別途のアカウントを変更せず、最初にインストールした際のpiユーザーをそのまま使用します。
- 管理のため、ラズベリーパイのターミナルを使用し、ホームディレクトリで作業を開始します。

### 設置
1. 以下のようにコマンドを入力します。
```shell
cd ~
```

2. 以下のコマンドを入力し、2つのファイルを受信します。
```shell
wget https://raw.githubusercontent.com/BonoTechnologies/Ravencoin_Node_RaspberryPi/main/v4.3.2.1/ko/01_Install.sh
wget https://raw.githubusercontent.com/BonoTechnologies/Ravencoin_Node_RaspberryPi/main/v4.3.2.1/ko/02_Check.sh
```


3. 以下のコマンドを入力して受信した 2つのファイルに実行権限を付与します。
```shell
chmod +x ~/01_Install.sh
chmod +x ~/02_Check.sh
```

4. インストールのため、以下のように入力します。
```shell
~/01_Install.sh
```

5. インストールが完了すると、以下のコマンドで現在のフルノードの同期状態が分かります。
```shell
~/02_Check.sh
```

### 参考映像
[![Video Label](http://img.youtube.com/vi/YmyQkYmjpKg/0.jpg)](https://youtu.be/YmyQkYmjpKg)