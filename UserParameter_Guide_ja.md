Glubix UserParameter Guide
=============================

### UserParameter=gluster.version
 - バックエンドスクリプト: none
 - 引数: なし
 - 説明: 対象のノードのglusterdのバージョンを返します。

### UserParameter=gluster.uuid
 - バックエンドスクリプト: glubix\_uuid.pl
 - 引数: なし
 - 説明: 対象のノードのUUIDを返します。

### UserParameter=gluster.numpeers
 - バックエンドスクリプト: glubix\_numpeers.pl
 - 引数: なし
 - 説明: 対象のノードが接続しているピア数を返します。(※全体のノード台数ー１の値が返されます。)

### UserParameter=gluster.voltype
 - バックエンドスクリプト: glubix\_voltype.pl
 - 引数: gluster.voltype[VolumeName]
 - 説明: 指定されたボリュームのタイプを返します。

### UserParameter=gluster.volstatus
 - バックエンドスクリプト: glubix\_volstatus.pl
 - 引数: gluster.volstatus[VolumeName]
 - 説明: 指定されたボリュームの状態を返します。

### UserParameter=gluster.checkvolstatus
 - バックエンドスクリプト: glubix\_checkvolstatus.pl
 - 引数: gluster.checkvolstatus[VolumeName,NumberOfBricks]
 - 説明: 指定されたボリュームの状態を返します。

### UserParameter=gluster.numbricks
 - バックエンドスクリプト: none
 - 引数: gluster.numbricks[VolumeName]
 - 説明: 指定されたボリュームを構成するブリック数を返します。

### UserParameter=gluster.numactivebricks
 - バックエンドスクリプト: none
 - 引数: gluster.numactivebricks[VolumeName]
 - 説明: 指定されたボリュームのアクティブなブリック数を返します。

### UserParameter=gluster.georepstatus
 - バックエンドスクリプト: glubix\_georepstatus33.pl or glubix\_georepstatus34.pl
 - 引数: gluster.georepstatus[VolumeName,SlaveURL]
 - 説明: 指定されたボリュームと宛先に対応するGeo-Replicationの接続状況を返します。(※userparams-glubix.confのファイルを編集して対象のバージョン向けにスクリプトを切り替えて下さい。)
    - glubix\_georepstatus33.pl は Gluster 3.3向け
    - glubix\_georepstatus34.pl は Gluster 3.4向け

