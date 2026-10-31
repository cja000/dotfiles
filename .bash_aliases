# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Listing aliases
alias ls='ls -p -N --color=tty -T 0'
alias ll='ls -l'
alias lt='ls -ltr'
alias la='ls -la'
alias lk='ls -lSrh' # sort by size
alias lc='ls -lcrh' # sort by change time
alias lu='ls -lurh' # sort by access time
alias l='ls -1'

# Alias's to show disk space and space used in a folder
alias diskspace="du -shc * | sort -h | more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAF --dirsfirst'
alias trees='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'
alias count_files_per_dir='du -a | cut -d/ -f2 | sort | uniq -c | sort -nr'

# Security copying / moving
alias cp='cp -i'
alias mv='mv -i'

# Others
alias vimdiff='vim -d'
alias vless='$(find `type -p vim | sed "s|bin/vim||"` -iname "less.sh")'
alias rehash='hash -r'
alias teclado_esp='setxkbmap es'
alias urldecode='python3 -c "import sys, urllib.parse as ul; print(ul.unquote_plus(sys.argv[1]))"'
alias less='less -R'
alias diff_side='diff -y --suppress-common-lines'
alias grep="grep --color=auto --binary-files=without-match"

# 7z ultra compression
alias 7z_add='7z a -t7z -m0=lzma2 -mx=9 -mfb=64 -md=32m -ms=on'

# Lists open files, including network connections
alias ports_used='lsof -iTCP -sTCP:LISTEN -Pn'
