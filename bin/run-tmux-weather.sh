#!/bin/bash

tmux new -d -s my-session 'echo core; ./monitor.sh ~/devices/core fk-core.bin core' \; \
    new-window -d 'echo weather; ./monitor.sh ~/devices/weather fk-weather-module.bin weather' \; \
    new-window -d 'echo core; touch core.log && tail -f core.log' \; \
    new-window -d 'echo weather; touch weather.log && tail -f weather.log' \;
