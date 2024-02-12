# __/\\\\\\\\\\\\\____/\\\\\\\\\\\\\\\__/\\\\\\\\\\\\_______/\\\\\\\\\___________/\\\\\______        
#  _\/\\\/////////\\\_\/\\\///////////__\/\\\////////\\\___/\\\///////\\\_______/\\\///\\\____       
#   _\/\\\_______\/\\\_\/\\\_____________\/\\\______\//\\\_\/\\\_____\/\\\_____/\\\/__\///\\\__      
#    _\/\\\\\\\\\\\\\/__\/\\\\\\\\\\\_____\/\\\_______\/\\\_\/\\\\\\\\\\\/_____/\\\______\//\\\_     
#     _\/\\\/////////____\/\\\///////______\/\\\_______\/\\\_\/\\\//////\\\____\/\\\_______\/\\\_    
#      _\/\\\_____________\/\\\_____________\/\\\_______\/\\\_\/\\\____\//\\\___\//\\\______/\\\__   
#       _\/\\\_____________\/\\\_____________\/\\\_______/\\\__\/\\\_____\//\\\___\///\\\__/\\\____  
#        _\/\\\_____________\/\\\\\\\\\\\\\\\_\/\\\\\\\\\\\\/___\/\\\______\//\\\____\///\\\\\/_____ 
#         _\///______________\///////////////__\////////////_____\///________\///_______\/////_______


export ZSH=/usr/share/oh-my-zsh/

# ZSH_THEME="dogenpunk"
 ZSH_THEME="afowler"
# ZSH_THEME="lambda"
# ZSH_THEME="half-life"
# ZSH_THEME="norm"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

setopt GLOB_DOTS

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# export HISTCONTROL=ignoreboth:erasedups

# Make neovim the default editor

export EDITOR='nvim'
export VISUAL='nvim'

#PS1='[\u@\h \W]\$ '

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

#list
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -la'
alias l='ls'
alias l.="ls -A | egrep '^\.'"

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#readable output
alias df='df -h'

#pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"

#arcolinux logout unlock
alias rmlogoutlock="sudo rm /tmp/arcologout.lock"

#free
alias free="free -mt"

#use all cores
alias uac="sh ~/.bin/main/000*"

#continue download
alias wget="wget -c"

#userlist
alias userlist="cut -d: -f1 /etc/passwd"

#merge new settings
alias merge="xrdb -merge ~/.Xresources"

#ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#add new fonts
alias update-fc='sudo fc-cache -fv'

#copy/paste all content of /etc/skel over to home folder - backup of config created - beware
alias skel='cp -Rf ~/.config ~/.config-backup-$(date +%Y.%m.%d-%H.%M.%S) && cp -rf /etc/skel/* ~'
#backup contents of /etc/skel to hidden backup folder in home/user
alias bupskel='cp -Rf /etc/skel ~/.skel-backup-$(date +%Y.%m.%d-%H.%M.%S)'

#copy bashrc-latest over on bashrc - cb= copy bashrc
#alias cb='sudo cp /etc/skel/.bashrc ~/.bashrc && source ~/.bashrc'
#copy /etc/skel/.zshrc over on ~/.zshrc - cb= copy zshrc
alias cz='sudo cp /etc/skel/.zshrc ~/.zshrc && exec zsh'

#switch between bash and zsh
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"

#hardware info --short
alias hw="hwinfo --short"

#check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

#get fastest mirrors in your neighborhood
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 30 --number 10 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 30 --number 10 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 30 --number 10 --sort age --save /etc/pacman.d/mirrorlist"

#youtube-dl
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "

alias ytv-best="youtube-dl -f bestvideo+bestaudio "

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

#Cleanup orphaned packages
# alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

#search content with ripgrep
alias rg="rg --sort path"

#get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#maintenance
alias big="expac -H M '%m\t%n' | sort -h | nl"
alias downgrada="sudo downgrade --ala-url https://bike.seedhost.eu/arcolinux/"

#systeminfo
alias probe="sudo -E hw-probe -all -upload"

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#create a file called .zshrc-personal and put all your personal aliases
#in there. They will not be overwritten by skel.

[[ -f ~/.zshrc-personal ]] && . ~/.zshrc-personal

