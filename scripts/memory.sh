#!/bin/bash
# ── memory.sh ─────────────────────────────────────────────
# Description: Shows current cpu usage with ASCII bar + tooltip
# Usage: Waybar `custom/cpu` every 1s
# ───────────────────────────────────────────────────────────
used=$(free -h | awk '/^Mem:/ {print $3}')
total=$(free -h | awk '/^Mem:/ {print $2}')
usage=$(free | awk '/^Mem:/ {printf "%.0f", ($2-$7)/$2*100}')

# ASCII
filled=$((usage / 10))
empty=$((10 - filled))
bar=$(printf '█%.0s' $(seq 1 $filled))
pad=$(printf '░%.0s' $(seq 1 $empty))
ascii_bar="[$bar$pad]"

icon="\uf1c0"

# Color thresholds
if [ "$usage" -gt 80 ]; then
  fg="#f7768e"  # red
elif [ "$usage" -gt 60 ]; then
  fg="#ff9e64"  # orange
else
  fg="#7dcfff"  # cyan
fi

tooltip="$usage%"
echo "{\"text\":\"<span foreground='$fg'>$icon $ascii_bar $used/${total}</span>\",\"tooltip\":\"$tooltip\"}"
