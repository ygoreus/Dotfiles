#### --------------------------------------------------------------------------------------
#### --   file > ~/.zshrc
#### -- author > ygoreus
#### -- vim: set fenc=utf-8 ft=zsh syn=zsh rnu nu ai ts=4 sw=4 et :
#### --------------------------------------------------------------------------------------

###########################################################################################
###################################   general settings   ##################################
###########################################################################################

## set to do naught if not running interactively
[[ $- != *i* ]] && return

## history settings
export HISTFILE="/home/ygoreus/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=5000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_SAVE_NO_DUPS
#setopt HIST_VERIFY
#setopt INC_APPEND_HISTORY
#setopt EXTENDED_HISTORY
setopt appendhistory

## sets the basic zsh options needed for sanity
setopt autocd
setopt extendedglob
setopt nomatch
#setopt complete_aliases
setopt correct
setopt no_correctall
DISABLE_AUTO_TITLE=true
COMPLETION_WAITING_DOTS="true"
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
unsetopt beep notify

## allow bash functions to run
#autoload bashcompinit
#bashcompinit

## load basic completions
autoload -Uz compinit
compinit

## autoload the prompt
#autoload -U promptinit
#promptinit

## set keybind behaviour needed for sanity
bindkey -v
#KEYTIMEOUT=1

## fix keybindings for linux terminal
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

## fix keybindings for xterm
bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line

## fix keybindings for rxvt-unicode
bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line

## fix keybindings for all terminals
bindkey "^R" history-incremental-search-backward
bindkey "^[[3~" delete-char
bindkey "^[[2~" overwrite-mode
bindkey "^[[5~" beginning-of-history
bindkey "^[[6~" end-of-history
bindkey "^K" kill-whole-line

#zstyle ':completion:*' menu select

## fixes cursor postion
#autoload -U history-search-end
#zle -N history-beginning-search-backward-end history-search-end
#zle -N history-beginning-search-forward-end history-search-end

## prevent protected characters
#zle -A kill-whole-line vi-kill-line
#zle -A backward-kill-word vi-backward-kill-word
#zle -A backward-delete-char vi-backward-delete-char

## auto quote urls for various functions / commands
#autoload -U url-quote-magic
#zstyle ':urlglobber' url-other-schema ftp git http https magnet
#zstyle ':url-quote-magic:*' url-metas '*?[]^(|)~#='
#zle -N self-insert url-quote-magic

##-- Begin Testing Grounds

color-blocks () {
    echo
    local width=$(( ($COLUMNS / 16) -1 ))
    local chars
    local pre=$(( ( $COLUMNS - ($width+1)*16)/2 ))
    for ((i=0; i<$width; i++)); do chars+="░" ; done
    for ((i=0; i<$pre; i++)); do echo -n " " ; done
    for ((i=0; i<=7; i++)); do echo -en "\e[3${i}m${chars} \e[1;3${i}m${chars}\e[m "; done; echo; echo
    unset i
}







rmd () {
    pandoc $1 | lynx -stdin
}

##-- End Testing Grounds

############################################################################################
######################################   variables   #######################################
############################################################################################

## set local variables
#export LC_ALL=''
#export LC_COLLATE=''
export WM='/usr/bin/i3'
export EDITOR='/usr/bin/vim'
export FCEDIT='/usr/bin/vim'
export VISUAL='/usr/bin/vim'
export SUDO_EDITOR='/usr/bin/rvim --noplugin'
export BROWSER='/usr/bin/luakit'
export SDCV_PAGER='/usr/bin/vimpager'
export SYSTEMD_PAGER='/usr/bin/less -j4aR'
export PAGER='/usr/bin/vimpager'
export MOVPLAY='/usr/bin/mpv'
export SNDPLAY='/usr/bin/mpv'
export PICVIEW='/usr/bin/feh'
export TERMINAL='/usr/bin/urxvtc'

## set default directories
[[ $XDG_CACHE_HOME ]] || export XDG_CACHE_HOME="$HOME/.cache"
[[ $XDG_CONFIG_HOME ]] || export XDG_CONFIG_HOME="$HOME/.etc"
[[ $XDG_DATA_HOME ]] || export XDG_DATA_HOME="$HOME/.local/share"

