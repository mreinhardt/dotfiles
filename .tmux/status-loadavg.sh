#!/usr/bin/env zsh

procs=$(nproc --all)
cur_loadavg=$(cat /proc/loadavg | cut -d' ' -f1-3)
normalized_loadavg=$(echo $cur_loadavg | egrep -o "[0-9]+[.][0-9]+" | xargs -I{} sh -c "echo {}/$procs | bc -l")
for nl in $(echo $normalized_loadavg | sed "s/'//g"); do
    if [[ $nl -gt 1.5 ]]; then
        thresh_color=105
    elif [[ $nl -gt 1.0 ]]; then
        thresh_color=115
    else
        thresh_color=72
    fi
    printf "#[fg=colour$thresh_color]%.*f " 2 $nl
done

