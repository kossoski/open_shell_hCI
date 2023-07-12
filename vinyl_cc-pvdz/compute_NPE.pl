#!/usr/bin/perl

use warnings;
use strict;
use List::Util qw(min max);

my $case = $ARGV[0];
my $xcut = $ARGV[1];

my(@files,@index,$detfile,$outfile);

if($case==1){
@files = qw( pes_rohf.dat pes_CIo1.dat pes_CIo1.5.dat pes_CIo2.dat pes_CIo2.5.dat pes_CIo3.dat pes_CIo3.5.dat pes_CIo4.dat);
@index = qw( 0 1 1.5 2 2.5 3 3.5 4);
$detfile = "det_CIo.dat";
$outfile = "stat_CIo.dat";
}
elsif($case==2){
@files = qw( pes_rohf.dat pes_ooCIo1.dat pes_ooCIo1.5.dat pes_ooCIo2.dat pes_ooCIo2.5.dat pes_ooCIo3.dat pes_ooCIo3.5.dat pes_ooCIo4.dat);
@index = qw( 0 1 1.5 2 2.5 3 3.5 4);
$detfile = "det_CIo.dat";
$outfile = "stat_ooCIo.dat";
}
elsif($case==3){
@files = qw( pes_rohf.dat pes_CIS.dat pes_CISD.dat pes_CISDT.dat pes_CISDTQ.dat);
@index = qw( 0 1 2 3 4);
$detfile = "det_CI.dat";
$outfile = "stat_CI.dat";
}
elsif($case==4){
@files = qw( pes_rohf.dat pes_ooCIS.dat pes_ooCISD.dat pes_ooCISDT.dat pes_ooCISDTQ.dat);
@index = qw( 0 1 2 3 4);
$detfile = "det_CI.dat";
$outfile = "stat_ooCI.dat";
}
elsif($case==5){
@files = qw( pes_s1.dat pes_s3.dat pes_s5.dat);
@index = qw( 1 3 5);
$detfile = "det_CIs.dat";
$outfile = "stat_CIs.dat";
}
elsif($case==6){
@files = qw( pes_ooCIs1.dat pes_ooCIs3.dat pes_ooCIs5.dat);
@index = qw( 1 3 5);
$detfile = "det_CIs.dat";
$outfile = "stat_ooCIs.dat";
}
else{
print "case variable not recognized \n";
die;
}

my $fci_file = 'pes_fci.dat';

my $n_files = @files;

my (@x0, @y0);
my ($x, $y, $dy);
my ($i, $n);

$n=0;
open(Fi, '<', $fci_file) or die $!;
  while(<Fi>){
    my @line =  split( /\s+/, $_ );
    $n++;
    $x0[$n] = $line[0];
    $y0[$n] = $line[1];
    if($x0[$n]>$xcut){last};
  }
close(Fi);

my(@index2,@det);
my $k=0;
open(Fi, '<', $detfile) or die $!;
  while(<Fi>){
    my @line =  split( /\s+/, $_ );
    $index2[$k] = $line[0];
    $det[$k]    = $line[1];
    $k++;
  }
close(Fi);

  if(-e $outfile){unlink $outfile};
	
  open(Fo, '>>', $outfile) or die $!;
  for ( my $j = 0; $j < $n_files; $j++ ){

    if(-e $files[$j]){

      my $maxy = -1e99;
      my $miny =  1e99;

      #     my $m=0;
      #     open(Fi, '<', $files[$j]) or die $!;
      #       while(<Fi>){
      #         $m++;
      #       }
      #     close(Fi);

      #          if($m==$n){
        my $m=0;
        open(Fi, '<', $files[$j]) or die $!;
          while(<Fi>){
            my @line =  split( /\s+/, $_ );
            $m++;
            $x = $line[0];
            $y = $line[1];
            $dy    = $y - $y0[$m];
            $maxy = max($maxy,$dy);
            $miny = min($miny,$dy);
	    if($x==$xcut){last};
          }
        close(Fi);

        if($x==$xcut){
          my $npe = $maxy - $miny;
	  my $closeness = abs($maxy) + abs($miny);
          print Fo "$index[$j] $index2[$j] $det[$j]  $npe  $closeness  $maxy  $miny \n";
	}
	#     }

    }

  }
  close(Fo);
