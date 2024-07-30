### FUNCTIONS ###

# Print ANSI/VT100 256 color table
colortable() {
    for code in {0..255}; do
        pcode=$(printf "%03d" $code)
        echo -ne "\e[07;38;05;${code}m $pcode"
        if [[ $(( ($code + 1) % 8 )) -eq 0 ]]; then
            echo -e "\e[38;48;05;00m"
        fi
    done
    echo
}

# unzip anything
cx() {
    if [[ -f $1 ]]; then
        case $1 in
          *.tar.bz2) tar xvjf $1;;
          *.tar.gz) tar xvzf $1;;
          *.tar.xz) tar xvJf $1;;
          *.tar.lzma) tar --lzma xvf $1;;
          *.rar) unrar $1;;
          *.gz) gunzip $1;;
          *.tar) tar xvf $1;;
          *.tbz2) tar xvjf $1;;
          *.tgz) tar xvzf $1;;
          *.zip) unzip $1;;
          *.Z) uncompress $1;;
          *.7z) 7z x $1;;
          *) echo "'$1' cannot be extracted via >ex<";;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# directory tree
dtree () {
    CURDIR=$(pwd)
    if [ "$1" != "" ]; then cd "$1"; fi
    pwd
    ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'
    cd $CURDIR
}

# Convert integer to human readable bytes
hb() {
    awk '
        function human(x) {
            if (x<1000) {return x} else {x/=1024}
            s="kMGTEPYZ";
            while (x>=1000 && length(s)>1)
                {x/=1024; s=substr(s,2)}
            return int(x+0.5) substr(s,1,1)
        }
        {sub(/^[0-9]+/, human($1)); print}'
}

hush() {
    "$@" 2>/dev/null
}

gono() {
    preface=$1
    command=$2
    zsh -c "source ${ZDOTDIR:-$HOME}/.zshrc && $preface"
    select yn in "Go" "No"; do
        case $yn in
            Go) zsh -c "source ${ZDOTDIR:-$HOME}/.zshrc && $command"; break;;
            No) echo "NOPE!"; break;;
        esac
    done
}

yn() {
    preface=$1
    command=$2
    read "?$preface [yN] " answer
    case $answer in
        [Yy]*) zsh -c "source ${ZDOTDIR:-$HOME}/.zshrc && $command";;
        *) echo "NOPE!"; exit;;
    esac
}

poll() {
    command=$1
    interval=${2:-5}
    display=$3
    while true; do
        if [[ $display != "" ]]; then echo "[$(date)]\tRunning '${command}'..."; fi
        zsh -c "source ${ZDOTDIR:-$HOME}/.zshrc && $command"
        if [[ $display != "" ]]; then echo "[$(date)]\tSleeping ${interval}s...\t[Hit Ctrl-C to exit]"; fi
        sleep $interval
    done
}

h() {
    navi=$(command -v navi)
    if [[ -z $1 ]]; then
        $navi
    else
        $navi --query "$1"
    fi
}

ch() {
    curl -s "https://cheat.sh/$1" | less -R
}

help-important-commands() {
    echo -e "
    Add commands that you want to always be available in history to ~/.important_commands
    "
}

urldecode() {
    echo $1 | PERL_BADLANG=0 perl -pe 's/\%(\w\w)/chr hex $1/ge'
}

# Convert hex colors to rgb
hex2rgb() {
    hexinput=`echo $1 | sed 's/^#//g' | tr '[:lower:]' '[:upper:]'`
    rh=`echo $hexinput | cut -c-2`
    gh=`echo $hexinput | cut -c3-4`
    bh=`echo $hexinput | cut -c5-6`

    r=`echo "ibase=16; $rh" | bc`
    g=`echo "ibase=16; $gh" | bc`
    b=`echo "ibase=16; $bh" | bc`

    echo "rgb($r, $g, $b)"
}

# Simple calculator
bcl() {
    echo "$*"
    echo "$*" | bc -l
}

# Find largest files
lgf () {
    root_dir=${1:-$(pwd)}
    file_count=${2:-25}
    du -a "$root_dir" | sort -nr | head -n $file_count
}

# View Markdown
mk () { pandoc -f markdown $1 | lynx -stdin }

# grep processes and output as JSON
# NOTE: Must have eat (github.com/antonmedv/eat) installed
pj () { ps aux | grep -E "%CPU.*%MEM|$1" | eat }

