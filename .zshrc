export DOCKER_HOST=tcp://127.0.0.1:2375
export PATH=~/.composer/vendor/bin:~/go/bin:$PATH
export PATH=/home/mwidmann/anaconda2/bin:$PATH

eval `keychain --agents ssh --eval id_rsa id_dsa`

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"
export EDITOR=vim
export VISUAL=$EDITOR
export GOPATH="/home/mwidmann/go"
export PHP_IDE_CONFIG="serverName=local"

alias hosts="sudo vim /etc/hosts"
# adds the provided entry to both wsl and windows hosts file
function vhost() {
	echo "127.0.0.1 $1" >> /etc/hosts
	echo "127.0.0.1 $1" >> /c/Windows/System32/drivers/etc/hosts
}


alias grep='grep --color=auto'
alias zwget='wget --header="accept-encoding: gzip"'
alias mongod='mongod --config /usr/local/etc/mongod.conf'

alias dni_webserver="ssh -ldevel 172.24.1.13"
alias dni_node="ssh -ldevel 172.24.1.12"
alias dni_db="ssh -ldevel 172.24.1.11"
alias dni_redis="ssh -ldevel 172.24.1.10"

# servers
alias tpappsu01='ssh -l devel tpappsu01.tele.net'
alias tpappsu02='ssh -l devel tpappsu02.tele.net'
alias tpappsu03='ssh -l devel tpappsu03.tele.net'
alias tpappsextu01='ssh -l devel tpappsextu01.tele.net'
alias tpdevu02='ssh -l devel tpdevu02.tele.net'
alias vn='ssh -l devel mhvnu01.tele.net'
alias dc='ssh -l digicol 194.183.158.26'
alias dcapps='ssh -ldigicol dc-apps01'
alias epaper=dc
alias nzzstore="ssh -l devel rms-store01.tele.net"
alias rmsaasu01="ssh -l devel rmsaasu01.tele.net"
#alias epapercron="ssh root@172.24.1.17"
alias epapercron="ssh root@194.208.10.17"
alias gitlab="ssh root@gitlab.russmedia.com"
alias jenkins="ssh root@194.208.10.30"

# nnp
alias nnpstore="ssh -l devel rmnnp-store01.tele.net"

# android debugging
alias debugandroid="adb forward tcp:9222 localabstract:chrome_devtools_remote"

# openshift commandas
alias ocp="oc get projects"
alias ocr="oc get pod|grep Running"
alias ocl="oc logs -f"
oce() {
    oc exec -it "$1" bash
}

ovbcc() {
	convert -resize x2500 -interlace Plane -quality 90 -density 150 -colorspace sRGB -background "#ffffff" -flatten $1 cpartpage_$2.jpg
	jpegoptim -m90 --strip-all --all-progressive cpartpage_$2.jpg
	convert -quality 90 -resize x500 cpartpage_$2.jpg cpartpage_$2_lo.jpg
	convert -quality 90 -resize x250 cpartpage_$2.jpg cpartpage_$2_small.jpg
}

ovbc() {
	convert -resize x2500 -interlace Plane -quality 90 -density 150 -colorspace sRGB -background "#ffffff" -flatten $1 partpage_$2.jpg
	jpegoptim -m90 --strip-all --all-progressive partpage_$2.jpg
	convert -quality 90 -resize x500 partpage_$2.jpg partpage_$2_lo.jpg
	convert -quality 90 -resize x250 partpage_$2.jpg partpage_$2_small.jpg
}

alias weather="curl wttr.in/götzis"


## tmux stuff
alias tmx="tmux new -s"
alias tmxa="tmux attach -t"
alias tmxl="tmux ls"
alias tmxc="vim ~/.tmux.conf"
alias tmxk="tmux kill-session -t"
alias tmxwindows="tmux list-windows"

## tmuxinator
alias tmxn="tmuxinator new"
alias tmxo="tmuxinator open"
alias tmxs="tmuxinator start"

## windows 
alias docker-compose="docker-compose.exe"
alias open="cmd.exe /c start"
alias code="/c/Users/mwidmann/AppData/Local/Programs/Microsoft\ VS\ Code/bin/code"
alias start-docker="docker restart webserver_webserver_1 && docker restart webserver_mysql_1"
alias xdbon="sed -i.bak 's/#zend_extension/zend_extension/g' ~/projects/dockerfiles/webserver/php/docker-php-ext-xdebug.ini && docker restart webserver_webserver_1"
alias xdboff="sed -i.bak 's/zend_extension/#zend_extension/g' ~/projects/dockerfiles/webserver/php/docker-php-ext-xdebug.ini && docker exec -it webserver_webserver_1 apachectl graceful"

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
alias node='unalias node ; unalias npm ; nvm use default ; node $@'
alias npm='unalias node ; unalias npm ; nvm use default ; npm $@'

__git_files () { 
    _wanted files expl 'local files' _files     
}
