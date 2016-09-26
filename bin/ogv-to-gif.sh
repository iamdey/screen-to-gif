#!/bin/bash

# from Dawid Drozd http://unix.stackexchange.com/a/298656/187922

inputFile=$1
[ -z $2 ] && outputFile=output.gif || outputFile=$2

FPS=15
WIDTH=640
CMD=ffmpeg
PALETTE_PATH=/tmp/ogv-to-gif_palette.png

#Generate palette for better quality
$CMD -i $inputFile -vf fps=$FPS,scale=$WIDTH:-1:flags=lanczos,palettegen $PALETTE_PATH

#Generate gif using palette
$CMD -i $inputFile -i $PALETTE_PATH -loop 0 -filter_complex "fps=$FPS,scale=$WIDTH:-1:flags=lanczos[x];[x][1:v]paletteuse" $outputFile

rm $PALETTE_PATH
