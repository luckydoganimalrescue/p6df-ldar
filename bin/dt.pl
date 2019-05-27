#!/usr/bin/env perl

## core
use strict;
use warnings FATAL => 'all';
use Carp;

## Std

## CPAN
use DateTime::Format::MySQL;
use DateTime::Format::Strptime;

## Globals

## SDK
use P6::CLI ();
use P6::Util ();
use P6::IO ();

## Me

## Custom Args w/ defaults
our $File;

## Custom Constants

## Globals

## Functions
sub valid_args {

    my $errors = 0;

    $errors;
}

sub getopts {

    {
	"file=s"       => \$File,
    }
}

# main()
MAIN: { exit P6::CLI->run() }

# Entry Point
sub work { 

  my $parser = DateTime::Format::Strptime->new(
    pattern => '%m/%e/%y,%l:%M:%S %p',
    on_error => 'croak',
  );

  my $lines = P6::IO::dread($File);
 
  foreach my $line (@$lines) {
    chomp $line;

    my $dt = $parser->parse_datetime($line);
    $dt->set_time_zone('UTC'); ## set timezone of parsed date time
    $dt->set_time_zone('Pacific/Honolulu'); ## change timezone in safe way

    print $dt->strftime("%m/%d/%y %l:%M:%S %p");
    print "\n";

  }


}

__END__

