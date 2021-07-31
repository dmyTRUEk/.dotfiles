" ----------------- This is dmyTRUEk's VIM config file -----------------
"
" v1.0 - 2019.11.01:
"   added: syntax, vim-plug, vim-sublime-monokai,
"     vim-airline, cursor, set cursorline, set number
"
" v1.1 - 2019.11.02:
"   added: youcompleteme
"   edited: vim-plug -> vundle, airline sections settings
"
" v1.2 - 2019.11.03:
"   added: relative line number, nerdtree,
"     bindings (move between panes, 0, $)
"   edited: vundle -> vim-plug
"   removed: long whitespace check
"
" v1.3 - 2019.11.04:
"   added: tab length, YouCompleteMe min chars
"
" v1.4 - 2019.12.18:
"   added: incsearch, papercolor, autochdir
" 
" v1.5 - 2020.01.06:
"   added: auto-pairs
"
" v1.6 - 2020.02.13:
"   edited: reordered commands in .vimrc
"
" v1.6.1 - 2020.02.23:
"   added: auto move to main editing window from NERDTree,
"     use plugins only for special file types:
"       Plug 'blahblah', {'for': ['a', 'b']}
"
" v1.6.2 - 2020.03.14:
" 	added: no preview on autocomplete
" 	edited: set default theme
"
" v1.7 - 2020.03.21:
"   edited: smart and auto tabs equal 4 spaces
"
" v1.8 - 2020.03.25:
"   added: in nerdtree sort by type and natural
"
" v2.0 - 2020.04.09:
"   added: vim-fugitive, vim-surround, vim-commentary
"   edited: comments refactor
"   removed: airline y section
"
" v2.1 - 2020.05.18:
"   added: vimtex, command :PdfLaTeX for compiling Latex to pdf
" 
" v2.2 - 2020.06.08:
"   added: gruvbox theme
"
" v2.3 - 2020.06.20:
"   added: mapping <C-HJKL> for moving in insert mode,
"     disabled <C-H> mapping from auto-pairs,
"     <Leader>p for :w and :PdfLaTeX, so it saves and converts to pdf
"   edited: changed blinking cursor to static
"
" v3.0 - 2020.09.21:
"   added: mapping for ukr language 
"   edited: moved all leader remaps into one section
"
" v3.1 - 2020.09.25:
"   added: run python, c++ code by leader key
"   edited: run pdflatex by <Leader>p -> <Leader>l,
"     deleted almost invisible <space> from <f2>-><C-w> binding
" 
" v3.2 - 2020.10.02:
"   added: ultisnips, my own snips for latex
"
" v3.2.1 - 2020.10.05:
"   added: be snippet for latex
"
" v3.2.2 - 2020.10.26:
"   added: goto definition and back,
"     more snippets
"
" v3.3.0 - 2020.11.10:
"   added: leader+q -> quit, leader+n -> nerdtreetoggle,
"     leader+r -> run rust, more snippets
"   edited: enumarate -> enumerate
"
" v3.3.1 - 2020.11.30:
"   added: new snippets for latex: c->center, ca->cases, date,
"     Y -> y$
"   edited: all snippets
"   removed: ESC delay, showcmd
"
" v3.4.0 - 2021.07.25:
"   added: force scroll content, not move cursor by mouse wheel
"   edited: added possibility to turn on nowrap option,
"     rewritten plugins section
"   removed: nerdtree on startup
"





" VIM settings:
set nocompatible            " dont use 'vi' (before vim) compability
set encoding=utf-8          " use utf-8 encoding
filetype plugin indent on   " turns on 'detection', 'plugin' and 'indent' at once
" filetype plugin indent on   " show existing tab with 4 spaces width
syntax enable               " highlight syntax

set number relativenumber   " set line numbers relative to caret
set cursorline              " highlight cursor line
set showmatch               " shows matching brackets
set autochdir               " change current dir to file's dir
set completeopt-=preview    " dont show preview if using autocomplete
set laststatus=2            " it controls, when/how to display the status-bar: 0=never, 1={if > than 2 windows}, 2=always
" set showcmd                 " show last command (if you pressed 'j' then 'j' will be showed)

" for better search:
set incsearch               " show search results immedeatly
set hlsearch                " highlight found
set ignorecase              " /word will find 'word' or 'Word' or 'WORD'
set smartcase               " When 'ignorecase' and 'smartcase' are both on, if a pattern contains an uppercase letter, it is case sensitive, otherwise, it is not. For example, '/The' would find only 'The', while '/the' would find 'the' or 'The'