## colour manpages in less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;35m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;30;03;36m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;34m'

## linux terminal colours


###########################################################################################
###############################   package manager aliases   ###############################
###########################################################################################


###########################################################################################
###############################   config editing aliases   ################################
###########################################################################################


alias mtd='ranger $HOME/dotfiles'

## zsh stuffs
alias eZ='vim $HOME/.zshrc'
alias eZh='vim $HOME/.zsh_history'
alias eZp='vim $HOME/.zprofile'
alias eZe='vim $HOME/.zenv'
alias eZa='vim $HOME/.zaliases'
alias eZf='vim $HOME/.zfunctions'
alias Zr='source $HOME/.zshrc'

## bash stuffs
alias eB='vim $HOME/.bashrc'
alias eBh='vim $HOME/.bash_history'
alias eBl='vim $HOME/.bash_logout'
alias eBp='vim $HOME/.bash_profile'
alias Br='source $HOME/.bashrc'

### xorg stuffs
alias eX='vim $HOME/.Xresources'
alias eXi='vim $HOME/.xinitrc'
alias eXs='vim $HOME/.xserverrc'
alias Xrm='xrdb -remove'
alias Xr='xrdb -merge $HOME/.Xresources'

### i3 wm stuffs
alias e3='vim $HOME/.i3/config'
#alias cTO='sh $HOME/.i3/scripts/change-theme-orig.sh'
#alias cTY='sh $HOME/.i3/scripts/chnage-theme-ygrs.sh'
alias eIx='vim $HOME/.i3/xinitrc'
alias eIb='vim $HOME/.i3/blocks/i3blocks.conf'
alias eIs='vim $HOME/.i3/status/i3status.conf'
alias eIc='vim $HOME/.i3/conky/conkyrc'
alias Wr='i3-msg restart'

## awesome wm stuffs
#alias eA=''
#alias eAx=''

## compiz wm stuffs
alias eC='vim $HOME/.config/compiz/compizconfig/Default.ini'
alias eCx='vim $HOME/.config/compiz/xinitrc'

## xmonad wm stuffs
#alias eH='vim $HOME/'

## openbox stuffs
alias eO='vim $HOME/.config/openbox/rc.xml'
alias eOx='vim $HOME/.config/openbox/xinitrc'
alias eOm='vim $HOME/.config/openbox/menu.xml'
alias eOa='vim $HOME/.config/openbox/autostart'
alias eOe='vim $HOME/.config/openbox/environment'
alias Or='openbox --reconfigure'

## admin stuffs
alias eP='sudo vim /etc/pacman.conf'
alias eMl='sudo vim /etc/pacman.d/mirrorlist'
alias vS='EDITOR=vim visudo'

## tmux stuffs
alias eT='vim $HOME/.tmux/tmux.conf'

## misc stuffs
alias eV='vim $HOME/.vimrc'
alias eN='vim $HOME/.nanorc'
alias eWc='vim $HOME/.weechat/weechat.conf'
alias eCp='vim $HOME/.config/compton.conf'

## display manager settings
alias eDc='vim $HOME/.cdmrc'
alias eDr='vim $HOME/.dialogrc'
alias eDs='sudo rvim --noplugin /etc/slim.conf'
alias eDss='sudo rvim --noplugin /etc/slimlock.conf'

## mpd stuffs
alias eMs='cd $HOME/.mpd/; vim ~/.mpd/mpd.conf'
alias eMp='cd $HOME/.ncmpcpp/; vim ~/.ncmpcpp/config'
alias mMs='man mpd'
alias mMp='man ncmpcpp'

## ssh
alias dim4='ssh admin@192.168.0.15'



###########################################################################################
############################   default program for filetypes   ############################
###########################################################################################


MPV=( avi cue dat fcm flac flv m3u m4 m4a m4v mkv mov mp3 mp4 mpeg mpe mpg mov MOV ogg ogm ogv rmvb sample spl ts wmv )

alias -s $^MPV='/usr/bin/mpv'

###########################################################################################
###############################   aliases for core utils   ################################
###########################################################################################

