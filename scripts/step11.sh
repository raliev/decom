find sources -type f -print0| xargs -0 sed -i '' -e 's/^class/public class/g'
