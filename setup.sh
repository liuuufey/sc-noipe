#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
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
rm -rf setup.sh
clear
if [ -f "/etc/v2ray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
mkdir /var/lib/premium-script;
echo "IP=" >> /var/lib/premium-script/ipvps.conf
secs_to_human() {
    echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minute's $(( ${1} % 60 )) seconds"
}
start=$(date +%s)
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green Installing AutoScript Liuuufey        $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 5
echo -e "\e[32mPermission Accepted...\e[0m"
sleep 1
#Cloudflare
wget https://raw.githubusercontent.com/liuuufey/sc-noip/main/cf.sh && chmod +x cf.sh && ./cf.sh
#install ssh ovpn
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green      Install SSH OVPN               $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 3
echo -e "\e[32mPermission Accepted...\e[0m"
sleep 1
wget https://raw.githubusercontent.com/liuuufey/sc-noipe/main/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
#SSTP
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green          Install SSTP                $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 3
echo -e "\e[32mPermission Accepted...\e[0m"
sleep 1
wget https://raw.githubusercontent.com/liuuufey/sc-noip/main/sstp.sh && chmod +x sstp.sh && screen -S sstp ./sstp.sh
#Websocket
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green          Install Websocket                $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 3
echo -e "\e[32mPermission Accepted...\e[0m"
sleep 1
wget https://raw.githubusercontent.com/liuuufey/ws/main/weleh.sh && chmod +x weleh.sh && screen -S weleh ./weleh.sh
#install ssr
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green          Install SSR                $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 3
echo -e "\e[32mPermission Accepted...\e[0m"
sleep 1
wget https://raw.githubusercontent.com/liuuufey/sc-noip/main/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
#Sodosok
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green          Install Shadowsocks                $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 3
echo -e "\e[32mPermission Accepted...\e[0m"
sleep 1
wget https://raw.githubusercontent.com/liuuufey/sc-noip/main/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh
#install wg
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green          Install Wireguard                $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 3
echo -e "\e[32mPermission Accepted...\e[0m"
sleep 1
wget https://raw.githubusercontent.com/liuuufey/sc-noip/main/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh
#install v2ray
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green          Install V2RAY                $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 3
echo -e "\e[32mPermission Accepted...\e[0m"
sleep 1
wget https://raw.githubusercontent.com/liuuufey/sc-noip/main/ins-vt.sh && chmod +x ins-vt.sh && screen -S v2ray ./ins-vt.sh
#install L2TP
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green          Install L2TP                $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 3
echo -e "\e[32mPermission Accepted...\e[0m"
sleep 1
wget https://raw.githubusercontent.com/liuuufey/sc-noip/main/ipsec.sh && chmod +x ipsec.sh && screen -S ipsec ./ipsec.sh
#install Trojan-go
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green          Install Trojan-Go                $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 3
echo -e "\e[32mPermission Accepted...\e[0m"
sleep 1
wget https://raw.githubusercontent.com/liuuufey/sc-noipe/main/ins-trojango.sh && chmod +x ins-trojango.sh && screen -S Trojan-go ./ins-trojango.sh
#Set-br
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green            SET BACKUP               $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 3
echo -e "\e[32mPermission Accepted...\e[0m"
sleep 1
wget https://raw.githubusercontent.com/liuuufey/sc-noip/main/set-br.sh && chmod +x set-br.sh && ./set-br.sh

rm -f /root/cf.sh
rm -f /root/ssh-vpn.sh
rm -f /root/sstp.sh
rm -f /root/weleh.sh
rm -f /root/ssr.sh
rm -f /root/ss.sh
rm -f /root/wg.sh
rm -f /root/ins-vt.sh
rm -f /root/ipsec.sh
rm -f /root/ins-trojango.sh
rm -f /root/set-br.sh
cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://sundanesee.eu.org

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
wget -O /etc/set.sh "https://raw.githubusercontent.com/liuuufey/sc-noip/main/set.sh"
chmod +x /etc/set.sh
history -c
echo "1.2" > /home/ver
clear
echo " "
echo -e "\e[32mInstallation has been completed!!\e[0m"
sleep 3
echo " "
echo "=============-Autoscript Premium-=============" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "----------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 442"  | tee -a log-install.txt
echo "   - Stunnel4                : 222, 777"  | tee -a log-install.txt
echo "   - SSLH                    : 443, "  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 85"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN          : 1701"  | tee -a log-install.txt
echo "   - PPTP VPN                : 1732"  | tee -a log-install.txt
echo "   - SSTP VPN                : 444"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a log-install.txt
echo "   - V2RAY Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - V2RAY Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - V2RAY Vless TLS         : 2083"  | tee -a log-install.txt
echo "   - V2RAY Vless None TLS    : 8880"  | tee -a log-install.txt
echo "   - Trojan-GFW              : 2087"  | tee -a log-install.txt
echo "   - Trojan-GO               : 2096"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - Dev/Main                : Jhoy Project"  | tee -a log-install.txt
echo "   - Telegram                : @liuuufey"  | tee -a log-install.txt
echo "---------Script Created By Jhoy PROJECT----------" | tee -a log-install.txt
echo ""
secs_to_human "$(($(date +%s) - ${start}))" | tee -a log-install.txt
echo ""
echo " Reboot 15 Sec"
sleep 15
rm -f setup.sh
reboot
