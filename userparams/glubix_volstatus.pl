#!/usr/bin/perl
# Ex.
#       ./glubix_volstatus.pl --volume_name vol0
#
# options:
#       --volume_name vol1

use strict;
use Getopt::Long qw(:config posix_default no_ignore_case gnu_compat);

my $status;
my $gluster_volume_name;

my $getopt_result = GetOptions('volume_name=s' => \$gluster_volume_name);

if ($gluster_volume_name eq "") {
	$status = "NotFound";
	printf "$status\n";
	exit 1;
}

my $gluster_cmd = "/usr/sbin/gluster";
my $exec_cmd = "$gluster_cmd volume info $gluster_volume_name 2> /dev/null";

my $result = `$exec_cmd`;

if ($result =~ m/Status: Started/) {
	$status = 'Started';
} elsif ($result =~ m/Status: Stopped/) {
	$status = 'Stopped';
} elsif ($result =~ m/Status: Created/) {
	$status = 'Created';
} else {
	# Can't parse volume status
	$status = "Unknown";
}

printf "$status\n";
exit;
