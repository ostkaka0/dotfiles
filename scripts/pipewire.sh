#!/bin/bash

# set -o xtrace

#killall -wq wireplumber pipewire-pulse pipewire

# until pgrep -u $UID -f /usr/lib/xdg-desktop-portal >/dev/null; do sleep 0.01; done
until pgrep -fx /usr/lib/xdg-desktop-portal >/dev/null; do sleep 0.01; done

echo "---" | tee -a /tmp/{wireplumber.log,pipewire.log,pipewire-pulse.log}

/usr/bin/pipewire 2>&1 | tee -a /tmp/pipewire.log & disown
/usr/bin/wireplumber 2>&1 | tee -a /tmp/wireplumber.log & disown
/usr/bin/pipewire-pulse 2>&1 | tee -a /tmp/pipewire-pulse.log & disown
