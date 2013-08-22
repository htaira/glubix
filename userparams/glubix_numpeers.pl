#!/usr/bin/perl
# Ex.
#       ./glubix_numpeers.pl
#

use strict;

my $gluster_cmd = "/usr/sbin/gluster";
my $exec_cmd = "$gluster_cmd peer status 2> /dev/null";

my $result = `$exec_cmd`;

my $peers = 0;

if ($result =~ m/Number of Peers: ([0-9]+)/) {
	$peers = $1;
}

print "$peers\n";

exit;