## file operations
alias mkdir='/usr/bin/mkdir -v -p'
alias cp='/usr/bin/cp -v -i'
alias rcp='/usr/bin/rsync -ah --stats --progress'
alias rm='/usr/bin/rm -v -i --preserve-root'
alias rmt='/usr/bin/mv -t ~/.local/share/Trash/files'
alias rmdir='/usr/bin/rm -rf'
alias ln='/usr/bin/ln -i -v'
alias mv='/usr/bin/mv -i -v'
alias df='/usr/bin/df -h'
alias du='/usr/bin/du -h -c'
alias s='/usr/bin/sudo'

## listing directories
alias l='/usr/bin/ls -LFh --group-directories-first --color=always'
alias ll='l -l'
alias lh='l -A'
alias la='ll -A'
alias lx='l -xb'
alias lk='l -lSr'
#alias lc='ls -ltcr'
alias lu='l -ltur'
alias lt='l -ltr'
alias lm='l -Al | more'
alias lr='l -lR'
alias lsr='/usr/bin/tree -Csu'
alias dir='l'
alias dirl='ll'
alias dirh='lh'
alias dira='la'

## changing directories | other navigation
alias   home='cd ~; clear'
alias 'cd..'='cd ..'
alias     ..='cd ..'
alias    ...='cd ../..'
alias   ....='cd ../../..'
alias  .....='cd ../../../..'
alias ......='cd ../../../../..'
alias    cdS='cd ~/.scripts'
alias    cdC='cd ~/.config'
alias    cdB='cd ~/.backups'
alias    cdP='cd ~/programming'

##



## fun stuff
alias BBR='clear; cowthink -f bender $(echo "Bite my shiny metal ASS.")'


###########################################################################################
## aliases: good for your sanity! ##
###########################################################################################

## suffix aliases

## system admin aliases
alias suspend='/usr/bin/systemctl suspend'
alias poweroff='/usr/bin/systemctl poweroff'
alias restart='/usr/bin/systemctl reboot'
alias bat-stat1='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias bat-stat2='upower -i /org/freedesktop/UPower/devices/battery_BAT1'
alias ptop='/usr/bin/sudo /usr/bin/powertop'

## colour core utils
export GREP_COLOR="1;31"
alias grep='/usr/bin/grep --color=always'
alias egrep='/usr/bin/egrep --color=always'
alias fgrep='/usr/bin/fgrep --color=always'
#if [[ -f ~/.dir_colors ]]; then
#	eval $(dircolors -b ~/.dir_colors)
#fi

## ch* options
alias chown='/usr/bin/chown --preserve-root'
alias chmod='/usr/bin/chmod --preserve-root'
alias chgrp='/usr/bin/chgrp --preserve-root'

## switch between users
alias root='sudo su'
alias ygor='su - ygoreus'

## multiplexer options and or shortcuts
alias tmux-main='/usr/bin/tmux -2 attach-session -t Main'
alias tmux-system='/usr/bin/tmux -2 attach-session -t System'
alias muxq='/usr/bin/tmux detach-client'
#alias screen-main=''
#alias screen-system=''
#alias scnq=''

## program upgrades
#if [[ -e /usr/bin/prettyping ]]; then
#	alias pping='/usr/bin/prettyping'
#else
#	alias ping3='/usr/bin/ping -c 3 8.8.8.8'
#fi
[[ -e /usr/bin/prettyping ]] && alias pping='prettyping 8.8.8.8' || alias pping='ping -c3 8.8.8.8'
alias MP='/usr/bin/ncmpcpp'
alias YT='/usr/bin/youtube-viewer'
alias NM='/usr/bin/nmtui'

## misc options and or shortcuts
alias a3='clear; archey3'
alias sf='clear; screenfetch'
alias sfs='clear; screenfetch -s'
alias tux='clear; cowthink -W 75 -f tux $(fortune)'
alias sts='sh ~/.scripts/status_system.sh'
alias 'colorscheme'='sh ~/.scripts/colourscheme.sh'
alias 'colourscheme'='sh ~/.scripts/colourscheme2.sh'
alias vi='/usr/bin/vim'
alias e='/usr/bin/vim'
alias C='clear'
alias Q='exit'
alias g='/usr/bin/grep'
alias Eg='/usr/bin/egrep'
alias Fg='/usr/bin/fgrep'
alias h='history'
alias k='kill'
alias pk='pkill'
alias kA='killall'
alias 'CP-temps'='watch -n 1 -d sensors coretemp-isa-0000'


