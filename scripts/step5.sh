find . -name "GeneratedTypeInitializer.java" | xargs rm -rf 
find . -type d -empty -print | xargs rmdir
