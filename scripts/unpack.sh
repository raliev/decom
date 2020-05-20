#!/bin/bash
mkdir -p jars/$1
echo unzip $1 -d -o jars/$1/
unzip -o $1 -d  jars/$1/
find jars/$1/ -name *.class | while read -r p; do
  A=`echo ${p} | perl -npe "s/^(.*?).jar\/\/(.*?).class/\2/g"`;
  echo $A
  DIR=$(dirname "${A}")
  mkdir -p sources/$DIR
  java -jar cfr_0_124.jar ${p} > sources/$A.java
done;
