#!/usr/bin/env bash
link="https://www.tvboxnow.com/thread-5376871-1-1.html"
read -p "開心速遞第幾集？" EP
curl $link | grep torrent | sed 's/.*href=\"\(at.*\)\"/\1/g' | grep EP$EP | sed 's/\".*//g'
link2download=$(curl $link | grep torrent | sed 's/.*href=\"\(at.*\)\"/\1/g' | grep EP$EP | sed 's/\".*//g')
echo http://www.tvboxnow.com/$link2download
download_torrent=$(curl -L "http://www.tvboxnow.com/$link2download" | grep 如果 | sed 's/.*href=\"\(at.*\)\"/\1/g' | sed 's/>.*//g')
echo http://www.tvboxnow.com/$download_torrent
curl -o $EP.torrent -L http://www.tvboxnow.com/$download_torrent
aria2c --seed-time=0 --select-file=1 *.torrent
rm *.aria2
cd TVBOX*
IFS=$'\n'
file=`ls *.mp4`
upfile=`echo $file | sed 's/TVBOXNOW\ //g'` 
mv $file ../$upfile
cd .. 
pip3 install telethon --user
echo $upfile
python3 u2tggroup.py ./$upfile
rm -rf TVBOXNOW* *.torrent *.mp4
