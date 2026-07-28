#!/bin/bash
# ── cpu.sh ─────────────────────────────────────────────
# Description: Shows current CPU usage with ASCII bar + tooltip
# Usage: Waybar `custom/cpu` every 2s
# ───────────────────────────────────────────────────────────

STATEFILE="${XDG_RUNTIME_DIR:-/tmp}/waybar-cpu.stat"

# Parse /proc/stat aggregate line
read -r _ user nice system idle iowait irq softirq steal _ _ < /proc/stat

idle_total=$((idle + iowait))
total=$((user + nice + system + idle + iowait + irq + softirq + steal))

if [[ -f $STATEFILE ]]; then
    read -r prev_idle prev_total < "$STATEFILE"
    delta_idle=$((idle_total - prev_idle))
    delta_total=$((total - prev_total))
    if ((delta_total > 0)); then
        usage=$((100 * (delta_total - delta_idle) / delta_total))
    else
        usage=0
fi
else
    usage=0
fi

# Clamp to 0-100
((usage < 0)) && usage=0
((usage > 100)) && usage=100

# Save state
echo "$idle_total $total" > "$STATEFILE"

# ASCII bar
filled=$(( (usage + 9) / 10 ))
empty=$((10 - filled))
bar=""
pad=""
for ((i=0; i<filled; i++)); do bar+="█"; done
for ((i=0; i<empty; i++)); do pad+="░"; done
ascii_bar="[$bar$pad]"

icon="\uf2db"

# Tokyo Night color thresholds
if ((usage > 80)); then
    fg="#f7768e"  # red
elif ((usage > 60)); then
    fg="#ff9e64"  # orange
elif ((usage > 40)); then
    fg="#e0af68"  # yellow
else
    fg="#7dcfff"  # cyan
fi

# Fixed width text
text=$(printf "%3d%%" "$usage")

# Tooltip with per-core usage
core_info=""
core=0
while read -r line; do
    [[ $line =~ ^cpu[0-9] ]] || continue
    read -r _ u n s id io ir si st _ _ <<< "$line"
    core_idle=$((id + io))
    core_total=$((u + n + s + id + io + ir + si + st))
    
    corefile="${XDG_RUNTIME_DIR:-/tmp}/waybar-cpu-core${core}.stat"
    if [[ -f $corefile ]]; then
        read -r pc_idle pc_total < "$corefile"
        dc_idle=$((core_idle - pc_idle))
        dc_total=$((core_total - pc_total))
        if ((dc_total > 0)); then
            core_usage=$((100 * (dc_total - dc_idle) / dc_total))
        else
            core_usage=0
        fi
        core_info+="Core $core: ${core_usage}%\n"
    fi
    echo "$core_idle $core_total" > "$corefile"
    ((core++))
done < /proc/stat

tooltip="CPU: ${usage}%\n${core_info}$(cat /proc/loadavg | awk '{print "Load: "$1" "$2" "$3}')"

echo "{\"text\":\"<span foreground='$fg'>$icon $ascii_bar $text</span>\",\"tooltip\":\"$tooltip\"}"
