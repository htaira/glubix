#!/usr/bin/perl
# Ex.
#       ./glubix_uuid.pl

use strict;

my $glusterd_info = "/var/lib/glusterd/glusterd.info";
my $exec_cmd = "grep UUID $glusterd_info 2> /dev/null";

my $result = `$exec_cmd`;

my $uuid;

if ($result =~ m/UUID=([0-9a-f]+-[0-9a-f]+-[0-9a-f]+-[0-9a-f]+-[0-9a-f]+)/) {
	$uuid = $1;
}

print "$uuid\n";

exit;
