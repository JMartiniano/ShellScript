#!/bin/bash

# Limpando o data.json
echo "" > data.json

# Começando o data.json
echo -e "{ \n	'ips': [" >> data.json

# Pegando o ip da rede
ip="$(ip addr | grep 'enp' | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.' | head -n 1)"

# Iniciando o ID que aumenta 1 a cada IP verificado
id=0

# Passando por todos os IPs da rede e vendo quais respondem, se responder acrescenta no .json com o ID
for ip in ${ip}{100..110}; do
	ping="$(ping -c 1 ${ip} | grep "64 bytes" | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}')"
	if [ -z "$ping" ];then
		:
	else
		id="$((${id} + 1))"
		echo -e "	{\n		'id': ${id}\n		'ip': ${ping}\n		'mascara': 255.255.255.0\n	}," >> data.json
	fi
done

# Fechando o data.json
echo -e "	]\n}" >> data.json
