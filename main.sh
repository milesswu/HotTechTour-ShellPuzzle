#!/bin/bash

function get_input()
{
    read user_input
    input=""
    if [ "$user_input" == "w" ]; then
        input="up"
    elif [ "$user_input" == "d" ]; then
        input="right"
    elif [ "$user_input" == "a" ]; then
        input="left"
    elif [ "$user_input" == "s" ]; then
        input="down"
    elif [ "$user_input" == "p" ]; then
        input="quit"
    else
        input="none"
    fi
    echo "$input"
}

while true; do
    input=$(get_input)
    echo $input
    if [ "$input" == "quit" ]; then
        break
    fi
done