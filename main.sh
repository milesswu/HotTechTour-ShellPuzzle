#!/bin/bash

print() {
    # call with: print "${string[@]}"
    board=("$@")
    for str in ${board[@]}; do
        echo $str
    done
}


