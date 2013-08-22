#!/usr/bin/perl
# Ex.
#       ./glubix_voltype.pl --volume_name vol0
#
# options:
#       --volume_name vol1
# return value type: String
# return value list: Unknown           ... Can't parse result of gluster command
#                    Blank             ... --volume_name is not set
#                    Distribute
#                    Stripe
#                    Replicate
#                    Striped-Replicate
#                    Distributed-Stripe
#                    Distributed-Replicate 
#                    Distributed-Striped-Replicate

use strict;
use Getopt::Long qw(:config posix_default no_ignore_case gnu_compat);

my $voltype;
my $gluster_volume_name = '';

my $getopt_result = GetOptions('volume_name=s' => \$gluster_volume_name);

if ($gluster_volume_name eq '') {
	$voltype = "Blank";
	exit;
}

my $gluster_cmd = "/usr/sbin/gluster";
my $exec_cmd = "$gluster_cmd volume info $gluster_volume_name 2> /dev/null";

my $result = `$exec_cmd`;

if ($result =~ m/Type: (\S+)/) {
	$voltype = $1;
} else {
	$voltype = "Unknown";
}

printf "$voltype\n";
exit
