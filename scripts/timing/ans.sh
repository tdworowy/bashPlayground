#!/bin/bash
message=$(nc -l 1234)
sleep 1
echo $message back to you >/dev/tcp/localhost/1235