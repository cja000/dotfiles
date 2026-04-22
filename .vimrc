set shell=/usr/bin/bash
" Pathogen load
set nocompatible                        " gets rid of all the crap that Vim does to be vi compatible
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on

" Mios
syntax on                                         " Enables syntax highlighting
set encoding=utf-8                                " UTF-8 support
set background=dark                               " Dark display
set filetype=on                                   " Add support for filetypes
"set noexpandtab                                  " Needed when using tabstop and shiftwidth
set smartindent                                   " Indent like 'autoindent', only smarter
set expandtab                                     " In Insert mode, tabs are replaced by spaces
set number                                        " Add linenumbers
set hlsearch                                      " Colorized search
set backspace=indent,eol,start                    " See manual for these options
"set viminfo=%,'50,\"100,n~/.viminfo              " Save the first 100 lines of each register in the viminfo file
set statusline=%f%m%r%h%w\ [POS=%l/%L(%p%%),%04v] " Set statusline
set laststatus=2                                  " Two rows
set wildmode=longest,list                         " Set fullist of tabcompletion suggestion
set tabstop=4                                     " Set the tabstop to 4
set shiftwidth=4                                  " Set the shiftwith to 4
set t_Co=256                                      " Set 256 color terminal
colorscheme desertink
set encoding=utf-8
set scrolloff=3                         " number of context lines you would like to see above and below the cursor
set showmode                            " see in which mode you are
set showcmd                             " see what command are you typing
set wildmenu                            " cmd line completion a-la zsh
set wildmode=list:longest
set ttyfast
"set undofile                           " files contain undo information
set gdefault                            " applies substitutions globally on lines
nnoremap <tab> %                        " tab key match bracket pairs instead of '%'
vnoremap <tab> %
" Backups
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files

:augroup vim
        :au BufNewFile,BufRead *.vim set tabstop=4
        :au BufNewFile,BufRead *.vim set shiftwidth=4
        :au BufNewFile,BufRead *.vim set filetype=vim
        :au BufNewFile,BufRead *.vim set smartindent
        :au BufNewFile,BufRead *.vim set nonumber
:augroup END

:augroup python
        :au BufNewFile,BufRead *.py set tabstop=4
        :au BufNewFile,BufRead *.py set shiftwidth=4
        :au BufNewFile,BufRead *.py set filetype=python
        :au BufNewFile,BufRead *.py set nonumber
        :au BufNewFile,BufRead *.py set foldmethod=indent
:augroup END

:augroup perl
        :au BufNewFile,BufRead *.p[lm] set tabstop=4
        :au BufNewFile,BufRead *.p[lm] set shiftwidth=4
        :au BufNewFile,BufRead *.p[lm] set filetype=perl
        :au BufNewFile,BufRead *.p[lm] set tags=/home/ematdep/tags " AutoST tags
        :au BufNewFile *.pl 0r /home/ematdep/.vim//plugin/templates/perl-file-header
        :au BufNewFile,BufRead *.p[lm] set autoindent
:augroup END

:augroup json
        :au BufNewFile,BufRead *.json set filetype=json
        :au BufNewFile,BufRead *.json set foldmethod=syntax
:augroup END

:augroup dallas_log
        :highlight OK ctermbg=green ctermfg=white
        :highlight NOK ctermbg=red ctermfg=white
        :au BufNewFile,BufRead *dallas_msg* set filetype=dallas_log
        :au BufNewFile,BufRead *dallas_msg* set nonumber
:augroup END

:augroup dallas_config
        :au BufNewFile,BufRead *.apn,*.wpp,*.mobile set filetype=dallas_config
        :au BufNewFile,BufRead *.apn,*.wpp,*.mobile set nonumber
:augroup END

:augroup autoTTlog
        :highlight OK ctermbg=green ctermfg=white
        :highlight NOK ctermbg=red ctermfg=white
        :au BufNewFile,BufRead *autott*.log set filetype=autoTTlog
        "Remove snmp commands from full_autott_trace.log
        map <silent> <F2> :g/Send snmp cmd/d<CR>
:augroup END

:augroup messges_log_files
        :highlight OK ctermbg=green ctermfg=white
        :highlight NOK ctermbg=red ctermfg=white
        :au BufNewFile,BufRead messages* set filetype=messages_log
        " Clean the messages log
        map <silent> <F3> :g/inetd\[\\|sshd\[\\|mgd\[\\|ftpd\[\\|login: \\|commandReq\\|opad.CliService\\|snmpd\[/d<CR>
:augroup END

:augroup log_files
        :highlight OK ctermbg=green ctermfg=white
        :highlight NOK ctermbg=red ctermfg=white
        :au BufNewFile,BufRead *autott*.log set filetype=logfiles
        "Remove snmp commands from full_autott_trace.log
        map <silent> <F2> :g/Send snmp cmd/d<CR>
:augroup END


" XML folding
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax
set foldlevelstart=1

"Comments
:au FileType c,cpp,java,ttcn let b:comment_leader = '// '
:au FileType sh,make,cfg,p[ylm] let b:comment_leader = '# '
:au FileType vim let b:comment_leader = '" '

:noremap <silent> ,c :<C-B>sil <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:noh<CR>
:noremap <silent> ,u :<C-B>sil <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:noh<CR>

" ===== Mios =====
" I don't know why termcap/terminfo is not working properly
" Force to clean the vi output when exit from vi
"let &t_ti = "\<Esc>[?1049h"
"let &t_te = "\<Esc>[?1049l"
" Restore terminal screen when exiting Vim
"if &term =~ "xterm"
"  set t_ti=[?47h t_te=[?47l
""  let &t_ti = "\<Esc>[?47h"
""  let &t_te = "\<Esc>[?47l"
"endif
"This unsets the 'last search pattern' register by hitting return
"nnoremap <CR> :noh<CR><CR>
let mapleader = ","
nnoremap <leader><space> :noh<cr>
" Improve searches
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
" Formating
"autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(
autocmd FileType python set complete+=k~/.vim/syntax/python.vim
" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
" Also make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+\|\s\+$/
au BufRead,BufNewFile *.yml,*.yaml match BadWhitespace /^\t\+\|\s\+$/
" Trim trailing whitespace
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
" Change representation of tab and eol
" set listchars=tab:>-,eol:¬
" Search for all the files that contains the macro under the cursor
"map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **/*.db" <Bar>
"cw<CR>
" Search for the file under the cursor
set path+=**
" vim-tabber
set tabline=%!tabber#TabLine()

" NERDTree
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

" ctags
nmap <F4> <C-w><C-]><C-w>T
nmap <F5> <C-]>
nmap <F6> <C-T>
