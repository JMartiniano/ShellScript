#!/bin/bash

for i in $(seq $2 $3);do
	ping -c 1 $1.${i} &>> /dev/null && echo "IP: $1.${i} - OCUPADO" || echo "IP: $1.${i} - LIVRE"
done
