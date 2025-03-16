#!/bin/bash
export WLR_NO_HARDWARE_CURSORS=1
export WLR_RENDERER_ALLOW_SOFTWARE=1

export XCURSOR_SIZE=24
export LIBSEAT_BACKEND=logind
export MOZ_ENABLE_WAYLAND=1
export WLR_RENDERER=vulkan

QT_QPA_PLATFORM=wayland XDG_SESSION_TYPE=wayland dbus-run-session cosmic-session

