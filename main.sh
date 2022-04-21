#!/bin/bash

arr=("...." "...." "...." "....")
curr_x=0
curr_y=0

update_grid() {
    grid=("$@")
    curr_pos_y=$((${grid[0]}+4))
    curr_pos_x=$((${grid[1]}))
    next_pos_x=$((${grid[2]}))
    next_pos_y=$((${grid[3]}+4))
    unset grid[0]
    unset grid[1]
    unset grid[2]
    unset grid[3]

    new_x=$(($curr_pos_x + $next_pos_x))
    new="${grid[$curr_pos_y]:0:$new_x}X${grid[$curr_pos_y]:$((new_x + 1))}"
    final="${new:0:$curr_pos_x}.${new:$((curr_pos_x + 1))}"
    echo $final
    grid[$curr_pos_y]=$final
    print "${grid[@]}"
}

update_grid 0 1 -1 0 "${arr[@]}"

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
    if [ "$input" == "left" ]; then
        update_grid $curr_y $curr_x -1 0 "${arr[@]}"
        curr_x=$(($curr_x - 1))
    elif [ "$input" == "right" ]; then
        update_grid $curr_y $curr_x 1 0 "${arr[@]}"
        curr_x=$(($curr_x + 1))
    fi
done
print() {
    # call with: print "${string[@]}"
    board=("$@")
    for str in ${board[@]}; do
        echo $str
    done
}


