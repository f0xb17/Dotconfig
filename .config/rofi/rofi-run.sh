#!/bin/bash

rofi -show drun -icon-theme "WhiteSur-dark" -show-icons -normal-window 2>&1 | tee /tmp/rofi-run.log
exit 0