" 'smart' tabs:
set tabstop=4               " when indenting with '>', use 4 spaces width
set shiftwidth=4            " On pressing tab, insert 4 spaces
set expandtab               " use spaces instead of tabs
set autoindent              " set tabs automatically, when starting new line

" Dont wrap lines: 
" set nowrap

" Scroll content instead of cursor line
set ttymouse=sgr

" remove ESC delay:
" https://www.johnhawthorn.com/2012/09/vi-escape-delays/
" set esckeys                "However, this will break any sequences using Escape in insert mode, DOESNT WORK?
set timeoutlen=1000
set ttimeoutlen=0



" my BINDINGS:
nnoremap <F2> <C-w>
nnoremap <F3> ^
nnoremap <F4> $

" move in insert mode:
inoremap <C-H> <Left>
inoremap <C-J> <Down>
inoremap <C-K> <Up>
inoremap <C-L> <Right>

" make Y copy till end of line
map Y y$

" {TODO} Use Alt-k and Alt-j to move line or selected lines up and down
" nnoremap <A-j> :m .+1<CR>==
" nnoremap <A-k> :m .-2<CR>==
" inoremap <A-j> <Esc>:m .+1<CR>==gi
" inoremap <A-k> <Esc>:m .-2<CR>==gi
" vnoremap <A-j> :m '>+1<CR>gv=gv
" vnoremap <A-k> :m '<-2<CR>gv=gv



" use ukr in normal mode:
set langmap=фисвуапршолдьтщзйкіегмцчня;abcdefghijklmnopqrstuvwxyz,ФИСВУАПРШОЛДЬТЩЗЙКІЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ



" CURSOR settings in different modes:
let &t_EI.="\e[2 q"         "EI = normal mode
let &t_SR.="\e[3 q"         "SR = replace mode
let &t_SI.="\e[6 q"         "SI = insert mode
" 1 - █ rectangle blinking
" 2 - █ rectangle
" 3 - _ underline blinking
" 4 - _ underline
" 5 - | vertical line blinking
" 6 - | vertical line



" if vim-plug not installed then install:
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" PLUGINS:

" themes:
"Plug 'nlknguyen/papercolor-theme'
"Plug 'ErichDonGubler/vim-sublime-monokai'
"Plug 'kjssad/quantum.vim'
Plug 'morhetz/gruvbox'

" vim extentions:
Plug 'vim-airline/vim-airline'
" better bottom status bar

Plug 'scrooloose/nerdtree'
" folders viewer inside vim (default on left side)

Plug 'tpope/vim-surround'
" cs'<t> inside '' => 'Hello world' -> <t>Hello world</t>

" for coding:
Plug 'valloric/youcompleteme'   
", {'for': ['cpp', 'python']}

Plug 'jiangmiao/auto-pairs'
" close brackets automatically

Plug 'tpope/vim-commentary'
" use 'gcc' (not c compiler) to comment line

" Plug 'tpope/vim-fugitive'
" a git wrapper so awesome, it should be illegal

" Plug 'scrooloose/syntastic'
" for syntax highlight
"
" Plug 'rust-lang/rust.vim'
" for rust syntax

" for latex:
Plug 'lervag/vimtex'        ,{'for': ['tex']}
" for LaTeX

Plug 'sirver/ultisnips'     ,{'for': ['tex']}
" for snippets in LaTeX

call plug#end()



" COLORSCHEME settings:
" papercolor:
"set background=light
"colorscheme PaperColor

" sublimemonokai:
"colorscheme sublimemonokai

" quantum:
"set termguicolors   " enable true colors support
"set background=light   " light theme
"colorscheme quantum

" gruvbox:
set background=dark
colorscheme gruvbox



" YouCompleteMe settings:
let g:ycm_min_num_of_chars_for_completion=1



" NERDTree settings:
" autocmd VimEnter * NERDTree         " launch on startup
autocmd VimEnter * set mouse=a      " enable changing panes size by mouse
autocmd VimEnter * wincmd w         " auto move to main panel

let NERDTreeSortOrder = ['[[extension]]']       " sort by type
let NERDTreeNaturalSort=1           " Sort files in natural order (f1, f5, f10, f100)

" let NERDTreeIgnore = ['\.pyc$']   "ignore files with this extension



" AutoPairs settings:
let g:AutoPairsMapCh=0



" AIRLINE settings:
let g:airline_powerline_fonts=1
"let g:airline_detect_spelllang=1
"let g:airline_section_a=""
"let g:airline_section_b=""
"let g:airline_section_c=""
"let g:airline_section_gutter=""
"let g:airline_section_x=""
let g:airline_section_y=""
let g:airline_section_z="Line: %l/%L Col: %c"
"let g:airline_section_error=""
"let g:airline_section_warning=""

