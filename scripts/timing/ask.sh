./ans.sh &
export TIMEFORMAT='%3R'
sleep 5
N1=$SECONDS
echo hi > /dev/tcp/localhost/1234
ans=$(nc -l 1235)
echo ans=$ans, elapsed = $(($SECONDS-$N1))