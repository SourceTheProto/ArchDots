#!/bin/bash

# ----------------------------------------------------------------
# Calculate number of available updates with checkupdates and yay
# ----------------------------------------------------------------
if ! updates_arch=$(checkupdates 2> /dev/null | wc -l); then
	updates_arch=0
fi

if ! updates_aur=$(yay -Qua --aur --quiet | wc -l); then
	updates_aur=0
fi

updates=$(("$updates_arch" + "$updates_aur"))

echo $updates

# printf '{"text": "%s", "alt": "%s", "tooltip-format": "%s", "class": "%s"}' "$updates" "$updates" "$updates" "$css_class"
