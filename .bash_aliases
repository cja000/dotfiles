# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
## My directories
alias stlogs='cd /proj/epg_st_sandbox/reecaag/'
alias program='cd /proj/epg_st_program/'
alias utils='cd /lab/epg_st_utils/'
alias repos='cd /workspace/git/reecaag/'
alias scratch='cd /workspace/scratch/reecaag/'
alias heur_nightlies='cd /proj/dpi/testing/coyote_regressions/comparison_references/Heur_nightlies/'
alias heur_builds='cd /proj/epg_ft_utils/HeuristicsTeam/heuristics_builds/'
alias sentinel_logs='cd /proj/dpi/team_dpi_release/test_results/'
alias sentinel_pcg_logs='cd /proj/pcc_pcg_logs/manual/pcg'
alias pcg_test_logs='cd /proj/pcc_pcg_logs/automation/eric-pc-gateway'
alias coyote_nightlies='cd /proj/epg_st_sandbox/reecaag/Coyote/Coyote_logs'
alias trs='cd /proj/epg_st_trs'

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
alias vi='/app/vbuild/RHEL8-x86_64/vim/latest/bin/vim'
alias vimdiff='vim -d'
alias vless='$(find `type -p vim | sed "s|bin/vim||"` -iname "less.sh")'
alias rehash='hash -r'
alias ctags='/usr/bin/ctags'
alias quota_sandbox='quota -s 2> /dev/null | grep -A 1 -e "sandbox" -e "Disk" | grep -v "\-\-"'
alias teclado_esp='setxkbmap es'
alias urldecode='python3 -c "import sys, urllib.parse as ul; print(ul.unquote_plus(sys.argv[1]))"'
alias less='less -R'
alias diff_side='diff -y --suppress-common-lines'
alias python_mio='/proj/epg_st_sandbox/reecaag/mi_python/bin/python3'
alias vd="/proj/epg_st_sandbox/reecaag/venv_python3.11.4/bin/vd"
alias grep="grep --color=auto --binary-files=without-match"
alias venv_python_mio='. /proj/epg_st_sandbox/reecaag/mi_python/bin/activate'
alias venv_python2_dpi='. /lab/dpi/cdpi_environment/venvs/py2-current/bin/activate'
alias venv_python3_dpi='. /lab/dpi/cdpi_environment/venvs/py3-current/bin/activate'

# Git
alias git_push_master='git push origin HEAD:refs/for/master'
alias git_push_heur_lsv_replica='git push origin HEAD:refs/for/dev/heuristics_lsv_replica'
alias git_push_draft='git push origin HEAD:refs/drafts/master'
alias git_push_private='git push origin HEAD:refs/for/master%private'
alias git_push_reecaag='git push origin HEAD:refs/for/reecaag'
alias git_epg_clone='git clone --recursive "https://gerrit-beta.gic.ericsson.se/pc/gateway/epg"'
alias git_beets_clone='git clone --recursive "https://reecaag@gerrit-gamma.gic.ericsson.se/a/pc/beets"'
alias git_push_wip='git push origin HEAD:refs/for/master%wip'
#alias git_publishmaster='git push origin HEAD:refs/publish/master/\!*'

# LN
#alias LN_NX='ssh selnpcgwnx1001.seln.ete.ericsson.se' # Old
#alias LN='ssh -X selnpcgwnx2001.seln.ete.ericsson.se'
alias LN='ssh -X selnpcgwnx2002.seln.ete.ericsson.se'

# Coyote
alias coyote_comparator='/proj/dpi/cdpi_environment/venvs/2.7.3/bin/python /repo/reecaag/cdpi-main/NSTdpifws/coyotefw/bin/comparator.py'
alias coyote_remote_manager='/proj/dpi/cdpi_environment/venvs/2.7.3/bin/python /repo/reecaag/cdpi-main/NSTdpifws/coyotefw/bin/coyote_remote_manager.py'
alias coyote_10='ssh 10.41.57.34'

# STLOGS
alias STLOGS='ssh stlogs@dpi-st-logs.dpi'

# Lab de ML
alias ML_old='ssh -X podml@10.41.60.20'
alias ML='ssh -X podml@10.41.60.41'

# Mi tmux
#alias tmux='/home/reecaag/bin/tmux'

# Outline
alias outline='/proj/j20/testtools/binaries/windows/outline/latest/outline.sh'

# K8s
alias k='/app/vbuild/RHEL8-x86_64/kubectl/latest/bin/kubectl'
alias trim_to_message_k8_log='sed "s/.*message\":\(.*\)/\1/p"'
alias vitamin='/proj/sgsn-tools/vitamin/LATEST/bin/vitamin'
alias h='/app/vbuild/RHEL8-x86_64/helm/latest/bin/helm'

# Eclipse
alias eclipse='/app/eecs/eclipse/4.15.0/eclipse -Xms2048m -Xmx4096m  &'

# SFTP Altran
alias sftp_altran='sftp -P 2222 pruebasericsson@tracecapture.altran.es'

# OneWireshark
## RHEL7
# alias onewireshark_latest_beta='onewireshark --use-latest-beta-build'
# alias onetshark='/proj/j20/testtools/binaries/rhel7.x86_64/onewireshark/latest/bin/tshark'
# alias onecapinfos='/proj/j20/testtools/binaries/rhel7.x86_64/onewireshark/latest/bin/capinfos'
# alias onereordercap='/proj/j20/testtools/binaries/rhel7.x86_64/onewireshark/latest/bin/reordercap'
# alias onewireshark='onewireshark.sh'
## RHEL8
alias onetshark='/proj/pdupc-testtools/onewireshark/rhel8.x86_64/latest/bin/tshark'
alias onecapinfos='/proj/pdupc-testtools/onewireshark/rhel8.x86_64/latest/bin/capinfos'
alias onereordercap='/proj/pdupc-testtools/onewireshark/rhel8.x86_64/latest/bin/reordercap'
alias onewireshark='onewireshark.sh'


# 7z ultra compression
alias 7z_add='7z a -t7z -m0=lzma2 -mx=9 -mfb=64 -md=32m -ms=on'

# DPI
alias markdownlint='node /proj/dpi/node_modules/markdownlint-cli/markdownlint.js'
alias python3_dpi="/usr/bin/env PYTHONPATH='/proj/dpi/python3-modules/lib/python3.7/site-packages' python3"

# Jupyterlab
alias jlab='. /home/reecaag/mio/jupyter/bin/activate ; nohup jupyter lab &'

# PCG / Beets
alias beets_format='mvn pccfw-test-doc:format' # Format Beets files
alias beets_verify='mvn pccfw-test-doc:validate'
alias pcg_console_log_no_time="sed -e 's/.* CEST \- //' -e 's/.*:[0-9][0-9] //'"

# Capturas
alias captures_arm_download='arm_cp https://arm.mo.sw.ericsson.se/artifactory/proj-pc-gateway-epg-captures-dev-local/latest .'

# Acceso a nodos PCG
alias node_login='/usr/bin/python3.11 /proj/sgsn_st_work/exzhuyo/tools/flywheel/login/new_login.py'

# Logs de los proyectos de heurísticos
alias proj_heur_logs='cd /proj/pcc_pcg_logs/manual/pcg/llv/heuristic'

# Temporales
## PCPB-24950
alias pcpb24950='cd /lab/epg_st_sandbox/reecaag/PCPB-24950'

# HTTP server 8888
alias http_server_8888='python_mio -m http.server 8888'

# Lists open files, including network connections
alias ports_used='lsof -iTCP -sTCP:LISTEN -Pn'
