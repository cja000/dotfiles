" Vim syntax file
"
" file type: AutoTT log file

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

syntax case ignore
syntax match AutoTTcomment "[\*\+=]*"


syntax match AutoTTError   ".*ERROR.*"
syntax match AutoTTError   "Exception:.*"
syntax match AutoTTError   "No success result..."
syntax match AutoTTError   "create fail is [1-9][0-9]*"
syntax match AutoTTError   "Missed target CPU 87% .*)"
syntax match AutoTTError   "Create loss.*"
syntax match AutoTTError   ".*create fail is [1-9].*"

syntax match AutoTTWarn    ".*WARNING.*"

syntax match AutoTTInfo    "Replay aborted on Dallas:.*"
syntax match AutoTTInfo    "# CPU .*)"
syntax match AutoTTInfo    "#  - .*"

syntax match AutoTTEvent   "Now process.*"
syntax match AutoTTEvent   "Now do .*"
syntax match AutoTTEvent   "Now try.*"


syntax match AutoTTOK      ".*Dallas is started.*"
syntax match AutoTTOK      ".*Commit configuration OK.*"
syntax match AutoTTOK      ".*Restart FPC done.*"

" Keywords
syntax keyword AutoTTOK OK


" Regions
"syntax region AutoTTCLI start="\d.*# ===.*$" end="# =*$"
"syntax region AutoTTCLI start="# \*" end="# \**$"

highlight AutoTTError   ctermfg=Red     ctermbg=Black cterm=bold  
highlight AutoTTWarn    ctermfg=Yellow  ctermbg=Black cterm=bold
highlight AutoTTInfo    ctermfg=Magenta ctermbg=Black cterm=bold
highlight AutoTTDebug   ctermfg=Gray    ctermbg=Black cterm=bold
highlight AutoTTEvent   ctermfg=Blue    ctermbg=Black cterm=bold
highlight AutoTTOK      ctermfg=Green   ctermbg=Black
highlight AutoTTcomment ctermfg=Cyan    ctermbg=Black
highlight AutoTTCLI     ctermfg=Blue    ctermbg=Gray
highlight AutoTTCap     ctermfg=White   ctermbg=Blue
highlight AutoTTCapOk   ctermfg=Green   ctermbg=Blue
highlight AutoTTCapSt   ctermfg=Yellow  ctermbg=Blue

let b:current_syntax = "log_file"
