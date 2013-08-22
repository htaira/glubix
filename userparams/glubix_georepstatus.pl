#!/usr/bin/perl

use strict;
use Getopt::Long qw(:config posix_default no_ignore_case gnu_compat);

my $gluster_volume_name;
my $gluster_slave_url;

my $getopt_result = GetOptions('volume_name=s' => \$gluster_volume_name,
                               'slave_url=s', => \$gluster_slave_url);

if ($gluster_volume_name eq "") {
        exit 1;
}

my $gluster_cmd = "/usr/sbin/gluster";
my $exec_cmd = "$gluster_cmd volume geo-replication $gluster_volume_name $gluster_slave_url status | tail -1 2> /dev/null";

my $result = `$exec_cmd`;

if ($result =~ '^----' || $result =~ '^No active geo-replication sessions' ) {
        print "NotFound\n";
        exit 1;
}

my ($master_vol,$slave_url,$status) = split(/[\s\t]+/, $result);

if ($master_vol eq $gluster_volume_name && $slave_url eq $gluster_slave_url) {
        print "$status\n";
        exit;
}

print "ERROR\n";
exit 1;

