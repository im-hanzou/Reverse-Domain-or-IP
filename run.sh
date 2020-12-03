#!/bin/bash

banner()

{

  printf " %-40s \n" "`python3 logo.py`"

}

banner

merah='\e[91m'

cyan='\e[96m'

kuning='\e[93m'

oren='\033[0;33m' 

margenta='\e[95m'

biru='\e[94m'

ijo="\e[92m"

putih="\e[97m"

normal='\033[0m'

bold='\e[1m'

labelmerah='\e[41m'

labelijo='\e[42m'

labelkuning='\e[43m'

labelpp='\e[45m'

res1=$(date +%s)

run(){

    time=$(date +%d_%m_%y)

    token="1300392484:AAFC20wHlrJQY8ICTypiOkXG6uqTmjAqVA4"

    chatid="782664019"

    empas="${biru}${1}/${2}"

    stats="${margenta}[$(date +"%T")]"

    ip=$(echo $((RANDOM%256)).$((RANDOM%256)).$((RANDOM%256)).$((RANDOM%256)))

      gas=$(curl -s "https://tools.webservertalk.com/reverse-ip/?host=$1" -X POST \

     -H "User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36" \

     -d "host=$1&submit=Pergilah%21")

     dom=$(echo "$gas" | grep -Po '(?<=</tr><tr><td class="text-left">)[^<]*')

      jumlah=$(echo "$dom" | wc -l)

      if [[ -z "$dom" ]]; then

      printf "${stats} ${margenta}[${3}/${totallines}]${normal} ${1}  => ${merah}DIE${normal}\n" 

      else

      printf "${stats} ${margenta}[${3}/${totallines}]${normal} ${1}  => ${ijo}LIVE${normal} | Ada "$jumlah" Domain \n"

      echo "${dom}" >> result.txt

      fi

}

      

printf "${white}[+] Input MAILPASS List : "; read LIST 

if [[ ! -f $LIST ]]; then

    echo "[-] File $LIST Not Exist" 

    exit 1

fi

totallines=$(wc -l < ${LIST});

itung=1

index=$((pp++))

printf " '-> Total MAILPASS On List :${white} ${bgreen} $(grep "" -c $LIST) ${cbg}\n" 

printf "${white}[+] Threads          : "; read THREADS

printf "${white} '-> Set Threads To ${bgreen} $THREADS ${cbg}\n" 

pp=1

IFS=$'\r\n' GLOBIGNORE='*' command eval 'mailist=($(cat $LIST))'

for (( i = 0; i < ${#mailist[@]}; i++ )); do

  index=$((itung++))

    username="${mailist[$i]}"

    IFS=':' read -r -a array <<< "$username"

    email=${array[0]}

    password=${array[1]}

   tt=$(expr $pp % $THREADS)

   if [[ $tt == 0 && $pp > 0 ]]; then

   sleep 5

   fi

   let pp++

   jam=$(date '+%H')

   menit=$(date '+%M')

   detik=$(date '+%S')

   

	run "${email}" "${password}" "${index}" &	

done

wait

termin=$(date +%s)

difftimelps=$(($termin-$res1))

echo -e "Finished at ${ijo}$(($difftimelps / 60)) menit dan ${ijo}$(($difftimelps % 60)) detik"
