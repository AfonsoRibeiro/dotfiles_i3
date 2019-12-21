#!/bin/bash
light=$(light)
if (( $(echo "$light > 50" |bc -l) ))
then
    light -S 50
fi

oldlight=$(light)
light=$(light)

while (( $(echo "$light > 1" |bc -l) && $(echo "$oldlight >= $light" |bc -l) ))
do
    light -U 1
    oldlight=$light
    sleep 0.1
    light=$(light)
done
