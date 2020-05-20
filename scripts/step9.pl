#!/usr/bin/perl
open FILE2, "all-meaningful-java-sources";
while (<FILE2>) { 
  $packageAndClass = $_;
  $packageAndClass =~ s/^(.*?)\/testsrc\/(.*?)\.java[\n\r]+$/\2/g;
  $packageAndClass =~ s/^(.*?)\/src\/(.*?)\.java[\n\r]+$/\2/g;
  $packageAndClass =~ s/^(.*?)\/gensrc\/(.*?)\.java[\n\r]+$/\2/g;
  $packageAndClass =~ s/^(.*?)\/addonsrc\/(.*?)\/(.*?)\.java[\n\r]+$/\3/g;
  $packageAndClass =~ s/^(.*?)\/commonwebsrc\/(.*?)\/(.*?)\.java[\n\r]+$/\3/g;
  $source = $_;
  $source =~ s/[\n\r]+//g;
  $dir = $packageAndClass;
       $dir =~ s/^(.*?)\/([^\/]*?)$/\1/g;
  $dir =~ s/[\n\r]+//g;
  $packageAndClass =~ s/[\n\r]+//g;
  $source =~ s/[\n\r]+//g;
  print "mkdir -p sources/$dir; ";
  print "cp $source sources/$packageAndClass.java\n";
}
close FILE2;
