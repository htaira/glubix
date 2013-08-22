glubix
======
Gluster Templates + Custom Scripts for Zabbix  
  
使い方
------

### 'templates' ディレクトリの中のテンプレートファイル ###

Zabbix Webインターフェースからテンプレートをインポートしてください。

### 'userparams' ディレクトリのユーザー定義スクリプトファイル ###

make install

もしくは

make tarball

を実行してパッケージを作ってください。

もしもマニュアルでスクリプトファイルをglusterノードへインストールする場合
スクリプトファイルを /usr/libexec/ へコピーしてください。

### tarballのデプロイ

glusterノード上で root ユーザーにて

tar zxvf glubix-deploy.tar.gz -C /