###########################################################################################
## shell functions ##
###########################################################################################

## updates, requires cower, pacaur, etc
function pkg () {
  case $1 in
    # check for updates
    "-c"|"-check")
      RU=$(checkupdates | wc -l)
      echo "There are "$RU" available official updates..."
      echo $RU > /tmp/pkg_upgrades
      pkill -SIGRTMIN+22 i3blocks
    ;;
    # build an aur package
    #
    #
    #
    #
    # list updates
    "-l"|"-list")
      (echo "\n   Official packages...\n"
      checkupdates
      ) | vimpager
    ;;
    # search repositories
    "-se"|"-search")
      (echo "\n   Official packages... \n"
      pacman -Ss $2
      ) | vimpager
    ;;
    # query local system
    "-qe"|"-query")
      pacman -Qs $2
    ;;
    # install local package
    "-u"|"-local")
      sudo pacman -U ${@:2}
    ;;
    # print info for package
    "-si"|"-sinfo")
      pacaur -Si ${@:2}
    ;;
    # print info for local package
    "-qi"|"-qinfo")
      pacman -Qi ${@:2}
    ;;
    # remove package
    "-r"|"-remove")
      sudo pacman -R ${@:2}
    ;;
    # remove package, configs, and unecessary deps
    "-ra"|"-remove-all")
      sudo pacman -Rns ${@:2}
    ;;
    # remove package, and configs
    "-rc"|"-remove-conf")
      sudo pacman -Rn ${@:2}
    ;;
    # sync repositories
    "-s"|"-sync")
      sudo pacman -Sy
    ;;
    # force sync repositories
    "-fs"|"-fsync")
      sudo pacman -Syy
    ;;
    # install a packages, packages
    "-i"|"-install")
      sudo pacman -S ${@:2}
    ;;
    "-U"|"-upgrade")
      sudo pacman -Su
      AR=$(cower -u | wc -l)
      RP=$(checkupdates | wc -l)
      echo $AR > /tmp/aur_upgrades
      echo $RP > /tmp/pkg_upgrades
      pkill -SIGRTMIN+22 i3blocks
    ;;
    *)
      echo " Sorry buddy, \n'$1' is not a valid option. \n Try something else..."
      return 0
    ;;
  esac
}

## launch love games
function Love () {
	case $1 in
		"tower")
			love /home/ygoreus/media/games/love/turres-monacorum.love
		;;
		"mario")
			love /home/ygoreus/media/games/love/portal-mario.love
		;;
	esac
}

## edit configs
function ei3 () {
  case $1 in
    "config")
      cd /home/ygoreus/.i3/
      $EDITOR config
;;
    "blocks")
      cd /home/ygoreus/.i3/
      $EDITOR blocks.config
;;
    "conky")
      cd /home/ygoreus/.i3/conky
      $EDITOR bar.conkyrc
;;
    *)
      echo "File is not an i3wm config or element."
;;
  esac
}

## sets function for normal user to do snapshots of known user-owned subvolumes
#if [[ $USER != 'root' ]]; then
#	function snaps () {
#		case $1 in
#			doc)	snapper -c ;;
#			pic)	sanpper -c ;;
#			wlp)	snapper -c ;;
#			msc)	snapper -c ;;
#			vid)	snapper -c ;;
#			prgm)	snapper -c ;;
#			scrp)	snapper -c ;;
#			git)	snapper -c ;;
#			dots)	snapper -c ;;
#			snaps)	snapper -c ;;
#		esac
#	}
#fi

## sets function for root user to do snapshots of known root-owned subvolumes
#if [[ $USER == 'root' ]]; then
#	function snaps () {
#		case $1 in
#			root)	snapper -c ;;
#			etc)	snapper -c ;;
#			mnt)	snapper -c ;;
#			opt)	snapper -c ;;
#			var)	snapper -c ;;
#			usr)	snapper -c ;;
#		esac
#	}
#fi

