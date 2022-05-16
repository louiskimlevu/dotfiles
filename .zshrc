# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
#-----------------------------------------------------------------
# antigen
source $(brew --prefix)/share/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle fzf
antigen bundle z
antigen bundle MichaelAquilina/zsh-auto-notify
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme romkatv/powerlevel10k
antigen apply

# iterm2
# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dotfiles/iterm2_preferences"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# exa
alias ls='exa -l --group-directories-first --color=auto --git --icons --no-permissions --no-user'
alias ll='exa -lahF --group-directories-first --color=auto --git --icons'
alias tree='exa --tree -lahF --icons --color=auto -L'

# bat
export BAT_THEME="gruvbox-dark"
alias cat='bat --paging=never'
# clear
alias c="clear"

# fzf
export FZF_BASE=/opt/homebrew/opt/fzf
export FZF_DEFAULT_OPTS="--height 50% \
  --preview='bat --color=always --style=numbers {}' \
  --layout=reverse --info=inline --border \
  --color=bg+:#3c3836,bg:#32302f,spinner:#fb4934,hl:#928374,fg:#ebdbb2,header:#928374,info:#8ec07c,pointer:#fb4934,marker:#fb4934,fg+:#ebdbb2,prompt:#fb4934,hl+:#fb4934 \
  --bind shift-up:preview-page-up,shift-down:preview-page-down,up:preview-up,down:preview-down"

# git
alias g='git'

# default editor
export EDITOR="vim"
export GIT_EDITOR="vim"
export VISUAL="vim"

# tmux
tmux source-file ~/.tmux.conf

# dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no


#-----------------------------------------------------------------
# p10k
source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
