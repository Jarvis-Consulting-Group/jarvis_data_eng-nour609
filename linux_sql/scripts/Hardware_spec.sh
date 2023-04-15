#!/bin/bash

#save hostname as a variable
hostname=$(hostname -f)

#save the number of CPUs to a variable
lscpu_out='lscpu'

#hardware info
cpu_number=$(echo "$lscpu_out"  | egrep "^CPU\(s\):" | awk '{print $2}' | xargs)

cpu_architecture=$(lscpu | head -n 1 | awk '{print $2}')

cpu_model=$(lscpu | sed -n '12p' | awk '{print $2}')

cpu_mhz= $(lscpu | sed -n '15p' | awk '{print $3}')

l2_cache=$(lscpu | sed -n '21p' | awk '{print $3}')

total_mem=$(vmstat --unit M | tail -1 | awk '{print $4}')

timestamp=$(date +"%Y-%m-%d %H:%M:%S")

#usage info

memory_free=$(vmstat --unit M | tail -1 | awk -v col="4" '{print $col}')

cpu_idle=$(vmstat | awk '$12 ~ /[0-9.]+/ { print 100 - $12 }')


cpu_kernel=$(vmstat --unit M | tail -1 | awk -v col="4" '{print $col}')

disk_io=$(vmstat --unit M -d | tail -1 | awk -v col="10" '{print $col}')

disk_available=$()

