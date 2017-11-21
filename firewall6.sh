#!/bin/bash

iptablescheck=$(iptables -L -n | grep ACCEPT | grep dpt)
echo "$iptablescheck" | while read line
do
sorceip=$(echo $line | awk '{print $4}' | cut -d '/' -f 1)
port=$(echo $line | awk '{print $NF}' | sed 's/[:-]/ /g' | sed -e 's/\<dpt\>//g' | sed -e 's/^[ \t]*//' | sed 's/[,-]/ /g')
echo "$sorceip $port" 
done
