#!/usr/bin/perl
# Ex.
#       ./glubix_checkvolstatus.pl --volume_name vol0
#       ./glubix_checkvolstatus.pl --volume_name vol1 --volume_numbricks 4
#
# options:
#       --volume_name vol1
#       --volume_numbricks 4

use strict;
use Getopt::Long qw(:config posix_default no_ignore_case gnu_compat);

my $rc = 0;
my $gluster_volume_name;
my $gluster_volume_numbricks;

my $getopt_result = GetOptions('volume_name=s' => \$gluster_volume_name,
                               'volume_numbricks=i', => \$gluster_volume_numbricks);

if ($gluster_volume_name eq "") {
	$rc = 0;
	printf "$rc\n";
	exit;
}

my $gluster_cmd = "/usr/sbin/gluster";
my $exec_cmd = "$gluster_cmd volume info $gluster_volume_name 2> /dev/null";

my $result = `$exec_cmd`;

if ($result =~ m/Status: Started/) {
	# volume status is Started
	$rc = 1;

	if ($gluster_volume_numbricks ne "" && $gluster_volume_numbricks > 0) {
		my $exec_cmd2 = "$gluster_cmd volume status $gluster_volume_name 2> /dev/null | grep '^Brick' | wc -l";
		my $result2 = `$exec_cmd2`;

	 	my $num_active_brick = $result2;

		# If number of active bricks were less than $gluster_volume_numbricks. return code is 0;
		if( $num_active_brick < $gluster_volume_numbricks ) {
			# missing some bricks. may be down.
			$rc = 0;
		} else {
			# brick is healthy
			$rc = 1;
		}
	}
} elsif ($result =~ m/Status: Stopped/) {
	# volume status is Stopped
	$rc = 0;
} else {
	# volume status is maintainance down or other
	$rc = 0;
}

printf "$rc\n";
exit
