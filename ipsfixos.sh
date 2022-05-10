#!/bin/bash

if [ $1 != "--help" ];then
	for i in $(seq $2 $3);do
		ping -c 1 $1.${i} &>> /dev/null && echo "IP: $1.${i} - OCUPADO" || echo "IP: $1.${i} - LIVRE"
	done
else
	echo -e '\n\n=========================================================================\n\nIPSCAN HELP MENU\n

	\nEste comando é capaz de varrer uma rede local específica, sendo possível indicar o intervalo que deve ser varrido, mostrando na tela uma lista com os IPs varridos e os status (OCUPADO ou LIVRE).
	\n\nSintaxe:\n
	\nipscan [fixa do ip da rede sem o ponto no final] [primeiro host do intervalo] [último host do intervalo]\n
	\nExemplo:\n
	\n ipscan 172.16.102 1 10\n
	\nA saída dever ser algo parecido com:\n
	\n IP:    172.16.102.1    -    LIVRE
	\n IP:    172.16.102.2    -    LIVRE
	\n IP:    172.16.102.3    -    LIVRE
	\n IP:    172.16.102.4    -    LIVRE
	\n IP:    172.16.102.5    -    LIVRE
	\n IP:    172.16.102.6    -    LIVRE
	\n IP:    172.16.102.7    -    LIVRE
	\n IP:    172.16.102.8    -    LIVRE
	\n IP:    172.16.102.9    -    LIVRE
	\n IP:    172.16.102.10   -    OCUPADO\n'
fi
