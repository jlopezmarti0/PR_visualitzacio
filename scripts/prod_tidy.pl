#!/usr/bin/perl
use POSIX qw( locale_h );
use strict;
use warnings;
use locale;
use Archive::Zip;
setlocale(LC_ALL, "es_ES");

if(@ARGV != 1) {
	die "usage: $0 ods_file";
}

my $input_file 	= $ARGV[0];


##################################################################
# comprobar unitats fitxer i punts decimals
if(!open(IN,$input_file)) {
	die "I can not open conversion file $input_file\n";
}

my $header = <IN>;
chomp $header;
my $old_format = 0;
my @header_fields = split("\t",$header);
if(@header_fields > 5) {
	$old_format = 1;
	print STDERR "Old format detected.\n";
}

my $change_units = 1;


$header = "PROVINCIA\tTECNOLOGIA\t" . $header;
if($header =~ /MWh/ || $header =~ /MWH/) {	
	$header =~ s/MWH/GWH/g;
	$header =~ s/MWh/GWh/g;
	$change_units = 1000;
	print STDERR "MWh units detected... they will be converted!\n";
}

if($old_format) {	
	$header =~ s/DESCRIPCION_FILA\t//g;
	my @header_fields = split("\t",$header);
	print  $header_fields[0] . "\t" . $header_fields[1] . "\t" . $header_fields[5] . "\t";
	print  $header_fields[7] . "\t" . $header_fields[10] . "\n";
} else {
	$header =~ s/DESCRIPCION_FILA\t//g;
	$header =~ s/Tecnología\t//g;
	print $header ."\n";
}

my %aggregated_data;
while(my $line = <IN>) {
	chomp $line;
	my @fields = split("\t",$line);
	$fields[1] =~ s/Hidraúlica/Hidráulica/g;
	$fields[1] =~ s/Fuel\+gas y ciclo combinado/Combustibles/g;
	$fields[1] =~ s/Cogeneración/Combustibles/g;
	$fields[1] =~ s/Carbón/Combustibles/g;
	$fields[1] =~ s/Bombeo mixto/Hidráulica/g;
	$fields[1] =~ s/Bombeo puro/Hidráulica/g;
	$fields[1] =~ s/Resto hidráulica/Hidráulica/g;
	# perl no reconeis format numéric is'ha de canviar a mà o utilitzar una llibreria específica
	if(!$old_format) {
		$fields[2] =~ s/\.//g;
		$fields[3] =~ s/\.//g;
		$fields[2] =~ s/,/./g;
		$fields[3] =~ s/,/./g;
		$fields[2] /= $change_units;
		$fields[3] /= $change_units;
		$fields[3] = sprintf("%.2f",$fields[3]*1);
		$fields[2] = sprintf("%.2f",$fields[2]*1);
		#print join("\t",@fields);
		#print "\n";
		if($aggregated_data{$fields[0]} && $aggregated_data{$fields[0]}{$fields[4]} && $aggregated_data{$fields[0]}{$fields[4]}{$fields[1]}) {
			$aggregated_data{$fields[0]}{$fields[4]}{$fields[1]}{PROD_NETA} += $fields[3];
			$aggregated_data{$fields[0]}{$fields[4]}{$fields[1]}{PROD_BORNES} += $fields[2];
		} else {
			$aggregated_data{$fields[0]}{$fields[4]}{$fields[1]}{PROD_NETA} = $fields[3];
			$aggregated_data{$fields[0]}{$fields[4]}{$fields[1]}{PROD_BORNES} = $fields[2];
		}
	} else {
		$fields[7] =~ s/\.//g;
		$fields[5] =~ s/\.//g;
		$fields[7] =~ s/,/./g;
		$fields[5] =~ s/,/./g;
		$fields[7] /= $change_units;
		$fields[5] /= $change_units;
		$fields[7] = sprintf("%.2f",$fields[7]*1);
		$fields[5] = sprintf("%.2f",$fields[5]*1);
		#print $fields[0] . "\t" . $fields[1] . "\t" . $fields[5] . "\t" . $fields[7] . "\t" . $fields[10];
		#print "\n";
		if($aggregated_data{$fields[0]} && $aggregated_data{$fields[0]}{$fields[10]} && $aggregated_data{$fields[0]}{$fields[10]}{$fields[1]}) {
			$aggregated_data{$fields[0]}{$fields[10]}{$fields[1]}{PROD_NETA} += $fields[7];
			$aggregated_data{$fields[0]}{$fields[10]}{$fields[1]}{PROD_BORNES} += $fields[5];
		} else {
			$aggregated_data{$fields[0]}{$fields[10]}{$fields[1]}{PROD_NETA} = $fields[7];
			$aggregated_data{$fields[0]}{$fields[10]}{$fields[1]}{PROD_BORNES} = $fields[5];
		}
	}
}

close IN;

foreach my $prov (keys %aggregated_data) {
	foreach my $year (sort keys %{$aggregated_data{$prov}}) {
		foreach my $tipo (sort keys %{$aggregated_data{$prov}{$year}}) {
			my $prod_neta = $aggregated_data{$prov}{$year}{$tipo}{PROD_NETA};
			my $prod_bornes = $aggregated_data{$prov}{$year}{$tipo}{PROD_BORNES};
			print $prov   . "\t" . $tipo . "\t" . $prod_bornes . "\t" . $prod_neta . "\t" . $year . "\n";
		}
	}
}

