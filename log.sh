#!/usr/bin/env bash

log=$(tac "$WHATNEXT_HISTORY")
current_entry=$(echo "$log" | wc -l )
IFS='
'
for i in $log
do
    date=$(echo $i | cut -d '|' -f1)
    subject=$(echo $i | cut -d '|' -f2)
    description=$(echo $i | cut -d '|' -f3)
    echo -e "$WN_COLOR_ORANGE $current_entry $WN_COLOR_TITLE $subject $WN_COLOR_RESET"
    echo "Date:     $date"
    echo "      $description"
    echo ""
    current_entry=$(( $current_entry - 1 ))

done

