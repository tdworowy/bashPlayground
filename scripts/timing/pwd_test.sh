#!/bin/bash
echo "Timing pwd"
time (for i in {1..10000}
do
   pwd &>/dev/null
done)
echo "###########"

echo "Timing /bin/pwd"
time (for i in {1..10000}
do
    /bin/pwd &>/dev/null
done)
echo "###########"

echo "strace pwd"
strace -c bash -c '
for i in {1..10000}
do
  pwd &>/dev/null
done
'
echo "###########"

echo "strace /bin/pwd"
strace -c bash -c '
for i in {1..10000}
do
  /bin/pwd &>/dev/null
done
'