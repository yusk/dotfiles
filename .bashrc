alias ls='ls -G'
alias doc2pdf='/Applications/LibreOffice.app/Contents/MacOS/soffice --headless --nologo --nofirststartwizard --convert-to pdf --outdir ./'
alias g=git
alias d=docker
alias gow='watcher -keepalive -cmd "gotest -v ./..." ./'

git config --global alias.tree 'log --graph --all --format="%x09%C(cyan bold)%an%Creset%x09%C(yellow)%h%Creset %C(magenta reverse)%d%Creset %s"'
git config --global alias.ra 'reset HEAD'
git config --global alias.rc 'reset --soft HEAD^'

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWSTASHSTATE=1

export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ '
