#!/usr/bin/perl
use POSIX qw( locale_h );
use strict;
use warnings;
use Archive::Zip;
use locale;
setlocale(LC_ALL, "es_ES");

if(@ARGV != 3) {
	die "usage: $0 ods_file population_file conv_file";
}

my $input_file 	= $ARGV[0];
my $pop_file 	= $ARGV[1];	
my $conv_file 	= $ARGV[2];

my %pop_data;
my %conv_data;

##################################################################
# obtenir la conversió dels noms de les províncies
if(!open(CONV,$conv_file)) {
	die "I can not open conversion file $conv_file\n";
}

while(my $line = <CONV>) {
	chomp $line;
	my @fields = split("\t",$line);
	$conv_data{$fields[0]} = $fields[1];
}

close CONV;

##################################################################
# obtenir la població de la província per any
if(!open(POP,$pop_file)) {
	die "I can not open conversion file $pop_file\n";
}

while(my $line = <POP>) {
	chomp $line;
	my @fields = split("\t",$line);
	if($conv_data{$fields[0]}) {
		my $prov = $conv_data{$fields[0]};
		$fields[5] =~ s/\r//g;
		$pop_data{$prov}{$fields[4]} = $fields[5]/100000;
	}
}

close POP;

##################################################################
# normalitzar els valors per la població
if(!open(IN,$input_file)) {
	die "I can not open conversion file $input_file\n";
}

my $header = <IN>;
chomp $header;
print $header . "\tPROD_NETA(GBH)_X_HAB(100K)\n";
while(my $line = <IN>) {
	chomp $line;
	my @fields = split("\t",$line);
	my $prov = $fields[0];
	my $year = $fields[4];
	if($pop_data{$prov} && $pop_data{$prov}{$year}) {
		$fields[3] =~ s/,/./g;
		print $line ;
		print "\t";
		printf("%.2f",$fields[3]/$pop_data{$prov}{$year});
		print "\n";
		
	} else {
		if($pop_data{$prov}) {
			
			print $line . "\tNA\n";
		} else {
			print STDERR "$prov-$year\n";			
		}
	}
}

close IN;

