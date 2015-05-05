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

	# Now parse the result of gluster volume status command
	# Sample output:
	# # gluster volume status vol1
	# Status of volume: vol1
	# Gluster process                        Port    Online   Pid
	# ------------------------------------------------------------
	# Self-heal Daemon on localhost          N/A     Y       18491
	# Brick rhgs3n1:/srv/gluster/brick1/vol1      49152     0          Y       2834 
	# Brick rhgs3n2:/srv/gluster/brick1/vol1      49152     0          Y       2790 
	# Brick rhgs3n1:/srv/gluster/brick2/vol1      49153     0          Y       2847 
	# Brick rhgs3n2:/srv/gluster/brick2/vol1      49153     0          N       2807 
	# NFS Server on localhost                     2049      0          Y       2865 
	# Self-heal Daemon on localhost               N/A       N/A        Y       2871 
	# NFS Server on rhgs3n1                       2049      0          Y       2824 
	# Self-heal Daemon on rhgs3n1                 N/A       N/A        Y       2830 

	if ($gluster_volume_numbricks ne "" && $gluster_volume_numbricks > 0) {
		my $exec_cmd2 = "$gluster_cmd volume status $gluster_volume_name 2> /dev/null";
		my $result2 = `$exec_cmd2`;
                my $online_bricks = 0;

		my @output = split(/\n/, $result2);
		foreach my $line (@output) {
			my @stat = split(/\s+/, $line);

			if (@stat[0] ne "Brick") {
				next;
			} elsif (@stat[0] eq "Brick" && @stat[-2] ne 'Y') {
# for debug
#				print "Brick: ".@stat[1]." seems OFFLINE.\n";
				next;
			}

			$online_bricks++;
		}

# for debug
#		print "online_bricks = ".$online_bricks."\n";

		$rc = ($online_bricks == $gluster_volume_numbricks) ? 1 : 0;
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
