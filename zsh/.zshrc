# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"
typeset -U path # Keep PATH unique (removes duplicates automatically)
ZSH_THEME="lambda"

plugins=(
	git
	archlinux
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Shell Behavior & Options
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt APPEND_HISTORY
bindkey -v

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Editor Settings
export EDITOR='nvim'
export MANPAGER='nvim +Man! +"set number relativenumber"'

# LS replacement
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# System and package management
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
alias OFF='shutdown -h now'
alias yz='yazi'

# Productivity & Utilities
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
alias cl='clear'
alias docker='podman'

# Networking & IP info
alias ac='ss -tunap'
alias nc='ss -tunalp'
alias Ping='ping -c 45 8.8.8.8'
alias myip='curl ifconfig.me'
alias lanip='ip a | grep inet'

# File navigation
alias ..='cd ..'
alias ...='cd ../..'

# Safety Replacements
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Git
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
alias M='rmpc'
alias search='sudo pacman -Q | grep'

alias YC="cal -y"

alias zbr="zig build run"
alias zr="zig run"
alias nru="2>/dev/null"

alias cr="cargo run -j 8"
alias cb="cargo build -j 8"
alias cc="cargo clippy"
alias N="ncdu"

# Trash alias
alias tp="trash-put"
alias tl="trash-list"
alias tr="trash-restore"
alias trm="trash-rm"
alias te="trash-empty"

# To use PowerShell
alias pw="pwsh"

# Expand aliases after sudo
alias sudo='sudo '

# Functions
function engage(){
	# 1. Sanity check
	if [ -z "$1" ]; then
		echo "Error: missing target name!"
		echo "usage: engage <target_name>"
		return 1
	fi

	local TARGET=$1
	local BASE_DIR="$HOME/CTFs/$TARGET"
	local OBSIDIAN_NOTE="$BASE_DIR/${TARGET}.md"

	# 2. Build the unified infrastructure
	mkdir -p "$BASE_DIR"/{nmap,exploits,loot}

	# 3. Generate the synthesis layer (template)
	if [ ! -f "$OBSIDIAN_NOTE" ]; then
		cat <<- EOF > "$OBSIDIAN_NOTE"
		# TARGET: $TARGET
		## 1. Enumeration
		## 2. Foothold
		## 3. Privilege Escalation
		EOF
	fi

	# 4. Deployment
	cd "$BASE_DIR" || return

	# 5. Recorder
	echo "[+] CTF workspace ready!"
	script -q -a "raw_hacking_${TARGET}.log"
}

# Environment Variables Init
export GOPATH="$HOME/go"
export NVM_DIR="$HOME/.nvm"
export BUN_INSTALL="$HOME/.bun"

# Unified PATH Construction
# typeset -U path already ensures uniqueness
export PATH="$HOME/.local/share/nvim/mason/bin:$HOME/.local/bin:/usr/local/go/bin:$GOPATH/bin:$BUN_INSTALL/bin:$HOME/.npm-global/bin:$HOME/.cargo/bin:$PATH"

# Load External Configs & Tool Completions
[[ -f ~/.dart-cli-completion/zsh-config.zsh ]] && source ~/.dart-cli-completion/zsh-config.zsh
source <(COMPLETE=zsh jj)
source <(fzf --zsh)
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"

# NVM & Bun loaders
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# Secrets (Loaded last to allow overrides)
[ -f ~/.config/secrets.sh ] && source ~/.config/secrets.sh
[ -f ~/.zshrc_secrets ] && source ~/.zshrc_secrets


# Added by Antigravity CLI installer
export PATH="/home/afhh/.local/bin:$PATH"
