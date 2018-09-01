#!/bin/bash
clear
reff(){
pin=$(shuf -i 1000-9999 -n 1)
address=$(curl "https://www.blockchain.com/btc/unconfirmed-transactions" -s | grep -Po '(?<=<a href="/btc/address/)[^"]*' | sed -n 1p)
signup=$(curl -s -X POST -d "wallet_address=$address&pin=$pin&action=post&refid=230483" --user-agent "Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:53.0) Gecko/20100101 Firefox/53.0" "https://btcpool.io/ajax/sign" -e "https://web.facebook.com/" -x "$proxys" -m 10 2> /dev/null)
    if [[ $signup == "" ]]
        then
   printf "[Address: $address] [Proxy: $proxys]"
            printf " [Status: Success]\n"
         else
printf "[Address: $address] [Proxy: $proxys]"
            printf "[Status: gagal]\n"
            fi
}
for proxys in $(cat proxylist.txt)
do
reff
done
