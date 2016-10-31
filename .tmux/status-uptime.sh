#!/usr/bin/env zsh
#
function displaytime {
  local T=$1
  local D=$((T/60/60/24))
  local H=$((T/60/60%24))
  local M=$((T/60%60))
  local S=$((T%60))
  (( $D > 1 )) && printf '%dd' $D
  (( $H > 1 )) && printf '%dh' $H
  (( $M > 1 )) && printf '%dm' $M
  printf '%ds' $S
}
uptime_secs="$(cat /proc/uptime | cut -d' ' -f1)"
echo -n $(displaytime ${uptime_secs%%.*})