#alias marcusScript="/home/pedro/Documents/dev/scripts/marcusScript/marcus.sh"
#marcusScript

 # >>> conda initialize >>>
 # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/pedro/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
 #    eval "$__conda_setup"
# else
 #    if [ -f "/home/pedro/anaconda3/etc/profile.d/conda.sh" ]; then
 #        . "/home/pedro/anaconda3/etc/profile.d/conda.sh"
 #    else
 #        export PATH="/home/pedro/anaconda3/bin:$PATH"
 #    fi
# fi
# unset __conda_setup
 # <<< conda initialize <<<

# cd alias
alias data="cd /mnt/Data"
alias notes="cd /home/pedro/Documents/notes"
alias vid="/home/pedro/Videos"
alias yt="yt-dlp -f mp4" # Update using python3 -m pip install -U yt-dlp
alias yt-mp3="yt-dlp -x --audio-format mp3" # python3 -m pip install -U yt-dlp
alias back="/mnt/Data/trilha_backend_desafios"
alias rfm="ranger"
alias teste="/mnt/Data/tests"
alias ivpn="/opt/ivpn/ui/bin/ivpn-ui"
alias book="$HOME/Documents/books/"
alias cs="$HOME/Documents/books/cs/"
alias cslang="$HOME/Documents/books/cs/languages"
alias anime="/mnt/Data/video/anime/"
alias music="mocp"
alias vi="nvim"
alias studies="/mnt/Data/studies"
# alias neofetch="neofetch --source /home/pedro/Pictures/ascii/shark.txt"
alias movie="/mnt/Data/video/movie"
alias html="xdg-open"
alias gameboy="vbam -F"
alias games="/mnt/Data/games"
# alias discord="/home/pedro/Downloads/src/discord/Discord/Discord&disown"
alias dev="/mnt/Data/dev"
alias monitor="/home/pedro/.scripts/monitor.sh"
alias monitor-right="/home/pedro/.scripts/monitor-right.sh"
alias ads="/home/pedro/Documents/ads"
alias chromecss="/home/pedro/.librewolf/8bop33mn.default-release/chrome/"
alias emacs="emacs -nw"
alias akira="~/Downloads/src/Akira/build/src/com.github.akiraux.akira"

# open a new instance of st in the same location
alias nst="st >/dev/null 2>&1 & disown"

# open a new instance of alacritty in the same location
alias nala="alacritty >/dev/null 2>&1 & disown"

# opens thunar and disowns it
alias thunar="thunar & disown"

# npm 
# this creates and exports a directory for globally installed packages
# if it is the first time use, also run
# npm config set prefix './.npm-packages'
export PATH="$PATH:$HOME/.npm-packages/bin"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# Angular
#alias ng="~/.npm-packages/bin/ng"

# http-server
#alias www="~/.npm-packages/bin/http-server"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Go
export PATH="$HOME/go/bin:$PATH"

# Flutter
export PATH=~/Downloads/src/flutter/bin/:$PATH

# Node
#export PATH="$HOME/.npm-packages/bin"

# NestJS
#alias nest="~/.npm-packages/bin/nest"

#Ruby
#export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
#export PATH="$PATH:$GEM_HOME/bin"

# Rails
# alias rails="~/.local/share/gem/ruby/3.0.0/bin/rails"

# Restart picom
repicom() {
	killall picom
	picom --config ~/.config/dwm/picom.conf & 
	disown
}

# Disables history
SAVEHIST=0
HISTSIZE=0

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# alacritty
# WINIT_X11_SCALE_FACTOR=1.66

alias mp4-to-mp3="~/dev/go/mp4-to-mp3/mp4-to-mp3"


[ -f "/home/pedro/.ghcup/env" ] && source "/home/pedro/.ghcup/env" # ghcup-env

# opam configuration
[[ ! -r /home/pedro/.opam/opam-init/init.zsh ]] || source /home/pedro/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# Android  
export ANDROID_HOME=/home/pedro/.Android/sdk/
# export ANDROID_HOME=/opt/android-sdk/
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/platform-tools

# bun completions
[ -s "/home/pedro/.bun/_bun" ] && source "/home/pedro/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# flutter
export PATH="$PATH:$HOME/Downloads/src/flutter/bin/"

# qt theme
export QT_QPA_PLATFORMTHEME=qt6ct
