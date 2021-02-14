syntax on
colorscheme darkblue
set et! 
set backspace=indent,eol,start
set shiftwidth=4
set softtabstop=4
set number
set ruler
set incsearch
set hlsearch
set wildmenu
set nowrap
highlight Comment ctermfg=red
highlight pythonString ctermfg=green
highlight pythonInclude ctermfg=cyan
highlight pythonFunction ctermfg=yellow
highlight linenr ctermfg=Magenta
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
