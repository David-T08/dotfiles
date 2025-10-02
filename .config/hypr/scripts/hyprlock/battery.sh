#!/bin/sh

now=$(cat /sys/class/power_supply/BAT0/charge_now)
full=$(cat /sys/class/power_supply/BAT0/charge_full)

percent=$((now * 100 / full))

icons=(    )

if [ "$percent" -le 15 ]; then
    icon=${icons[0]}
    color="#ff5555"
elif [ "$percent" -le 30 ]; then
    icon=${icons[1]}
    color="#ff8800"
elif [ "$percent" -le 50 ]; then
    icon=${icons[2]}
    color="#ffaa00"
elif [ "$percent" -le 80 ]; then
    icon=${icons[3]}
    color="#aaff00"
else
    icon=${icons[4]}
    color="#55ff55"
fi

echo "<span foreground='$color'>$icon $percent%</span>"

