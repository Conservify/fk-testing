#!/bin/bash

set -xe

BUILD=/tmp/working/fk-build

pushd ~/conservify/flasher
make GOARCH=arm BUILD=$BUILD
popd

pushd ~/fieldkit/app-protocol
make GOARCH=arm BUILD=$BUILD
popd

pushd ~/fieldkit/testing
make GOARCH=arm BUILD=$BUILD
ssh weather-pi 'mkdir -p ~/tools/bin'
popd

mv $BUILD/linux-arm/* $BUILD/
rmdir $BUILD/linux-arm

pushd ~/fieldkit/testing
rsync -zvua --progress bin/monitor.sh weather-pi:
rsync -zvua --progress bin/run-tmux-weather.sh weather-pi:
rsync -zvua --progress bin/flash-* weather-pi:
rsync -zvua --progress $BUILD/* weather-pi:tools/bin
popd
