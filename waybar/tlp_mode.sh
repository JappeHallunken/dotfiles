#!/bin/bash
# Check the current power source using tlp-stat
echo $(tlp-stat -s | grep 'Power source' | awk '{print $4}')
# Output the mode
#echo $mode
