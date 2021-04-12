 #!/bin/bash

UPPER_LIMIT=10

echo "Numbers 1 to 10 (but not 3 and 7)."
n=0

while [ "$n" -le "$UPPER_LIMIT" ]; do
    n=$(($n+1))
    if [ "$n" -eq 3 ] || [ "$n" -eq 7 ]; then
        continue
    fi
    echo "$n"
done
# 1 2   4 5 6   8 9 10 11
