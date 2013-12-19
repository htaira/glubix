#!/usr/bin/perl
# geo-replication via gsync for GlusterFS 3.3
# Ex.
#       ./glubix_.pl --volume_name vol1 --slave_url remote::geo-vol1
#
# options:
#       --volume_name vol1
#       --slave_url remote::geo-vol1
#

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
my $exec_cmd = "$gluster_cmd volume geo-replication $gluster_volume_name $gluster_slave_url status 2> /dev/null";

my $result = `$exec_cmd`;

if ($result =~ '^No active geo-replication sessions between' || $result =~ '^No active geo-replication sessions' ) {
        print "NotFound\n";
        exit 1;
}

$result =~ s/^\s*\n//g;
$result =~ s/MASTER NODE[A-Z\s]+\n//g;
$result =~ s/-+\s*\n//g;

my @result_array = split(/\n/,$result);
foreach my $line (@result_array){
	print "$line\n";
	my ($master_node,$master_vol,$master_brick,$slave_url,$status,$checkpoint_status,$crawl_status) = split(/\s+/, $line);

	if ($master_vol eq $gluster_volume_name && $slave_url eq $gluster_slave_url) {
		print "$status\n";
		exit;
	}
}

print "ERROR\n";
exit 1;

