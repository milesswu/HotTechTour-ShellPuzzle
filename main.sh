#!/bin/bash

arr=(".X.." "...." "...." "....")

update_grid() {
    grid=("$@")
    curr_pos_y=$((${grid[0]}+4))
    curr_pos_x=$((${grid[1]}))
    next_pos_y=$((${grid[3]}+4))
    next_pos_x=$((${grid[2]}))
    unset grid[0]
    unset grid[1]
    unset grid[2]
    unset grid[3]

    new_x=$(($curr_pos_x + $next_pos_x))
    new="${grid[$curr_pos_y]:0:$new_x}X${grid[$curr_pos_y]:$((new_x + 1))}"
    final="${new:0:$curr_pos_x}.${new:$((curr_pos_x + 1))}"
    echo $final
    grid[$curr_pos_y]=$final

    # final=${grid[$curr_pos_y]//[X]/.}
}

update_grid 0 1 -1 0 "${arr[@]}"



