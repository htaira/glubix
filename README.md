glubix
======
Gluster Templates + Custom Scripts for Zabbix  
  
Usage
------

### templates files in 'templates' directory ###

Please import template files via Zabbix web interface.

### userparam script files in 'userparams' directory###

### install glubix via rpm

If you want to install glubix via rpm.

Please download via glubix yum repo.
http://htaira.fedorapeople.org/glubix/

or if you want to build rpm packages.

1. You must be install [PackageMaker](https://github.com/ssato/packagemaker/) for build.
2. Please execute make command as follows.

make preinstall; make buildrpm

then it finished, please check ./rpmbuild/ dir

### traditional make install

make install

### deploy tarball

Please execute make command as follows.

make preinstall; make tarball

On gluster node by root user

tar zxvf glubix-deploy.tar.gz -C /

### other method

manually install script files on 'userparams' dir to gluster nodes.
Please copy to /usr/libexec/
