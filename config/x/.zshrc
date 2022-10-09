# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
eval "$(ssh-agent)" >>/dev/null
source $HOME/.profile
# Path to your oh-my-zsh installation.
#export ZSH="$HOME/.oh-my-zsh"

export PATH=$HOME/.local/bin:$PATH
source $HOME/.zsh/spaceship-prompt/spaceship.zsh-theme
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh/zsh-z/zsh-z.plugin.zsh
# source $HOME/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh

bindkey '^ ' autosuggest-accept
bindkey -s '^P' 'change-colorscheme.sh^M'

ZSH_THEME="spaceship"
SPACESHIP_DIR_TRUNC_REPO=false
SPACESHIP_PACKAGE_SYMBOL=' '
SPACESHIP_VI_MODE_COLOR='dark'
SPACESHIP_DIR_COLOR=blue

plugins=(
	z
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	# vi-mode
)

ZSH_DISABLE_COMPFIX=true
#ufetch
alias ls='exa -l --icons --group-directories-first'
alias la='exa -la --icons --group-directories-first'
alias shutdown='systemctl poweroff -i'
alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
alias cat='bat'

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[6 q';; # beam
    esac
}

zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[6 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[6 q' ;} # Use beam shape cursor for each new prompt.

# bindkey -v
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;
export PATH=/home/$USER/.config/nvcode/utils/bin:$PATH
setopt autocd

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/.miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/.miniconda/etc/profile.d/conda.sh" ]; then
        . "$HOME/.miniconda/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/.miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export GTK_IM_MODULE=xim
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
# Dành cho những phần mềm dựa trên qt4
export QT4_IM_MODULE=ibus
# Dành cho những phần mềm dùng thư viện đồ họa clutter/OpenGL
export CLUTTER_IM_MODULE=ibus
export GLFW_IM_MODULE=ibus
export CHROME_EXECUTABLE=chromium

# cd () { builtin cd "$@" && chpwd; }
# unset_all_project_settings () {
#   # do whatever it takes to undo the effect of projectSettings.bash,
#   # e.g. unset variables, remove PATH elements, etc.
# }
chpwd () {
  case $PWD in
    (*/tomia-web-ui) ssh-add $HOME/.ssh/ceres && nave use 16
  esac
}

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# bun completions
[ -s "/home/nick/.bun/_bun" ] && source "/home/nick/.bun/_bun"

# bun
export BUN_INSTALL="/home/nick/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

[ -s "/home/nick/.jabba/jabba.sh" ] && source "/home/nick/.jabba/jabba.sh"