## get PKGBUILD from AUR, and build package
function aurPKG () {
  cd /home/$USER/programming/abs/
  wget -q https://aur.archlinux.org/cgit/aur.git/snapshot/$1.tar.gz
  if [[ -e $1.tar.gz ]]; then
    tar zxvf $1.tar.gz
    rm -f $1.tar.gz
    cd $1
  fi
  if [[ -e PKGBUILD ]]; then
    makepkg -od
    makepkg -se
  fi
  cower -u | wc -l > /tmp/aur_packages
  checkupdates | wc -l > /tmp/pkg_upgrades
  pkill -SIGRTMIN+22 i3blocks
}

## youtube-dl goes to distinct folder to put download
function Ytube () {
	cd /home/ygoreus/media/videos/youtube/general/
	youtube-dl $1
	cd ~
}

## youtube-dl for backing up persephonie66 videos
function Yp66 () {
	cd /home/ygoreus/media/videos/youtube/P66-backup/
	youtube-dl $1
	cd ~
}

## !-
function Vimeo () {
	cd /home/$USER/media/videos/vimeo/
	youtube-dl $1
	cd ~
}

## !-
function XVid () {
	mkdir -p /home/$USER/media/.wtfomgdood/pr0n
	cd /home/$USER/media/.wtfomgdood/pr0n/
	youtube-dl $1
	cd ~
}

## create an archive of a file
function compress () {
	FILE=$1
	shift
	case $FILE in
		*.tar.bz2)	tar cjf $FILE $* ;;
		*.tar.gz)	tar czf $FILE $* ;;
		*.tgz)		tar czf $FILE $* ;;
		*.zip)		zip $FILE $* ;;
		*.rar)		rar $FILE $* ;;
		*)		echo "filetype not recognized"
	esac
}

##-- extract contents of archive
function x() {
	if [[ -f "$1" ]]; then
		case $1 in
		*.tar.lrz)
			b=$(basename "$1" .tar.lrz)
			lrztar -d "$1" && [[ -d "$b" ]] && cd "$b"
		;;
		*.lrz)
			b=$(basename "$1" .lrz)
			lrunzip "$1" && [[ -d "$b" ]] && cd "$b"
		;;
		*.tar.bz2)
			b=$(basename "$1" .)
			bsdtar xjvf "$1" && [[ -d "$b" ]] && cd "$b"
		;;
		*.bz2)
			b=$(basename "$1" .)
			bunzip2 "$1" && [[ -d "$b" ]] && cd "$b"
		;;
		*.tar.gz)
			b=$(basename "$1" .)
			bsdtar zxvf "$1" && [[ -d "$b" ]] && cd "$b"
		;;
		*.gz)
			b=$(basename "$1" .)
			gunzip "$1" && [[ -d "$b" ]] && cd "$b"
		;;
		*.tar.xz)
			b=$(basename "$1" .)
			bsdtar Jxvf "$1" && [[ -d "$b" ]] && cd "$b"
		;;
		*.xz)
			b=$(basename "$1" .)
			xz -d "$1" && [[ -d "$b" ]] && cd "$b"
		;;
		*.rar)
			b=$(basename "$1" .)
			unrar e "$1" && [[ -d "$b" ]] && cd "$b"
		;;
		*.tar)
			b=$(basename "$1" .)
			bsdtar xvf "$1" && [[ -d "$b" ]] && cd "$b"
		;;
		*.tbz2)
			b=$(basename "$1" .)
			bsdtar xjvf "$1" && [[ -d "$b" ]] && cd "$b"
		;;
		*.tgz)
			b=$(basename "$1" .)
			bsdtar xzvf "$1" && [[ -d "$b" ]] && cd "$b"
		;;
		*.zip)
			b=$(basename "$1" .)
			unzip "$1" && [[ -d "$b" ]] && cd "$b"
		;;
		*.Z)
			b=$(basename "$1" .)
			uncompress "$1" && [[ -d "$b" ]] && cd "$b"
		;;
		*.7z)
			b=$(basename "$1" .)
			7z x "$1" && [[ -d "$b" ]] && cd "$b"
		;;
		*)
			echo "don't know hoe to extract '$1'..." && return 1
		;;
		esac
		return 0
	else
		echo "'$1' is not a valid file!"
		return 1
	fi
}

