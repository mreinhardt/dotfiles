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
mk () { pandoc $1 | lynx -stdin }

# grep processes and output as JSON
# NOTE: Must have eat (github.com/antonmedv/eat) installed
pj () { ps aux | grep -E "%CPU.*%MEM|$1" | eat }

# Find and edit
rged () { $(command -v rg) -l $1 | xargs $(command -v nvim) -p }
rgud () { $(command -v rg) -uuu -l $1 | xargs $(command -v nvim) -p }
ffed () {
    if [[ -n $2 ]]; then
        $(command -v find) . -iname "*$1*" -o -iname "*$2*" -not -path "*/.git/*" | xargs $(command -v nvim) -p
    else
        $(command -v find) . -iname "*$1*" -not -path "*/.git/*" | xargs $(command -v nvim) -p
    fi
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
sman() {
    MANWIDTH=${MANWIDTH:-80}
    indent_count=$(echo "($(tput cols) - 80) / 2" | bc)
    indent=$(seq -s' ' ${indent_count} | tr -d '[:digit:]')
    command man $@ | sed "s/^/${indent}/" | less -isR
}

# k8s stuff
kgo() {
    if [[ -z $2 ]]; then
        kubectl exec --stdin --tty $(kubectl get pods | grep -E "$1" | cut -d' ' -f1 | head -n1) -- "/bin/sh";
    else
        kubectl exec --stdin --tty -c "$2" $(kubectl get pods | grep -E "$1" | cut -d' ' -f1 | head -n1) -- "/bin/$3sh";
    fi
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
        kubectl logs "pod/$(kubectl get pods | grep -E "$1" | cut -d' ' -f1 | head -n1)" -c "$1"
    else
        kubectl logs "pod/$(kubectl get pods | grep -E "$1$2" | cut -d' ' -f1 | head -n1)" -c "$1"
    fi
}

klgf() {
    kubectl logs -f -lapp="$1" --all-containers=true --max-log-requests=9 --pod-running-timeout=60m; \
    while true; do kubectl logs -f -lapp="$1" --all-containers=true --max-log-requests=9 --pod-running-timeout=60m | tail -n"${2:-+10}"; done
}

krestart() {
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
