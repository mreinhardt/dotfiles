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

# Find largest files
lgf () {
    root_dir=${1:-$(pwd)}
    file_count=${2:-25}
    du -a "$root_dir" | sort -nr | head -n $file_count
}

# View Markdown
mk () { pandoc $1 | lynx -stdin }

# Find and edit
rged () { $(command -v rg) -l $1 | xargs $(command -v nvim) -p }
rgud () { $(command -v rg) -uuu -l $1 | xargs $(command -v nvim) -p }
ffed () { $(command -v find) . -iname "*$1*" | xargs $(command -v nvim) -p }

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

