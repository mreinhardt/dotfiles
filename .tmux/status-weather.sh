#!/usr/bin/env zsh

TMP_FILE="/tmp/wttr.in.$(date +%H).log"

function saveweather {
    local full_weather
    local raw_weather
    local weather
    full_weather=$(curl -s "http://wttr.in/$(egrep -o '[^/]*$' < /etc/timezone)")
    raw_weather=$(echo "$full_weather" | head -n4 | tail -n2 | tr -d '[:cntrl:]' | sed 's/\[[^m]*m//g')
    weather=$(echo "$raw_weather" | egrep -o '[A-Z][A-Za-z]+(\s*[a-z]+)*|[0-9]+ °F' | tr '\n' ' ' | sed -e 's/ °/°/' -e 's/ *$//g')
    echo -n "$weather" > "$TMP_FILE"
}

if [ ! -f "$TMP_FILE" ]; then
    saveweather
fi
echo -n "$(cat $TMP_FILE)"
