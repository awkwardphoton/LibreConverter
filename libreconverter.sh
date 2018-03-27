#!/bin/bash

# Libre Converter - convert audio using ffmpeg simply

current="$(pwd)"

cd "$(dirname "$(readlink -f "$0")")"

cd "$1" #changes the working directory to argument parsed with execution

echo  'Working in directory' "'$(pwd)'Is this correct?" #show new path for demo purposes
PS3='Please enter your choice: '
options=("wma to mp3" "mp3 to wma" "ogg to mp3" "mp3 to ogg" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "wma to mp3")
				mkdir "mp3"
            	for f in *.wma; do ffmpeg -i "$f"  "mp3/${f%.*}.mp3"; done
            ;;
        "mp3 to wma")
            mkdir "wma"
            	for f in *.mp3; do ffmpeg -i "$f"  "wma/${f%.*}.wma"; done
            ;;
        "ogg to mp3")
           mkdir "mp3"
            	for f in *.ogg; do ffmpeg -i "$f"  "mp3/${f%.*}.mp3"; done
            ;;
        "mp3 to ogg")
			mkdir "ogg"
            	for f in *.mp3; do ffmpeg -i "$f"  "ogg/${f%.*}.ogg"; done
			;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done
