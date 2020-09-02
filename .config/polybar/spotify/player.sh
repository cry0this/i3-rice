#!/bin/bash

status=$(playerctl -p spotify status 2> /dev/null)

if [[ "$1" == "" ]];then 
  metadata=$(playerctl -p spotify metadata --format '"{{artist}}" "{{title}}"' 2> /dev/null)
	artist=$(echo $metadata | awk -F '"' '{print $2}')
	title=$(echo $metadata | awk -F '"' '{print $4}')
	if [[ $artist == "" ]] || [[ $title == "" ]]; then
		echo ""
	else
		echo "$artist - $title"
	fi

elif [[ "$1" == "play-pause" ]]; then
  playerctl -p spotify play-pause 2> /dev/null

elif [[ "$1" == "show-icon" ]]; then 
  icon=''
	if [[ $status == 'Playing' ]]; then 
		echo '▮▮'
	elif [[ $status == 'Paused' ]]; then
		echo '▶'
	else
		echo ""
	fi

elif [[ "$1" == "show-prev" ]]; then  
  if [[ $status != "" ]]; then
    echo "<<"
  else 
    echo ""
  fi

elif [[ "$1" == "show-next" ]]; then 
  if [[ $status != "" ]]; then
    echo ">>"
  else 
    echo ""
  fi

elif [[ "$1" == "play-prev" ]]; then 
  playerctl -p spotify previous 2> /dev/null

elif [[ "$1" == "play-next" ]]; then
  playerctl -p spotify next 2> /dev/null

elif [[ "$1" == "open-spotify" ]]; then
  spotify 
fi
