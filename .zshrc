# --------------------- begin-default ohmyzsh zsrhc ---------------------------
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.


if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

plugins=(
  git
  copypath
  aliases
  fzf
  # z
  aws
  kubectl
  kubectx
  # kube-ps1
  terraform
  helm
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
# --------------------- end-default ohmyzsh zsrhc ---------------------------

# p10k prompt
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
# source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# antigen
# source $(brew --prefix)/share/antigen/antigen.zsh
#antigen use oh-my-zsh
#antigen bundle copypath
#antigen bundle aliases
#antigen bundle fzf
#antigen bundle z
#antigen bundle tmux
#antigen bundle aws
#antigen bundle kubectl
#antigen bundle kubectx
#antigen bundle terraform
#antigen bundle helm
#antigen bundle zsh-users/zsh-autosuggestions
#antigen bundle zsh-users/zsh-syntax-highlighting

#antigen theme romkatv/powerlevel10k
#antigen apply

# dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.git-dotfiles/ --work-tree=$HOME'
alias config-lg='lg -g $HOME/.git-dotfiles/ -w $HOME'
config config --local status.showUntrackedFiles no

# iterm2
# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dotfiles/iterm2_preferences"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# exa
alias l='exa -l --all --classify --group-directories-first --color=auto --git --icons --no-time --no-user --no-permissions --no-filesize'
alias ls='exa -l --group-directories-first --color=auto --git --icons --no-permissions --no-user'
alias ll='exa -lahF --group-directories-first --color=auto --git --icons'
alias lt='exa --tree --color=auto --git-ignore --group-directories-first --sort=type --icons --no-permissions --no-user -L'

# bat
# export BAT_THEME="gruvbox-dark"
alias cat='bat --style=plain --paging=never' # clear

# clear
alias c='clear'

# vim
export TERM="xterm-256color"
alias v="nvim"
alias vim="nvim"
export PATH="$HOME/.local/bin":$PATH
export EDITOR="lvim"
export GIT_EDITOR="lvim"
export VISUAL="lvim"
export KUBE_EDITOR=lvim

# fzf
export FZF_BASE=/opt/homebrew/opt/fzf
# fzf-rosepine https://github.com/rose-pine/fzf/blob/main/dist/rose-pine.sh
export FZF_DEFAULT_OPTS="
        --color=fg:#908caa,bg:#191724,hl:#ebbcba
        --color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
        --color=border:#403d52,header:#31748f,gutter:#191724
        --color=spinner:#f6c177,info:#9ccfd8,separator:#403d52
        --color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
# export FZF_DEFAULT_OPTS="--height 50% \
#   --preview='bat --color=always --style=numbers {}' \
#   --layout=reverse --info=inline --border \
#   --color=bg+:#3c3836,bg:#32302f,spinner:#fb4934,hl:#928374,fg:#ebdbb2,header:#928374,info:#8ec07c,pointer:#fb4934,marker:#fb4934,fg+:#ebdbb2,prompt:#fb4934,hl+:#fb4934 \
#   --bind shift-up:preview-page-up,shift-down:preview-page-down,up:preview-up,down:preview-down"

# git
alias g='git'
alias gs='git status --untracked-files --short --branch'
alias ga='git add --verbose'
# alias gc='cz commit'
alias gc='g cz'
alias gl='git log --oneline'
alias g2l="git log --graph --pretty=format:'%C(yellow)%h%C(cyan)%d%Creset %s %C(green)- %an, %cr%Creset'"
alias g3l="git log --graph --pretty=format:'%C(yellow)%h%C(cyan)%d%Creset %s %C(green)- %an, %cr%Creset' --name-status"
alias g4l="git log --graph --stat --oneline"
alias g5l="git log --oneline -p"
alias gsh='git show'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdh='git diff HEAD'
alias gls='git ls-files'
alias gck='git checkout'
alias gp='git pull'
alias gP='git push'

# k8s
alias k="kubectl"
alias kns=kubens
alias kcx=kubectx
chmod +x $(brew list kube-ps1)
source "/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh"
PS1='$(kube_ps1)'$PS1
alias kon="kubeon" #turn on kube-ps1 status for this shell
alias koff="kubeoff"
koff # disable kube prompt
export XDG_CONFIG_HOME="$HOME/.config"

# terraform
alias tfaa='terraform apply -auto-approve'

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# lazygit
alias lg='lazygit'

# autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
#  an use <C-f> iterm keybind to use jj
jj () {
  # search in recent directories 
  dir=$(j -s | grep '/' | cut -d':' -f2 | awk '{$1=$1};1' | fzf)
  cd $dir
}

# delete nvim swap files
rm -rf ~/.local/state/nvim/swap


