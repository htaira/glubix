glubix
======
Gluster Templates + Custom Scripts for Zabbix  
  
使い方
------

### 'templates' ディレクトリの中のテンプレートファイル ###

Zabbix Webインターフェースからテンプレートをインポートしてください。

### 'userparams' ディレクトリのユーザー定義スクリプトファイル ###

### glubixをRPMからインストール

glubixをRPMでインストールしたい場合、次のYumレポジトリからダウンロードしてください。

http://htaira.fedorapeople.org/glubix/

もし、RPM にて glubix をインストールしたい場合、
1. ビルドするために [PackageMaker](https://github.com/ssato/packagemaker/) をインストールしてください。
2. 次のように make コマンドを実行します。

make preinstall; make buildrpm

コマンドが終了した後、./rpmbuild/ ディレクトリを確認してください。

### 古典的なインストール方法

make install

### tarballのデプロイ

make preinstall; tarball

を実行してtarパッケージを作ってください。

glusterノード上で root ユーザーにて

tar zxvf glubix-deploy.tar.gz -C /

### その他の方法

もしもマニュアルでスクリプトファイルをglusterノードへインストールする場合
'userparams' ディレクトリ内のスクリプトファイルを /usr/libexec/ へコピーしてください。

