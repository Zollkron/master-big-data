#!/bin/bash
sleep 2
echo "T"`sh getSeconds.sh` > /dev/rfcomm0
sleep 2
echo "A" > /dev/rfcomm0
sleep 2
#echo "f" > /dev/rfcomm0
#sleep 2
#echo "r" > /dev/rfcomm0
#sleep 2
#echo "l" > /dev/rfcomm0
#sleep 2
#echo "b" > /dev/rfcomm0
#sleep 2
echo "s" > /dev/rfcomm0
sleep 2
echo "A" > /dev/rfcomm0
