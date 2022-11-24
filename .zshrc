# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export SUDO_EDITOR="emacsclient"
alias e="open-in-emacs"
alias E="sudo -e"
alias t="tree -L 1"
alias tt="tree -L 2"
alias ttt="tree -L 3"
alias tttt="tree -L 4"
alias i="sxiv -t ."
alias qn="query-notes"
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Customize to your needs...
#export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
# export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dawt.useSystemAAFontSettings=lcd'

eval `dircolors /home/jmonetta/non-rep-software/dircolors-solarized/dircolors.256dark`

list-files(){
    ls -l;
}

tree-files(){
    tree -L 2
}
zle -N list-files
zle -N tree-files

bindkey "^j" list-files
bindkey "^h" tree-files

# starts one or multiple args as programs in background
background() {
  for ((i=2;i<=$#;i++)); do
    ${@[1]} ${@[$i]} &> /dev/null &
  done
}

alias -s {pdf,PDF}='background mupdf'
alias -s {jpg,jpeg,JPG,png,PNG}='background sxiv'
alias -s {ods,ODS,odt,ODT,odp,ODP,doc,DOC,docx,DOCX,xls,XLS,xlsx,XLSX,xlsm,XLSM,ppt,PPT,pptx,PPTX,csv,CSV}='background libreoffice'
alias -s {html,HTML}='background brave'
alias -s {mp4,MP4,mov,MOV,mkv,MKV}='chromium vlc'
alias -s {zip,ZIP,war,WAR}="unzip -l"
alias -s {jar,JAR}="jar tf"
alias -s gz="tar -tf"
alias -s {tgz,TGZ}="tar -tf"

source ~/.profile