function mux () {
  case $1 in
    "-m"|"-main")
      if [[ $(tmux ls | grep 'Main' | wc -l) == 0 ]]; then
        tmux -2 new-session -s Main
      else
        tmux attach-session -t Main
      fi
    ;;
    "-q"|"-quit")
      tmux detach-client
    ;;
    "-n"|"-new")
      tmux -2 new-session ${@:2}
    ;;
    "-a"|"-attach")
      tmux attach-session -t $2
    ;;
  esac
}

##-- open dots
function dots () {
  dotdir="/home/$USER/dotfiles"
  case $1 in
    "i3"|"i3wm"|"i3-wm")
      case $2 in
        "c"|"conf"|"config")
          vim $dotdir/i3/config
        ;;
        "s"|"stat"|"status")
          vim $dotdir/i3/blocks.config
        ;;
      esac
    ;;
    "z"|"zsh"|"zshell")
      vim $dotdir/zsh/zshrc
    ;;
    "m"|"mpd")
      vim $dotdir/mpd/mpd.conf
    ;;
    "x"|"xorg")
      vim $dotdir/X/Xresources
    ;;
  esac
}



##-- list directory after changing directories
function lcs () {
  [[ -n '$@' ]] && dir=$@ || dir=$HOME
  builtin cd $dir && ls
}

function lch () {
  [[ -n '$@' ]] && dir=$@ || dir=$HOME
  builtin cd $dir && lh
}

function lcl () {
  [[ -n '$@' ]] && dir=$@ || dir=$HOME
  builtin cd $dir && ll
}

function lca () {
  [[ -n '$@' ]] && dir=$@ || dir=$HOME
  builtin cd $dir && la
}


## definition / theasaurus stuff
dDefine () { curl dict://dict.org/d:${1}:wn; }
dacron () { curl dict://dict.org/d:${1}:vera; }
djargon () { curl dict://dict.org/d:${1}:jargon; }
dfoldoc () { curl dict://dict.org/d:${1}:foldoc; }
dThesar () { curl dict://dict.org/d:${1}:moby-thes; }


###########################################################################################
##############################   draw the command prompt   ################################
###########################################################################################

##-- show text mode
#function zle-line-init zle-keymap-select {
#    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
#    RPS2=$RPS1
#    zle reset-prompt
#}
#zle -N zle-line-init
#zle -N zle-keymap-select

## define user prompt
uprompt1=$'%{\e[1;34m%}(%{\e[1;35m%}%5~%{\e[1;34m%}) %{\e[1;36m%}%# %{\e[1;32m%}● %{\e[0m%}'
uprompt0=$'%{\e[1;34m%}(%{\e[1;35m%}%3~%{\e[1;34m%}) %{\e[1;36m%}%# %{\e[1;32m%}> %{\e[0m%}'
#uprompt1=$'%{\e[1;34m%}╭──⎨%{\e[0;36m%} %m %{\e[1;34m%}⎬──⎨%{\e[1;35m%} %5~ %{\e[1;34m%}⎬ \n%{\e[1;34m%}╰─%{\e[1;32m%}● %{\e[0m%}'
#uprompt1=$'%{\e[1;34m%}(%{\e[1;35m%}%3~%{\e[1;34m%}) %{\e[1;36m%}%# %{\e[1;32m%}● %{\e[0m%}'

## define root prompt
rprompt0=$'%{\e[1;34m%}(%{\e[1;35m%}%3~%{\e[1;34m%}) %{\e[1;31m%}%# %{\e[1;32m%}> %{\e[0m%}'
#rprompt1=$'%{\e[1;34m%}╭──⎨%{\e[0;36m%} %m %{\e[1;34m%}⎬──⎨%{\e[1;35m%} %5~ %{\e[1;34m%}⎬ \n%{\e[1;34m%}╰─%{\e[1;31m%}● %{\e[0m%}'
rprompt1=$'%{\e[1;34m%}(%{\e[1;35m%}%3~%{\e[1;34m%}) %{\e[1;36m%}%# %{\e[1;31m%}● %{\e[0m%}'

## define misc prompt
mprompt=$'%# '

## define prompt to be drawn
case $USER in
	"root")
		case $TERM in
			"linux")
				prompt=$rprompt0
			;;
			*)
				prompt=$rprompt1
			;;
		esac
	;;
	"ygoreus")
		case $TERM in
			"linux")
				prompt=$uprompt0
			;;
			*)
				prompt=$uprompt1
			;;
		esac
	;;
	*)
		prompt=$mprompt
	;;
