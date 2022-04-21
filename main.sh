#!/bin/bash

arr=("|X-------------------|" "|--------------------|" "|--------------------|" "|--------------------|" "|--------------------|" "|--------------------|" "|--------------------|" "|--------------------|" "|--------------------|" "|--------------------|")
curr_x=0
curr_y=0
print() {
    # call with: print "${string[@]}"
    board=("$@")
    for str in ${board[@]}; do
        echo $str
    done
}

update_grid() {
    grid=("$@")
    curr_pos_y=$((${grid[0]}+4))
    curr_pos_x=$((${grid[1]}+1))
    next_pos_x=$((${grid[2]}))
    next_pos_y=$((${grid[3]}))
    unset grid[0]
    unset grid[1]
    unset grid[2]
    unset grid[3]

    # echo "***grid calc"
    new_x=$(($curr_pos_x + $next_pos_x))
    # echo $new_x
    new_y=$(($curr_pos_y + $next_pos_y))
    # echo $(($new_y - 4))
    grid[$new_y]="${grid[$new_y]:0:$new_x}X${grid[$new_y]:$((new_x + 1))}"
    grid[$curr_pos_y]="${grid[$curr_pos_y]:0:$curr_pos_x}.${grid[$curr_pos_y]:$((curr_pos_x + 1))}"
    print "${grid[@]}"
    arr=($(print "${grid[@]}"))
}

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

print "${arr[@]}"
while true; do
    input=$(get_input)
    # echo "***input"
    # echo $input

    if [ "$input" == "left" ]; then
        update_grid $curr_y $curr_x -1 0 "${arr[@]}"
        curr_x=$(($curr_x - 1))
    elif [ "$input" == "right" ]; then
        update_grid $curr_y $curr_x 1 0 "${arr[@]}"
        curr_x=$(($curr_x + 1))
    elif [ "$input" == "up" ]; then
        update_grid $curr_y $curr_x 0 -1 "${arr[@]}"
        curr_y=$(($curr_y - 1))
    elif [ "$input" == "down" ]; then
        update_grid $curr_y $curr_x 0 1 "${arr[@]}"
        curr_y=$(($curr_y + 1))
    else
        exit 1
    fi

    # echo "***end pos"
    # echo $curr_x
    # echo $curr_y


    
done



