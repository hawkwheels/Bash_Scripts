#!/bin/bash

url=$1

mkdir $url
mkdir $url/recon

echo "[+] Recon is Initiated with assetfinder.."
assetfinder $url >> $url/recon/completesublist.txt
cat $url/recon/completesublist.txt | grep $1 >> $url/recon/onlysub.txt 
echo "assetfinder recon completed"
#cat $url/recon/onlysub.txt

echo "......................................."
echo "[+] Recon is Initiated with amass.."
amass enum -d $url >> $url/recon/amassfull.txt
cat $url/recon/amassfull.txt | grep $1 >> $url/recon/onlysub.txt
sort -u $url/recon/onlysub.txt >> $url/recon/final.txt
echo "amass recon completed"

echo "......................................."
echo "[+] Checking for alive domains with httprobe"

cat $url/recon/final.txt | sort -u | httprobe -s -p https:443 | sed 's/https\?:\/\///' | tr -d ':443' >> $url/recon/alive.txt


