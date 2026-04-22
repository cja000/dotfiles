" Vim syntax file
"
" file type: J20 messages log file

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

"syntax case ignore
"syntax match messagesComment "[\*\+=]*"

syntax match messagesError   ".*ERROR.*"
syntax match messagesError   ".*CRIT.*"
syntax match messagesError   ".*EMERG.*"
syntax match messagesError   ".*ALERT.*"
syntax match messagesError   "PPB_FAILURE.*"
syntax match messagesError   ".*RADIUS_SERVERDOWN.*"
syntax match messagesError   ".*FAILOVER.*"
syntax match messagesError   ".*CONNECTION DOWN.*"
syntax match messagesError   ".*DETACH_FPC.*"

syntax match messagesWarn    ".*WARN.*"
syntax match messagesWarn    ".*NOTICE.*"

syntax match messagesEvent   "UI_[A-Z_]*:"
syntax match messagesEvent   "EVENT.*"

syntax match messagesInfo    ".*AUTOTT2:.*"
syntax match messagesInfo    ".*recovery from failure in progress.*"

syntax match messagesOK      ".*commit complete*"
syntax match messagesOK      "RECOVERY_DONE.*"
syntax match messagesOK      "PPB_CONFIG Operational"
syntax match messagesOK      "PPB \[[0-9]*\] is ready"
syntax match messagesOK      ".*Restart FPC done.*"

" Keywords
syntax keyword messagesOK    OK
syntax keyword messagesError CHASSISD_IFDEV_DETACH_PIC


" Regions
"syntax region messagesCLI start="\d.*# ===.*$" end="# =*$"
"syntax region messagesCLI start="# \*" end="# \**$"

highlight messagesError   ctermfg=Red     ctermbg=Black cterm=bold  
highlight messagesWarn    ctermfg=Yellow  ctermbg=Black cterm=bold
highlight messagesInfo    ctermfg=Magenta ctermbg=Black cterm=bold
highlight messagesDebug   ctermfg=Gray    ctermbg=Black cterm=bold
highlight messagesEvent   ctermfg=Blue    ctermbg=Black cterm=bold
highlight messagesOK      ctermfg=Green   ctermbg=Black
highlight messagesComment ctermfg=Cyan    ctermbg=Black
highlight messagesCLI     ctermfg=Blue    ctermbg=Gray
highlight messagesCap     ctermfg=White   ctermbg=Blue
highlight messagesCapOk   ctermfg=Green   ctermbg=Blue
highlight messagesCapSt   ctermfg=Yellow  ctermbg=Blue

let b:current_syntax = "log_file"
