export DOCKER_HOST=tcp://127.0.0.1:2375
export ZSH=/home/mwidmann/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
eval `keychain --agents ssh --eval id_rsa id_dsa`

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"
export EDITOR=vim

alias hosts="sudo vim /etc/hosts"
alias grep='grep --color=auto'
alias zwget='wget --header="accept-encoding: gzip"'
alias mongod='mongod --config /usr/local/etc/mongod.conf'

alias dni_webserver="ssh -ldevel 172.24.1.13"
alias dni_node="ssh -ldevel 172.24.1.12"
alias dni_db="ssh -ldevel 172.24.1.11"
alias dni_redis="ssh -ldevel 172.24.1.10"
alias epapercron="ssh root@172.24.1.17"

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

# nnp
alias nnpmadb1="ssh -l devel mhnnp-madb01.tele.net"
alias nnpsldb1="ssh -l devel mhnnp-sldb01.tele.net"
alias nnpstoreu1="ssh -l devel mhnnp-storeu01.tele.net"
alias nnpnode1="ssh -l devel mhnnp-node01.tele.net"
alias nnpnode2="ssh -l devel mhnnp-node02.tele.net"
alias nnpweb1="ssh -l devel mhnnp-web01.tele.net"
alias nnpstaging1="ssh -l devel mhnnp-stagingu01.tele.net"

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

alias open="cmd.exe /c start"
alias weather="curl wttr.in/götzis"
