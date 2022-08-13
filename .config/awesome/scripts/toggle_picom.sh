#!/bin/env bash
# Enable/disable compositor

SERVICE="picom"
if pgrep -x "$SERVICE" >/dev/null
then
    kill $(pgrep -x "$SERVICE")
else
    picom &
    #picom &
fi