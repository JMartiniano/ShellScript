#!/bin/bash


for line in $(cat $1); do
	echo -n "$line" | openssl sha1 | grep -oP "[a-z0-9]{40}" >> $2
done
