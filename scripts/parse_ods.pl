#!/usr/bin/perl
use strict;
use warnings;
use Archive::Zip;

if(@ARGV != 2) {
	die "usage: $0 ods_file year";
}

my $input_file 	= $ARGV[0];
my $year 	= $ARGV[1];	

sub parse_ods {
	my $file = $_[0];
	my %data;
	
	my $zip = Archive::Zip->new($file);
	my $content=$zip->contents('content.xml');

	my $header = 0;
	
	$content =~ s/<\?xml .*\?>\n//;
	$content =~ s/^.*<office:spreadsheet>//;
	$content =~ s/<\/office:spreadsheet>.*$//;
	$content =~ s/<table:named-expressions>.*<\/table:named-expressions>//;
	$content =~ s/<table:database-ranges>.*<\/table:database-ranges>//; #keep greedy?
	$content =~ s/<\/table:table-cell>//; #maybe not neeeded
	$content =~ s/<\/table:table-row>//; #maybe not neeeded
	
	my @sheets = split(/<table:table .*?>/,$content);
	shift(@sheets); #skips the first _blank_ element
	
	my $num_sheet = 0;
	while($content =~ /<table:table table:name=\"(.*?)\" .*?>(.*?)<\/table:table>/g) {
		#print  $1 . "\n";
		if($num_sheet > 0) {
			my $sheet_name = $1;
			my $sheet_content = $2;
			#print $sheet_content . "\n";
			my $row_num = 0;
			while($sheet_content =~ /<table:table-row .*?>(.*?)<\/table:table-row>/g) {
				my $row_content = $1;
				#print $row_content . "\n";
				if($row_num > 0) {
					my $col_num = 0;
					#print $row_content  . "\n";
					$row_content =~ s/<text:s text:c=\"8\"?\/>//g;
					$row_content =~ s/<text:s\/>//g;
					
					while($row_content =~ /<table:table-cell .*?><text:p>(.*?)<\/text:p><\/table:table-cell>/g) {
						my $cell_content = $1;
						#print $cell_content . "\n";
						$data{$sheet_name}{$row_num}{$col_num} = $cell_content;
						$col_num++;
					}
				} else {
					if(!$header) {
						print "PROVINCIA\t";
						while($row_content =~ /<table:table-cell .*?><text:p>(.*?)(<text:s\/>)?<\/text:p><\/table:table-cell>/g) {
							my $cell_content = $1;
							print $cell_content . "\t";
						}
						print "YEAR\n";
						$header = 1;
					}
				}
				$row_num++;
			}
		}
		$num_sheet++;
	}
	
	return %data;
}


my %data = parse_ods($input_file);

foreach my $sheet_name (sort keys %data) {
	foreach my $row (sort keys %{$data{$sheet_name}}) {
		print  $sheet_name ;
		foreach my $col (sort keys %{$data{$sheet_name}{$row}}) {
			print "\t" . $data{$sheet_name}{$row}{$col};
		}
		print "\t$year\n";
	}
}

