#aliases

alias vim='nvim'
alias t='tmux'

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

#switch dir
alias zshconfig='cd ~/.zsh'
alias init.vim='vim ~/.config/nvim/init.vim'
alias bay='cd /bay'
alias anime='cd /bay/library'
alias bspwmrc='nvim ~/.config/bspwm/bspwmrc'
alias polybarconfig='nvim ~/.config/polybar/config.ini'

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias stat='git status'  # 'status' is protected name so using 'stat' instead
alias tag='git tag'
alias newtag='git tag -a'

#MKV
alias playmkv='mpv *.mkv'
alias playmp4='mpv *.mp4'
alias playmov='mpv *.mov'

# youtube-dl
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "
alias ytv-best="youtube-dl -f bestvideo+bestaudio "

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'


# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'


#Misc
alias nyaa='koneko nyaa'
alias sukebei='koneko sukebei'
alias porn='mpv https://pornhub.com/random'
alias reboot='sudo reboot'
alias mountbay='sudo mount /dev/sda1 /bay'

