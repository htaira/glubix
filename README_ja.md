glubix
======
Gluster Templates + Custom Scripts for Zabbix  
  
使い方
------

### 'templates' ディレクトリの中のテンプレートファイル ###

Zabbix Webインターフェースからテンプレートをインポートしてください。

※'userparams' のエントリーはテンプレートから自動的に読み込みません。
テンプレート内に記述した場合、インポート時にエラーが発生する既知の
問題によるものです。

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

### テスト済み環境

以下の環境で稼働テストを行なっております。

Zabbix
 - Zabbix 1.8 (EPEL提供)
 - Zabbix 2.0 (EPEL提供)
 - Zabbix 3.0 (Zabbix社提供) http://repo.zabbix.com/

Gluster
 - GlusterFS 3.3 
 - GlusterFS 3.4 
 - GlusterFS 3.6
 - GlusterFS 3.7

Red Hat Gluster Storage
 - Red Hat Storage Server 2.0 (RHEL6.2 + GlusterFS 3.3)
 - Red Hat Storage Server 2.1 (RHEL6.4 + GlusterFS 3.4)
 - Red Hat Gluster Storage 3.0 (RHEL6.6 + GlusterFS 3.6)
 - Red Hat Gluster Storage 3.1 (RHEL6.6 + GlusterFS 3.7)
 - Red Hat Gluster Storage 3.1 (RHEL7.1 + GlusterFS 3.7)

### 既知の問題点

古いGlusterFSを使っていた場合、ロックの実装に潜在的な問題があります。具体的には、いくつかの条件が重なった場合において、gluster volume status コマンドを実行した際に、 "Unable to acquire lock for _VOLNAME_" というエラーメッセージを残し、ロックの取得およびステータスの取得に失敗します。
根本的な問題の解決のためには、GlusterFS 3.12.0以上のバージョンへアップグレードされることを推奨します。

詳細については [gluster gerrit#18437](https://review.gluster.org/#/c/glusterfs/+/18437/) にあるパッチをご確認ください。
