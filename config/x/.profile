export EDITOR=/usr/bin/vim
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export PATH=~/.npm-global/bin:$PATH
export TERMINAL="/usr/bin/alacritty"
export BROWSER="/usr/bin/microsoft-edge-beta"
export THEME="dark"
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
export JAVA_HOME="$HOME/.local/share/jdk-11.0.15.1"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export REPO_OS_OVERRIDE='linux'
export PROJECT='$HOME/Documents/projects'
export ANDROID_HOME="$XDG_DATA_HOME"/android
export HISTFILE="${XDG_STATE_HOME}"/bash/history
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
setopt appendhistory
# export LESS_TERMCAP_mb=$'\e[1;32m'
# export LESS_TERMCAP_md=$'\e[1;32m'
# export LESS_TERMCAP_me=$'\e[0m'
# export LESS_TERMCAP_se=$'\e[0m'
# export LESS_TERMCAP_so=$'\e[01;33m'
# export LESS_TERMCAP_ue=$'\e[0m'
# export LESS_TERMCAP_us=$'\e[1;4;31m'

# if running bash
if [ -n "$BASH_VERSION" ]; then
	# include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
	fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
	    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
	    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes cargo's bin if it exists
if [ -d "$CARGO_HOME/bin" ] ; then
	PATH="$CARGO_HOME/bin:$PATH"
fi

# set PATH so it includes gem packages
if [ -d "$HOME/.gem/ruby/2.7.0/bin" ] ; then
	PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
fi

if [ -d "$HOME/.local/share/gem/ruby/3.0.0/bin" ] ; then
  PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
fi

# set PATH so it includes .dotnet
if [ -d "$HOME/.dotnet" ] ; then
  PATH="$HOME/.dotnet:$PATH"
fi

if [ -d "$HOME/.miniconda" ]; then
  PATH="$HOME/.miniconda/bin:$PATH"
fi

if [ -d "$HOME/.local/share/flutter/bin" ]; then
  PATH="$HOME/.local/share/flutter/bin:$PATH"
fi

if [ -d "$HOME/Android/Sdk/cmdline-tools/latest/bin" ]; then
  PATH="$HOME/Android/Sdk/cmdline-tools/latest/bin:$PATH"
fi

if [ -d "$HOME/Android/Sdk/platform-tools/" ]; then
  PATH="$HOME/Android/Sdk/platform-tools:$PATH"
fi

if [ -d "$HOME/.local/share/jre1.8.0_321/bin" ]; then
  PATH="$HOME/.local/share/jre1.8.0_321/bin:$PATH"
fi

if [ -d "$HOME/.pub-cache/bin" ]; then
  PATH="$HOME/.pub-cache/bin:$PATH"
fi

if [ -d "$HOME/go/bin" ]; then
  PATH="$HOME/go/bin:$PATH"
fi
