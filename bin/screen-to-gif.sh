#!/bin/bash

echo ""
echo -e "\e[36mWelcome to screen to gif\e[0m"
echo ""
if [[ $1 == "--help" ]];then
  echo -e "\e[1mUSAGE:\e[0m $0 [output-file.gif]"
  echo ""
  exit 0
fi

echo -e "\e[32mClick a window to start recording\e[0m"

[ -z $1 ] && outputFile=screen-to-gif.gif || outputFile=$1
OGV_FILE=/tmp/screen-to-gif_$outputFile.ogv


xwinfoResult=$(xwininfo | grep "Window id:")
windowId=$(expr match "$xwinfoResult" '.*\(0x[0-9a-f]*\)')

echo -e "\e[32mStart recording $windowId\e[0m"
echo ""
echo -e "\e[36mCTRL-C to stop recording\e[0m"
echo ""

recordmydesktop --windowid=$windowId --no-sound -o $OGV_FILE

echo -e "\e[32mStart encoding\e[0m"
ogv-to-gif.sh $OGV_FILE $outputFile
