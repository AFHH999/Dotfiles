# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="lambda"

plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux

#LS replacement
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

#System and package management
alias update='yay -Syu'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'
alias clean='sudo pacman -Rns'
alias install='sudo pacman -S'
alias se='pacman -Ss'
alias files='pacman -Ql'
alias specs='sudo inxi -Fxz'
alias audit='sudo lynis audit system'
alias firewall='sudo systemctl start ufw'
alias battery='sudo systemctl start auto-cpufreq'
alias poweroff='shutdown -h now'
alias yz='yazi'

#Productivity & Utilities
alias vi='nvim'
alias zshrc='nvim ~/.zshrc'
alias reload='source ~/.zshrc'
alias ex='exit'
alias f='fzf'
alias ff='fastfetch'
alias clima="curl 'wttr.in?format=4'"
alias path='echo $PATH | tr ":" "\n"'
alias G='gemini'
alias hist='history | grep'
alias checksec='checksec --file='
alias t='tmux'
alias cls='clear'

#Networking & IP info
alias ac='ss -tunap'
alias nc='ss -tunalp'
alias Ping='ping -c 45 8.8.8.8'
alias myip='curl ifconfig.me'
alias lanip='ip a | grep inet'

#File navigation
alias ..='cd ..'
alias ...='cd ../..'

#Safety Replacements
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

#Git
alias g='git'
alias gs='git status'
alias ga='git add'
alias gcm='git commit -m'
alias gcl='git clone'
alias gp='git push'
alias gpl='git pull'
alias gl='git log --oneline --graph --decorate'
alias gco='git checkout'
alias gb='git branch'
alias gd='git diff'
alias C=' ~/Code/bash/ChtII.sh' # For the utils add /: at the begining of the action.
alias yt='/usr/bin/youtube-music'
alias M='rmpc'
alias search='sudo pacman -Q | grep'

alias YC="cal -y"

alias zbr="zig build run"
alias zr="zig run"
alias nru="2>/dev/null"
alias cr="cargo run -j 8"
alias cb="cargo build -j 8"
alias cbt="export NO_STRIP=1 && cargo tauri build -- -j 8"

alias N="ncdu"

export PATH="$HOME/.local/bin:$PATH"
# Shell Behavior & EDITOR
export EDITOR='nvim'
export MANPAGER='nvim +Man! +"set number relativenumber"'

bindkey -v

#History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Load external Configs
# Dart CLI autocompletion
[[ -f /home/afhh/.dart-cli-completion/zsh-config.zsh ]] && source /home/afhh/.dart-cli-completion/zsh-config.zsh

# Load API keys or secrets
[ -f ~/.config/secrets.sh ] && source ~/.config/secrets.sh
source <(COMPLETE=zsh jj)
source <(fzf --zsh)
eval "$(zoxide init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=$PATH:$(go env GOPATH)/bin
