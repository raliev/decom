mkdir -p sources
mkdir -p jars
mkdir -p classes
#cd jars; cat ../all-jars-containing-hybris | xargs mkdir -p; cd ..
cat  all-jars-containing-hybris | while read p; do ./unpack.sh ${p}; done
