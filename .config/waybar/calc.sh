#!/bin/bash

while true; do
    # Prompt for input
    expression=$(wofi --dmenu --prompt "Calc (no bc)" --width 400 --height 100)

    # Exit if user cancels or input is empty
    [ -z "$expression" ] && exit

    # Clean up spacing
    cleaned_expr=$(echo "$expression" | tr -d '[:space:]')

    # Evaluate using awk
    result=$(awk "BEGIN { print ($cleaned_expr) }" 2>/dev/null)

    # Handle invalid result
    if [ -z "$result" ] || [[ "$result" == *"error"* ]]; then
        result="Invalid expression"
    fi

    # Show result and wait for user to hit enter again
    echo "$expression = $result" | wofi --dmenu --prompt "Result" --width 400 --height 100
done

