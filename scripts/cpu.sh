#!/bin/bash
# ── cpu.sh ─────────────────────────────────────────────
# Description: Shows current cpu usage with ASCII bar + tooltip
# Usage: Waybar `custom/cpu` every 1s
# ───────────────────────────────────────────────────────────
cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)

int_cpu=$(echo "$cpu" | cut -d'.' -f1)

# ASCII
filled=$(( (int_cpu + 9) / 10))
empty=$((10 - filled))
bar=$(printf '█%.0s' $(seq 1 $filled))
pad=$(printf '░%.0s' $(seq 1 $empty))
ascii_bar="[$bar$pad]"
icon="\uf2db"

# Color thresholds
if [ "$int_cpu" -gt 80 ]; then
  fg="#f7768e"  # red
elif [ "$int_cpu" -gt 60 ]; then
  fg="#ff9e64"  # orange
else
  fg="#7dcfff"  # cyan
fi

# Fixed width text
text=$(printf "%4s%%" "$cpu")

tooltip="${int_cpu} ${filled}/${empty}"

echo "{\"text\":\"<span foreground='$fg'>$icon $ascii_bar $text</span>\",\"tooltip\":\"$tooltip\"}"
