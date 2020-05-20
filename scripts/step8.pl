#!/usr/bin/perl
open FILE2, "all-meaningful-java-sources";
while (<FILE2>) { 
  $packageAndClass = $_;
  $packageAndClass =~ s/^(.*?)\/testsrc\/(.*?)\.java[\n\r]+$/\2/g;
  $packageAndClass =~ s/^(.*?)\/src\/(.*?)\.java[\n\r]+$/\2/g;
  $packageAndClass =~ s/^(.*?)\/gensrc\/(.*?)\.java[\n\r]+$/\2/g;
  $packageAndClass =~ s/^(.*?)\/addonsrc\/(.*?)\/(.*?)\.java[\n\r]+$/\3/g;
  $packageAndClass =~ s/^(.*?)\/commonwebsrc\/(.*?)\/(.*?)\.java[\n\r]+$/\3/g;
  $javasource{$packageAndClass} = $_; 
  #print $packageAndClass."\n";
}
close FILE2;
open FILE1, "all-classes-containing-hybris";
while (<FILE1>) { 
   s/[\n\r]+//g; 
   if ((/\/testclasses\//) || (\\/classes\//))
   {
     $className = $_;
     $packageAndClass = $className;
     $packageAndClass =~ s/^(.*?)\/classes\/(.*?)\.class/\2/g;
     $packageAndClass =~ s/^(.*?)\/testclasses\/(.*?)\.class/\2/g;
     if (!$javasource{$packageAndClass}) 
      {
       $className=~s/\$/\\\$/g;
       $packageAndClass=~s/\$/\\\$/g;
       $dir = $packageAndClass;
       $dir =~ s/^(.*?)\/([^\/]*?)$/\1/g;
       #print $className."\n";
       print "echo $className; mkdir -p sources/$dir; java -jar cfr_0_124.jar $className > sources/$packageAndClass.java\n"; 
      }
   } 
}
close FILE1;
