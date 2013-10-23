#!/usr/bin/env perl
# This file is under version control:
# $Id$
# $URL$
#
# Author: Me, dd-Mon-yy
#
# Notes:
#
use Modern::Perl;
use Carp;
use FindBin qw/$Bin/;
# use local::lib "$Bin";
use English;
use Getopt::Long qw (:config no_ignore_case);
use Sys::Hostname;
use Time::localtime;
use Pod::Usage;

##
## main
##

# For Getopt
my %options = ();
my $userid  = getpwuid($EUID);
if ( $userid eq 'root' ) {
    exit "Do not run as root\n";
}

pod2usage(2) if (@ARGV < 1);

GetOptions(\%options,
    'a|alpha',
    'b|bravo=s',
    'c|charlie:i',
    'help|h|?'      => sub{ pod2usage(1) },
);

my $os        = $OSNAME;                # solaris or linux
(my $hostname = hostname) =~ s/\..*//;  # get short form hostname
my $tm        = localtime;
my @months    = qw( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec );

print "It's $months[$tm->[4]] $tm->[3] on $hostname\n";

exit;

##
## subs
##

sub template {
    my ($var) = @_;

    return;
}

__END__

=head1 NAME

B<COMMAND> - Some text

=head1 SYNOPSIS

  B<script> [options]
        -a, --alpha     First letter of the alphabet
        -h, --help      This text

=head1 DESCRIPTION

Tell us what it does.

=head1 EXAMPLE

=cut

# vim: set bg=dark ts=4 sw=4 et paste tw=78:
