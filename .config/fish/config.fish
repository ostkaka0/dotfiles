if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

    alias mine_eth="~/apps/gminer/mine_eth"
    alias mine_raven="~/apps/gminer/mine_raven"
    alias new="~/new.sh"
    alias hx="helix"
    alias hypr="sh /home/ost/starthypr.sh"
    alias swy="sh /home/ost/startsway.sh"
    alias make="make -j32"
    alias split_h="~/scripts/split_h.sh"
    alias py=python
    alias lpoweroff="loginctl poweroff"
    alias lreboot="loginctl reboot"
    abbr -a dotfiles "git --git-dir=$HOME/.dotfiles --work-tree=$HOME/"

    set -x PATH "$HOME/git/Odin/" $PATH
    set -x PATH "$HOME/git/ols/" $PATH

    set fish_prompt_pwd_dir_length 0

    # if test -f /home/ost/.ghcup/env
    #     source /home/ost/.ghcup/env
    # end
    set -x PATH $HOME/.ghcup/bin $PATH
    # set -x PATH $HOME/.ghcup/bin $PATH
end

set GNUMAKEFLAGS -j23
set MAKEFLAGS -j 23

alias terminal="kitty"#gnome-terminal

set term kitty
set EDITOR helix
set VISUAL helix
set ANDROID_NDK_HOME /home/ost/Android/Sdk/ndk/25.1.8937393/
set ANDROID_SDK_ROOT /home/ost/Android/Sdk/
set ANDROID_HOME /home/ost/Android/Sdk/

set -x PATH $ANDROID_HOME $PATH
set -x PATH "$HOME/MATLAB/bin" $PATH

# Mojo
set -x LD_LIBRARY_PATH ~/.local/lib/mojo $LD_LIBRARY_PATH
set -x PATH $HOME/.modular/pkg/packages.modular.com_mojo/bin/ $PATH
set -x PATH $HOME/.modular/bin/ $PATH

#Wine
set WINEFSYNC 1

#Wayland
set XWAYLAND_NO_GLAMOR 1
set WLR_NO_HARDWARE_CURSORS 1
set WLR_RENDERER_ALLOW_SOFTWARE 1
#set LIBSEAT_BACKEND logind
set MOZ_ENABLE_WAYLAND 1
set WLR_RENDERER vulkan
magic completion --shell fish | source

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/ost/.opam/opam-init/init.fish' && source '/home/ost/.opam/opam-init/init.fish' >/dev/null 2>/dev/null; or true
# END opam configuration
