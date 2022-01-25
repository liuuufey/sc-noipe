#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
echo "Checking VPS"
IZIN=$( curl http://akses.netnot.xyz:81/liuuufeydevmain | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}Permission Accepted...${NC}"
else
echo -e "${red}Permission Denied!${NC}";
echo "Only For Premium Users"
exit 0
fi
clear
users=$(grep -c -E "^### " "/etc/v2ray/config.json")
	echo ""
	echo " Select the existing client you want to remove"
	echo " Press CTRL+C to return"
	echo " ==============================="
	echo "     No  User"
	grep -E "^### " "/etc/v2ray/config.json" | cut -d ' ' -f 2 | nl -s ') '
	until [[ ${user} -ge 1 && ${user} -le ${users} ]]; do
		if [[ ${user} == '1' ]]; then
			read -rp "Select one client [1]: " user
		else
			read -rp "Select one client [1-${users}]: " user
		fi
	done
user1=$(grep -E "^### " "/etc/v2ray/config.json" | cut -d ' ' -f 2 | sed -n "${user}"p)
tail -n 200000 /var/log/v2ray/access.log | grep ${user1} | nl
echo ""
read -n 1 -s -r -p "Press ctrl + c Back To Menu"
menu