let b:airline_whitespace_checks = ['indent', 'mixed-indent-file', 'conflicts']
"let b:airline_whitespace_checks = ['indent', 'trailing', 'long', 'mixed-indent-file', 'conflicts']

let g:Powerline_symbols='unicode'



" for LaTeX:
command PdfLaTeX ! echo '\n\n\n\n\n' && pdflatex -halt-on-error %:t
"if (&ft=='tex')
    " command PdfLaTeX ! echo '\n\n\n\n\n' && pdflatex -halt-on-error %:t
    " command wp w PdfLaTeX
"endif

let g:tex_flavor='latex'
" look at: https://habr.com/ru/post/445066/
" let g:vimtex_view_general_viewer='okular'
" let g:vimtex_view_general_options='--unique file:@pdf\#src:@line@tex'
" let g:vimtex_view_general_options_latexmk='--unique'
let g:vimtex_quickfix_mode=0
" set conceallevel=1
" let g:tex_conceal='abdmg'



" snippets for LaTeX:
let g:UltiSnipsExpandTrigger='<F8>'
let g:UltiSnipsJumpForwardTrigger='<F8>'
let g:UltiSnipsJumpBackwardTrigger='<F9>'
let g:UltiSnipsEditSplit="vertical"

" my snippets (~/.vim/UltiSnips/tex.snippets):
" snippet b "begin{...} ... end{}" b
" \begin{$1}
" 	$2
" \end{$1}
" $0
" endsnippet
" 
" snippet e "begin{equation} ... end{}" b
" \begin{equation}
" 	$1
" \end{equation}
" $0
" endsnippet
" 
" snippet it "begin{itemize} ... end{}" b
" \begin{itemize}
" 	$1
" \end{itemize}
" $0
" endsnippet
" 
" snippet n "begin{enumerate} ... end{}" b
" \begin{enumerate}
" 	$1
" \end{enumerate}
" $0
" endsnippet
" 
" snippet s "begin{split} ... end{}" b
" \begin{split}
" 	$1
" \end{split}
" endsnippet
" 
" snippet c "begin{center} ... end{}" b
" \begin{center}
" 	$1
" \end{center}
" $0
" endsnippet
" 
" snippet ca "begin{cases} ... end{}" b
" \begin{cases}
" 	$1
" \end{cases}
" $0
" endsnippet
" 
" snippet f "begin{figure} ... end{}" b
" \begin{figure} [H]
"     \centering
"     \includegraphics[scale=0.9]{$1}
"     \caption{$2}
" \end{figure}
" $0
" endsnippet
" 
" snippet t "begin{center+tabular} ... end{}" b
" \begin{center}
" \begin{tabular} {|c|c|}
"     \hline
"     $1
"     \hline
" \end{tabular}
" \end{center}
" $0
" endsnippet
" 
" 
" 
" snippet es "begin{equation+split} ... end{}" b
" \begin{equation}
" \begin{split}
" 	$1
" \end{split}
" \end{equation}
" $0
" endsnippet
" 
" snippet le "begin{fleqn+eqn}" b
" \begin{fleqn} [\parindent]
" \begin{equation}
" 	$1
" \end{equation}
" \end{fleqn}
" $0
" endsnippet
" 
" 
" 
" snippet / "\frac{}{}" i
" \frac{$1}{$2}$0
" endsnippet
" 
" snippet i "\item ..."
" \item $0
" endsnippet
" 
" 
" 
" snippet today "Today Date" i
" `date +%4Y.%2m.%2d`
" endsnippet






" LEADER MAPS:

" set leader key
let mapleader=" "

" save (Write) file:
nnoremap <Leader>w :w <CR>

" quit:
nnoremap <Leader>q :q <CR>

" NERDTreeToggle:
nnoremap <Leader>n :NERDTreeToggle <CR>

" go to Definition:
nnoremap <silent> <Leader>d md :YcmCompleter GoTo<CR>
" go to Back
nnoremap <silent> <Leader>b `d

" compile Latex to pdf:
nnoremap <Leader>l :w <bar> :PdfLaTeX <CR>

" run Python code:
nnoremap <Leader>p :wa <bar> :! python % <CR>

" compile+run C++ code:
nnoremap <Leader>c :wa <bar> :! g++ % -o "%<" && ./"%<" <CR>

" compile+run Rust code:
nnoremap <Leader>r :wa <bar> :! cargo run <CR>





" the end ;)
