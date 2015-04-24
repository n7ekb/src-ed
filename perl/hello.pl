#!/usr/bin/env perl
#
# Perl language Hello World! (and then some...) 
use strict;
use warnings;

my @animals = ("camel", "llama", "owl");
my %fruit_color = (apple => "red", banana => "yellow");
my @fruits = keys %fruit_color;
my @colors = values %fruit_color;
my $verinfo = `git describe --abbrev=7 --dirty --always --tags`;

# Obligatory Hello World with some version info
print "Hello Perl World!  Version:  $verinfo\n";

# Show list of command line arguments
print "Command line args: ";
foreach (@ARGV) {
	print "  $_";
}
print "\n";

# Determine number of physical CPU sockets
my $socketcount=`cat /proc/cpuinfo | grep 'physical id' | sort | uniq | wc -l`;
print "CPU socket count: $socketcount\n";

# print out our animals array in reverse-sorted order
print "\nValue of animals array:\n";
foreach (reverse @animals) {
	print 'item = ' .  $_ . "\n";
	if ($_ eq $animals[0]) {
		print "   Condition is TRUE, \"$_\" eq " . "$animals[0]\n";
	} else {
		print "   Condition is FALSE, \"$_\" ne " . "$animals[0]\n";
	}
}

# print our fruit_color hash (key/value pairs)
print "\nValue of fruit_color hash:\n";
foreach (keys %fruit_color) {
	print "$_ = $fruit_color{$_}\n";
}

# Let's create the file test.out and write animals array to it...
print "\nWriting test.out file...\n";
open(my $out, ">", "test.out") or die "Can't create/open test.out! $!\n";
foreach (@animals) {
	print $out "$_\n";
}
close $out or die "$out: $!\n";

# Now open the file we wrote and read it back...
print "\nContents of test.out file:\n";
open (my $in, "<", "test.out") or die "Can't open test.out! $!\n";
my $linenum = 1;
while (<$in>) {
	print "line $linenum: $_";
	$linenum += 1;
}
close $in or die "$in $!\n";
