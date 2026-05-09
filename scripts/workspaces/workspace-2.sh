#!/bin/bash
# workspace-2.sh — highlight workspace 2 if active

active=$(hyprctl activeworkspace -j | jq '.id')

if [ "$active" -eq 2 ]; then
  echo "[<span foreground='#ff9e64'>●</span>]"
else
  echo "[Б]"
fi

