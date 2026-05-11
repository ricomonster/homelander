#!/bin/bash
# ── vpn-toggle.sh ─────────────────────────────────────────
# Description: Toggle VPN on/off via NordVPN CLI
# Usage: Called by Waybar `custom/vpn` on click
# Dependencies: nordvpn
# ──────────────────────────────────────────────────────────
if nordvpn status | grep -q "Connected"; then
  nordvpn disconnect
else
  nordvpn connect
fi
