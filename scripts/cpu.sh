#!/bin/bash
# ── cpu.sh ─────────────────────────────────────────────
# Description: Shows current cpu usage with ASCII bar + tooltip
# Usage: Waybar `custom/cpu` every 1s
# ───────────────────────────────────────────────────────────
cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)

index=$((cpu / 10))

# ASCII
filled=$((cpu / 10))
empty=$((10 - filled))
bar=$(printf '█%.0s' $(seq 1 $filled))
pad=$(printf '░%.0s' $(seq 1 $empty))
ascii_bar="[$bar$pad]"

icon="\uf2db"

# Color thresholds
if [ "$cpu" -gt 80 ]; then
    fg="#bf616a"  # red
elif [ "$cpu" -gt 60 ]; then
    fg="#fab387"  # orange
else
    fg="#56b6c2"  # cyan
fi

# JSON output
tooltip="$cpu%"
echo "{\"text\":\"<span foreground='$fg'>$icon $ascii_bar $cpu%</span>\",\"tooltip\":\"$tooltip\"}"
