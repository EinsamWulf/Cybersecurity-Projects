#!/bin/bash

mkdir ~/research
echo sudo find -f -perm /4000 > ~/research/sys_info.txt
echo ps aux --sort -%mem | awk {'$1, $2, $3, $11'} > ~/research/sys_info.txt
 
