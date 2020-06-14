# General Aliases

# HTTP Web Server
alias ws='python -m http.server 8000'
echo " alias   : ws: python -m http.server 8000"

# Directory listing
if [[ "$(type -P tree)" ]]; then
  alias ll='tree --dirsfirst -aLpughDFiC 1'
  alias lsd='ll -d'
else
  alias ll='ls -al'
  alias lsd='CLICOLOR_FORCE=1 ll | grep --color=never "^d"'
fi

# File size
alias fs="stat -f '%z bytes'"
alias df="df -h"

# Recursively delete `.DS_Store` files
alias dsstore="find . -name '*.DS_Store' -type f -ls -delete"

# Aliasing eachdir like this allows you to use aliases/functions as commands.
alias eachdir=". eachdir"

# Create a new directory and enter it
function md() {
  mkdir -p "$@" && cd "$@"
}


# IP addresses
alias wanip="dig +short myip.opendns.com @resolver1.opendns.com"
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# View HTTP traffic
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Reset sound interface
alias resetsound="sudo killall coreaudiod"

# Connect to remote machine
alias sshh="ssh -i $PEM $REMOTE"
alias sspp="scp -i $PEM $REMOTE"

# =============================================
# Utility functions
# =============================================
echo

echo " function killport [PORT]: kills process listening on PORT"
function killport() {
  lsof -t -i tcp:$1 | xargs kill
}

echo " function f [NAME]: finds on current dir"
function f() {
  find . -iname "$1"
}

echo " function sudorsync: rsync with sudo"
function sudorsync() {
  rsync -azvv -e "ssh -i $PEM" --rsync-path='sudo rsync' $@
}

echo " function titlebar: Set the terminal's title bar."
function titlebar() {
  echo -n $'\e]0;'"$*"$'\a'
}


echo " function curl_time: curl with time."
function curl_time {
  command="curl -I '$1' -H 'Pragma: no-cache' -H 'Accept-Encoding: gzip, deflate, sdch, br' -H 'Accept-Language: es-ES,es;q=0.8,pt;q=0.6' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.95 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: no-cache' -H 'Connection: keep-alive' --compressed  -w "Connect time: %{time_connect} Time to first byte: %{time_starttransfer} Total time: %{time_total} \n" -s -o /dev/null"

  echo '=== Command ===='
  echo $command
}

echo " function loop: loop continuously through a command"
function loop {
  while :
  do
    eval "$@"
    echo
    sleep .3
  done
}
