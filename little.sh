#!/bin/bash
#This colour
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'
BlueF='\e[1;34m'
clear
BANNERS () {
printf "${white}
======================================================
           Missing SPF Scanner
                                                
      ${lightgreen}Mass Scanner - Adelittle
${white}=======================================================
                                                        
"
}
BANNERS
OPTIONS () {
printf "${lightgreen}[>]${white} LIST TARGET                    : "
read list
kurumi=$(cat $list)
}
OPTIONS
SCAN () {
printf "${lightgreen}############## START SCANNING ##############${white}\n"
for kurumi in $(cat $list);
do
	if [[ $(dig +short ${kurumi} TXT) =~ 'spf' ]]; then
		printf "${red}[-] NOT VULN:${white} ${kurumi}\n"
	else
		printf "${lightgreen}[+] VULN:${white} ${kurumi}\n"
	fi
done
}
SCAN
RETURNS () {
printf "${lightgreen}############## FINISH SCANNING ##############${white}\n"
printf "${white}WANT TRY OTHER LIST ? (${lightgreen}Y${white}/${red}N${white}) : "
read return_list
if [[ $return_list == "y" ]]; then
clear
BANNERS
OPTIONS
SCAN
RETURNS
else
printf "THANKS FOR USING THIS TOOLS ! SEE YOU !\n"
printf "DON'T FORGET TO VISIT HTTP://NAKANOSEC.COM\n"
exit
fi
}
RETURNS

