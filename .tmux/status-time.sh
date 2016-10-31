#!/usr/bin/env zsh

if [[ $1 == 'utc' ]]; then
    echo -n $(date -u +'%H:%M %Z')
else
    echo -n $(date +'%H:%M %Z')
fi