# global protect (mac)
restart_global_protect() {
    launchctl unload /Library/LaunchAgents/com.paloaltonetworks.gp.pangps.plist
    launchctl unload /Library/LaunchAgents/com.paloaltonetworks.gp.pangpa.plist
    launchctl load /Library/LaunchAgents/com.paloaltonetworks.gp.pangps.plist
    launchctl load /Library/LaunchAgents/com.paloaltonetworks.gp.pangpa.plist
}
gprestart() {
    restart_global_protect
}

# Find and edit
FIND=$(command -v find)
NVIM=$(command -v nvim)
PIPENV=$(command -v pipenv)
BAKE=$(command -v bake)
RG=$(command -v rg)
nv () {
    $NVIM $@
}
rged () {
    if [[ -n $3 ]]; then
        $RG -t $3 -l $1 | $RG "${2:-}" | xargs $NVIM -p
    else
        $RG -l $1 | $RG "${2:-}" | xargs $NVIM -p
    fi
}
rgud () {
    if [[ -n $3 ]]; then
        $RG -uuu -t $3 -l $1 | $RG "${2:-}" | xargs $NVIM -p
    else
        $RG -uuu -l $1 | $RG "${2:-}" | xargs $NVIM -p
    fi
}
fd () {
    $FIND . -iname "*$1*" -not -path "*/.git/*" | grep "${2:-}"
}
fp () {
    $FIND . -ipath "*$1*" -not -path "*/.git/*" | grep "${2:-}"
}
ffed () {
    if [[ -n $2 ]]; then
        $FIND . -iname "*$1*" -o -iname "*$2*" -not -path "*/.git/*" | xargs $NVIM -p
    else
        fd "$1" | xargs $NVIM -p
    fi
}
gsed () {
    git status -sb | tail -n+2 | grep -Ev '^D ' | awk '{print $NF}' | grep "${1:-}" | xargs $NVIM -p
}
gsud () {
    git status -sb | tail -n+2 | grep -E '^U' | awk '{print $NF}' | grep "${1:-}" | xargs $NVIM -p
}
gded () {
    git diff --name-only "$1" "${2:-HEAD}" | xargs $NVIM -p
}
gshed () {
    git show -U2 --name-only ${1:-HEAD} | sed -E '/^ |^$/d' | tail -n+4 | xargs $NVIM -p
}

# git
gcls () {
    local new_url="$(printf "$1" | sed -e 's#https\{0,1\}://#git@#' -e 's#\([.][a-z]*\)/#\1:#')"
    echo "Cloning $new_url..."
    printf "$new_url" | xargs -I {} git clone {} ${@:2}
}

gra () {
    local new_url="$(printf "$2" | sed -e 's#https\{0,1\}://#git@#' -e 's#\([.][a-z]*\)/#\1:#')"
    echo "Adding remote $1 $new_url..."
    printf "$new_url" | xargs git remote add $1
}

# pipenv
pec () {
    $PIPENV --rm; $PIPENV clean
}
pei () {
    $PIPENV install -d $@
}
peci () {
    $PIPENV --rm; $PIPENV clean; $PIPENV install -d $@
}
per () {
    $PIPENV run $@
}
pes () {
    $PIPENV shell $@
}
pet () {
    $PIPENV run python -m pytest -vv $@
}
pfg () {
    $PIPENV run pip freeze | grep $@
}
peg () {
    $PIPENV graph | less
}


# bake
bkt () {
    $BAKE tests.unit:run
}

# Detailed memory footprint of a process
if [[ $(uname -s) == "Darwin" ]]; then
    pmem() {
        sudo footprint -s $@ | egrep -v ' 0 bytes.* 0 bytes.* 0 bytes.* 0 bytes'
    }
else
    pmem() {
        grep VmSize /proc/$@/status
    }
fi

# pgrep with extra info
psg() {
    args="$@"
    ps -eo 'user,pid,ppid,pcpu,pmem,vsz,rss,tty,stat,start,time,comm,args' | egrep "%CPU %MEM|$args" | grep -v grep
}

# SUPERMAN! (80 width centered man pages)
man() {
    MANWIDTH=${MANWIDTH:-80}
    indent_count=$(echo "($(tput cols) - 80) / 2" | bc)
    indent=$(seq -s' ' ${indent_count} | tr -d '[:digit:]')
    command man $@ | sed "s/^/${indent}/" | less -isR
}

# k8s stuff
kenv() {
    ns=$(kubectl config view --minify -o jsonpath='{..namespace}')
    echo "env: ${AWS_PROFILE:-unset}, ns: ${ns:-unknown}"
}

kgo() {
    if [[ -z $2 ]]; then
        kubectl exec --stdin --tty $(kubectl get pods | grep -E "$1" | cut -d' ' -f1 | head -n1) -- "/bin/sh";
    else
        kubectl exec --stdin --tty -c "$2" $(kubectl get pods | grep -E "$1" | cut -d' ' -f1 | head -n1) -- "/bin/$3sh";
    fi
}

