#!/bin/bash

iptablescheck=$(firewall-cmd --list-all | grep -w "rule")
echo "$iptablescheck" | while read line
do
sorceip=$(echo $line | awk '{print $4}' | cut -d '=' -f 2 | awk -F'"' '$0=$2')
port=$(echo $line | awk '{print $6}' | cut -d '=' -f 2 | awk -F'"' '$0=$2')
echo "$sorceip $port"
done

