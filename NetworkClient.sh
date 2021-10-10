#!/bin/bash

# Começando o data.json
echo -e "{ \n	'ips': [" >> data.json

# Pegando o ip da rede
ip="$(ip addr | grep 'enp' | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.' | head -n 1)"