kstop() {
    kubectl scale ${2:-deployment} $1 --replicas=0
}

kpod() {
    kenv
    if [[ -z $1 ]]; then
        kubectl get pods
    else
        kubectl get pods | grep "$1"
    fi
}

kns() {
    if [[ "$1" == "" ]]; then
        echo $(kubectl config view --minify -o jsonpath='{..namespace}')
    else
        kubectl config set-context --current --namespace=$1
    fi
}
knss () {
    kubectl get namespaces
}

kku() {
    # kku app=nginx server # (dry-run only deployment and service)
    # kku app=nginx        # (only deployment and service)
    # kku dep=nginx        # (only deployment)
    # kku svc=nginx        # (only service)
    # kku cfg=nginx        # (only config)
    # kku pod=nginx        # (everything) (edited)
    if [[ -z $2 ]]; then
        kubectl kustomize "$(kubectl config view | grep namespace | awk '{print $NF }' | tr '-' '/' | sed 's#\(.*\)/\(.*\)#\2/\1/#')" | kubectl apply -l "$1" -f -
    else
        kubectl kustomize "$(kubectl config view | grep namespace | awk '{print $NF }' | tr '-' '/' | sed 's#\(.*\)/\(.*\)#\2/\1/#')" | kubectl apply --dry-run="$2" -l "$1" -f -
    fi
}

kecm() {
    kubectl edit configmap $(kubectl get configmap | grep -E "$1" | cut -d' ' -f1 | head -n1)
}

klog() {
    if [[ -z $2 ]]; then
        # kubectl logs "pod/$(kubectl get pods | grep -E "$1" | cut -d' ' -f1 | head -n1)" -c "$1"
        kubectl logs "pod/$(kubectl get pods | grep -E "$1" | cut -d' ' -f1 | head -n1)"
    else
        kubectl logs "pod/$(kubectl get pods | grep -E "$1$2" | cut -d' ' -f1 | head -n1)" -c "$1"
    fi
}

klgf() {
    kubectl logs -f "pod/$(kubectl get pods | grep -E "$1" | cut -d' ' -f1 | head -n1)" --max-log-requests=9 --pod-running-timeout=60m --tail=${2:-10}; \
    while true; do kubectl logs -f "pod/$(kubectl get pods | grep -E "$1" | cut -d' ' -f1 | head -n1)" --max-log-requests=9 --pod-running-timeout=60m --tail=${2:-10}; done
}
# klgf() {
#     kubectl logs -f -lapp="$1" --all-containers=true --max-log-requests=9 --pod-running-timeout=60m; \
#     while true; do kubectl logs -f -lapp="$1" --all-containers=true --max-log-requests=9 --pod-running-timeout=60m | tail -n"${2:-+10}"; done
# }

klgr() {
    while true; do
        kubectl logs "pod/$(kubectl get pods | grep -E "$1" | cut -d' ' -f1 | head -n1)" --all-containers=true --max-log-requests=9 --pod-running-timeout=60m --since="${2:-60}s"
        sleep "${2:-60}"
    done
}

krestart() {
    pod=$(kubectl get pods | grep -E "$1" | cut -d' ' -f1 | head -n1)
    kubectl rollout restart "${2:-deployment}" "$1"
}

krestart_FORCE() {
    pod=$(kubectl get pods | grep -E "$1" | cut -d' ' -f1 | head -n1)
    kubectl rollout restart "${2:-deployment}" "$1"
    sleep 1
    kubectl delete pod "$pod" --grace-period=0 --force
    sleep 10
    running="$(kubectl get pods | grep -E "$1.*Running")"
    if [[ $running != "" ]]; then
        echo "$running"
    else
        echo "Failed to restart $2 $1!"
    fi
}

krep() {
    kubectl scale --replicas="$2" "deployment.apps/$1"
}

kdn() {
    kubectl scale --replicas=0 "deployment.apps/$1"
}

kup() {
    kubectl scale --replicas="${2:-1}" "deployment.apps/$1"
}

kdnup() {
    kubectl scale --replicas=0 "deployment.apps/$1"
    sleep 1
    kubectl scale --replicas="${2:-1}" "deployment.apps/$1"
}

kroll() {
    for app in "${@}"; do
        kubectl scale --replicas=0 "deployment.apps/$app"
        sleep 1
        kubectl scale --replicas=1 "deployment.apps/$app"
        sleep 1
        kubectl get pods | grep "$app"
        sleep 1
    done
}
