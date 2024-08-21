#!/bin/bash

# -------------------------------
# Customizable thresholds
# -------------------------------
threshold_yellow=25
threshold_red=100

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

# --------
# Testing
# updates=101
# --------

css_class="green"

if [ "$updates" -gt $threshold_yellow ]; then
	css_class="yellow"
fi

if [ "$updates" -gt $threshold_red ]; then
	css_class="red"
fi

printf '{"text": "%s", "alt": "%s", "tooltip-format": "%s", "class": "%s"}' "$updates" "$updates" "$updates" "$css_class"
