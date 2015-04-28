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

# Read a non-existent environment variable and supply default value...
my $some_env_var;
if (defined $ENV{'PROBABLY_NOT_THERE'}) {
	$some_env_var = $ENV{'PROBABLY_NOT_THERE'};
} else {
	$some_env_var = "Default value";
}
print "\nPROBABLY_NOT_THERE is set to \'$some_env_var\'\n\n";

# Let's read in the PATH variable from the OS and print it out...
my $path_env_var = $ENV{'PATH'};
print "OS PATH var is set to: \'$path_env_var\'\n\n";

# Let's manipulate PATH variable and then restore it
print "Adding :/test to PATH variable\n";
$ENV{'PATH'} = "$ENV{'PATH'}:/test";
print "OS PATH var is set to: \'$ENV{'PATH'}\'\n\n";
print "Restoring original PATH value.\n";
$ENV{'PATH'} = $path_env_var;
print "OS PATH var is set to: \'$path_env_var\'\n\n";

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
