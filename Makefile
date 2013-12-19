curdir = $(shell pwd)

install:
	install -m 755 userparams/glubix* /usr/libexec/
	install -m 755 tools/glubix-userparams-setup /usr/sbin/
	install -D -m 644 conf/userparams-glubix.conf /etc/zabbix/zabbix_agentd/

preinstall:
	mkdir -p workdir
	mkdir -p workdir/usr/libexec/
	mkdir -p workdir/usr/sbin/
	mkdir -p workdir/etc/zabbix/zabbix_agentd/
	install -m 755 userparams/glubix* workdir/usr/libexec/
	install -m 755 tools/glubix-userparams-setup workdir/usr/sbin/
	install -D -m 644 conf/userparams-glubix.conf workdir/etc/zabbix/zabbix_agentd/
	find $(curdir)/workdir -type f > file.list

tarball:
	tar -C workdir -zcf glubix-deploy.tar.gz .

buildrpm:
	pmaker -n glubix --pversion 1.1 --relations="requires:zabbix,zabbix-agent" --packager="Hajime Taira" --email="htaira@pantora.net" --ignore-owner --destdir=$(curdir)/workdir -w $(curdir)/rpmbuild -vv --no-mock file.list

clean:
	rm -f file.list
	rm -f glubix-deploy.tar.gz
	rm -rf $(curdir)/workdir
	rm -rf $(curdir)/rpmbuild
