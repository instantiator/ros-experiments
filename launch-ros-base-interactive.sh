#!/bin/bash

set -e
set -o pipefail

scripts-host-init/install-prerequisites-osx.sh

# initialise UI components:
# X11 applications running in docker can reach XQuartz through socat
# See: https://cntnr.io/running-guis-with-docker-on-mac-os-x-a14df6a76efc

echo
echo "⚙️ starting xquartz..."
open -a Xquartz
echo "✅ xquartz running"

echo "⚙️ starting socat..."
# socat set to listen on port 6000. Convention for X11 is 6000 + display number (here, 0).
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &
echo "✅ listen on port: 6000, send to: $DISPLAY"

HOST_IP=$(ipconfig getifaddr en0)

echo "⚙️ DISPLAY=$HOST_IP:0"
echo "⚙️ starting docker container..."
# DISPLAY set to IP of the host, screen 0 (connected by socat to $DISPLAY on the host - the unix socket for X11)
docker run -it --rm --name ROS --volume "`pwd`/scripts-docker-runtime:/scripts" -e DISPLAY=$HOST_IP:0 instantiator:ros-base
