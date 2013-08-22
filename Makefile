install:
	install -m 755 userparams/glubix* /usr/libexec/
	install -m 755 tools/glubix-userparams-setup /usr/sbin/
	install -D -m 644 conf/userparams-glubix.conf /etc/zabbix/zabbix_agentd/
	install -D -m 644 file.list /usr/share/glubix/

preinstall:
	mkdir -p workdir
	mkdir -p workdir/usr/libexec/
	mkdir -p workdir/usr/sbin/
	mkdir -p workdir/etc/zabbix/zabbix_agentd/
	mkdir -p workdir/usr/share/glubix/
	install -m 755 userparams/glubix* workdir/usr/libexec/
	install -m 755 tools/glubix-userparams-setup workdir/usr/sbin/
	install -D -m 644 conf/userparams-glubix.conf workdir/etc/zabbix/zabbix_agentd/
	install -D -m 644 file.list workdir/usr/share/glubix/

tarball:
	tar -C workdir -zcf glubix-deploy.tar.gz .