esac

setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
'%F{5}( %F{0}%f %F{1}%s%F{5})%F{3} %F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
'%F{5}(%F{0}%f%F{1}%s%F{5})%F{3} %F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn
vcs_info_wrapper() {
    vcs_info
    if [ -n "$vcs_info_msg_0_" ]; then
        echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
    fi
}

precmd() {
    psvar=()
        vcs_info
        [[ -n $vcs_info_msg_0_ ]] && psvar[1]="$vcs_info_msg_0_"
}


#source ~/.prompt_zsh

## draw the prompt
#PROMPT=$prompt
#RPROMPT=""
#RPROMPT=
#PROMPT=$'%{\e[1;34m%}(%{\e[1;35m%}%2~%{\e[1;34m%}) ''$(vcs_info_wrapper)'$'%{\e[1;36m%}%# %{\e[1;32m%}● %{\e[0m%}'
PROMPT=$'%{\e[1;35m%}%2~%{\e[1;32m%}'$': %{\e[0m%}'
RPROMPT=' $(vcs_info_wrapper)'
#PROMPT="$(~/test.py $?)"
#function _update_ps1() {
#export PROMPT='$(~/test.py $?)'
#}
#precmd() {
#    _update_ps1
#}

#precmd

## override prompt for midnight commander
if [[ $(ps $PPID | grep mc | wc -l) == '1' ]]; then
	case $TERM in
		linux)
			PROMPT+=$'> '
		;;
		*)
			PROMPT+=$'➤ '
		;;
	esac
fi

setopt interactivecomments

###########################################################################################
#####################   set behaviour for different terminals   ###########################
###########################################################################################

## set connections to tmux for terminal emulators
if [[ $USER != 'root' ]]; then
case $TERM in
# when ftjerm launches connect to System session, if idle
	xterm*)
		if ps $PPID | grep ftjerm; then
			if [[ $(tmux ls | grep System | wc -l) == '1' ]]; then
				if [[ $(tmux ls | grep System | grep attached | wc -l) == '1' ]]; then
					cd ~ && clear
				else
					tmux attach-session -t System
				fi
			else
				tmux new-session -s System
			fi
		fi
	;;
# when a rxvt-unicode client is launched connect to Main session, if idle
# when the linux console starts connect to Console session, if idle
	linux)
		if [[ $(tmux ls | grep Console | wc -l) == '1' ]]; then
			if [[ $(tmux ls | grep Console | grep attached | wc -l) == '1' ]]; then
				cd ~ && clear
			else
				tmux attach-session -t Console
			fi
		else
			tmux new-session -s Console
		fi
	;;
	xterm-256color)
		cd ~ && clear
	;;
	screen-256color)
		cd ~ && clear
	;;
esac
fi

###########################################################################################
######################   colouring options and sourcing for zsh   #########################
###########################################################################################

## default colouring options
autoload -U colors && colors
zmodload zsh/complist
zstyle :compinstall filename '~/.zshrc'
zstyle ':completion:*' menu select
#zstyle ':completion:*' list-colors '=*=32' menu select
#zstyle ':completion:*:aliases' list-colors '=*=2;38;5;128'
#zstyle ':completion:*:options' list-colors ''


## advanced highlighting
if [[ -e /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
	source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

## load external profile settings
if [[ -e ~/.zprofile ]]; then
	source ~/.zprofile
fi

## load external environment settings
if [[ -e ~/.zshenv ]]; then
	source ~/.zshenv
fi

## load external alias settings
if [[ -e ~/.zaliases ]]; then
	source ~/.zaliases
fi

# Like you, I have no idea what you are doing, but I am pretty sure it is wrong...Jasonwryan
