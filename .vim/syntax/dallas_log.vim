" Vim syntax file
"
" file type: Dallas log files

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

syntax match DallasError   "^ERROR.*"
syntax match DallasWarn    "^WARNING"
syntax match DallasInfo    "^INFO"
syntax match DallasDebug   "^DEBUG"
syntax match DallasEvent   "^EVENT"
" It is an EVENT so it has to go after DallasEvent
syntax match DallasOk      "DALLAS system is initialized and ready to rock :-)"
syntax match DallasOk      "DALLAS system is now shut down. Goodbye!"
syntax match DallasOk      "No configuration errors found"
syntax match DallasOk      "Client connection accepted"

" Captures
syntax match DallasCap     "Loading replay file.*$"
syntax match DallasCap     "Replay file.*$"
syntax match DallasCapOk   "Replay file.*loaded successfully.*$"
syntax match DallasCapSt   "Replay file.*Stretched duration.*$"

" AutoTT
syntax match DallasAutoTT  "##########.*##########"
syntax match DallasAutoTT  "Test finished"

" Dallas CLI
"syntax match DallasCLI     "lts_.* '.*'"
syntax match DallasCLI     "user_command .*$"

highlight DallasError  ctermfg=Red     ctermbg=Black cterm=bold  
highlight DallasWarn   ctermfg=Yellow  ctermbg=Black cterm=bold
highlight DallasInfo   ctermfg=Magenta ctermbg=Black cterm=bold
highlight DallasDebug  ctermfg=Gray    ctermbg=Black cterm=bold
highlight DallasEvent  ctermfg=Blue    ctermbg=Black cterm=bold
highlight DallasOK     ctermfg=Green   ctermbg=Black
highlight DallasAutoTT ctermfg=Cyan    ctermbg=Black
highlight DallasCLI    ctermfg=Blue    ctermbg=DarkGray
highlight DallasCap    ctermfg=White   ctermbg=Blue
highlight DallasCapOk  ctermfg=Green   ctermbg=Blue
highlight DallasCapSt  ctermfg=Yellow  ctermbg=Blue

let b:current_syntax = "dallas_log"
