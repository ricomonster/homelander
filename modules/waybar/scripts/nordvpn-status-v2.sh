#!/bin/bash
status=$(nordvpn status 2>/dev/null)
if echo "$status" | grep -q "Connected"; then
  hostname=$(echo "$status" | awk -F': ' '/^Hostname:/{print $2}')
  code=$(echo "$hostname" | awk '{print tolower($1)}' | sed -E 's/^([a-z]+).*/\1/' | tr '[:lower:]' '[:upper:]')
  country=$(echo "$status" | awk -F': ' '/^Country:/{print $2}')
  [[ -z "$code" ]] && code="${country:-??}"
  [[ -z "$country" ]] && country="$code"

  text="<span>\udb82\udd9d $code</span>"
  tooltip="VPN: $country"
  class="connected"
else
  text="<span>\udb82\udd9e Disconnected</span>"
  tooltip="VPN: disconnected"
  class="disconnected"
fi
printf '{"text":"%s","tooltip":"%s"}\n' "$text" "$tooltip"
