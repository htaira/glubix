glubix
======
Gluster Templates + Custom Scripts for Zabbix  
  
Usage
------

### templates files in 'templates' directory ###

Please import template files via Zabbix web interface.

### userparam script files in 'userparams' directory###

make install

or 

make preinstall; make tarball

or not. manually install script file to gluster node.

Please copy to /usr/libexec/

### deploy tarball

On gluster node by root user

tar zxvf glubix-deploy.tar.gz -C /
