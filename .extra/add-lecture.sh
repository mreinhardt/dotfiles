#!/usr/bin/env zsh

if [[ -n $(grep 'lecture_file' /etc/sudoers) ]]; then
    echo 'Lecture already added!'
    return
fi

sed -i "$(awk '/Defaults/{print NR;exit}' /etc/sudoers)i Defaults	lecture="'"'"always"'"'"\nDefaults	lecture_file=/etc/sudo-lecture" /etc/sudoers

cp "$1" /etc/sudo-lecture
