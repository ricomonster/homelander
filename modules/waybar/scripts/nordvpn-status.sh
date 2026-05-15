#!/bin/bash
# ── nordvpn-status.sh ──────────────────────────────────────
# Description: Checks if VPN interface is active via IP range
# Usage: Called by Waybar `custom/vpn` every 5s
# Dependencies: ip, curl (optional, for country lookup)
# Output: Pango markup → [ФАНТОМ]: Country or KAPUTT
# Example: <span foreground='#fab387'>[ФАНТОМ]: Japan</span>
#          <span foreground='#bf616a'>[ФАНТОМ]: KAPUTT</span>
# ───────────────────────────────────────────────────────────
status=$(nordvpn status 2>/dev/null)

if echo "$status" | grep -q "Connected"; then
  country=$(echo "$status" | grep "Country" | awk -F': ' '{print $2}')
  [[ -z "$country" ]] && country="UNKNOWN"
  echo "<span foreground='#ff9e64'>[ФАНТОМ]: $country</span>"
else
  echo "<span foreground='#f7768e'>[ФАНТОМ]: KAPUTT</span>"
fi
