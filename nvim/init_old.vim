" ----------------- dmyTRUEk's NVIM config -----------------

filetype plugin indent on   " turns on 'detection', 'plugin' and 'indent' at once
syntax enable               " highlight syntax

" if VIM: use this if you dont want vi compatibility
"set nocompatible            " dont use 'vi' (before vim) compability

set encoding=utf-8          " use utf-8 encoding

set number relativenumber   " set line numbers relative to caret
set cursorline              " highlight cursor line
set showmatch               " shows matching brackets
set laststatus=2            " it controls, when/how to display status-bar: 0=never, 1={if > than 2 windows}, 2=always
set autochdir               " change current dir to file's dir (folder directory)
"set showcmd                 " ? show last command (if you pressed 'j' then 'j' will be showed)
set virtualedit=block

" better search
set incsearch               " show search results immedeatly
set hlsearch                " highlight found
set ignorecase              " /word will find 'word' or 'Word' or 'WORD'
set smartcase               " when 'ignorecase' and 'smartcase' are both on, if a pattern contains an uppercase letter, it is case sensitive, otherwise, it is not; for example, '/The' would find only 'The', while '/the' would find both 'the' and 'The'

" better tabs
set tabstop=4               " when indenting with '>', use 4 spaces width
set shiftwidth=4            " on pressing tab, insert 4 spaces
set expandtab               " use spaces instead of tabs
set autoindent              " set tabs automatically, when starting new line

"set nowrap                  " dont wrap lines

"set scrolloff=16            " minimal number of lines to keep between cursor and top/bottom of viewport (screen)

" remove esc delay
" https://www.johnhawthorn.com/2012/09/vi-escape-delays/
"set esckeys                "however, this will break any sequences using <esc> in insert mode
set timeoutlen=1000
set ttimeoutlen=0

" if VIM: remove this
" for clipboard in wayland+nvim to work
set clipboard+=unnamedplus

" for giant files
set redrawtime=10000

" change panes size by mouse
set mouse=a

" hide command line if it is not used directly
set cmdheight=0

" use ukr in normal mode
set langmap=ʼ~,аf,б\\,,вd,гu,дl,еt,є',ж\\;,зp,иb,іs,ї],йq,кr,лk,мv,нy,оj,пg,рh,сc,тn,уe,фa,х[,цw,чx,шi,щo,ьm,ю.,яz,АF,Б<,ВD,ГU,ДL,ЕT,Є\\",Ж:,ЗP,ИB,ІS,Ї},ЙQ,КR,ЛK,МV,НY,ОJ,ПG,РH,СC,ТN,УE,ФA,Х{,ЦW,ЧX,ШI,ЩO,ЬM,Ю>,ЯZ



" unmap ex mode
map Q <nop>
map Й <nop>

" fix `h` and `l` motions
nnoremap ch lc2h
nnoremap cl c2l
nnoremap dh ld2h
nnoremap dl d2l
nnoremap yh ly2h
nnoremap yl y2l

" better copy till end of line
nnoremap Y y$
nnoremap Н y$

" better bind for redo
nnoremap U <C-r>
nnoremap Г <C-r>

" swap 0 and ^
noremap 0 ^
noremap ^ 0

" swap ` and '
noremap ` '
noremap ' `

" better move to end of line
noremap - $

" find from end of line
nnoremap gf $F
nnoremap па $F

" work with function names:
nnoremap cn ct(
nnoremap dn dt(
nnoremap yn yt(
nnoremap cu ct_
nnoremap du df_
nnoremap d_ df_
" xnoremap  n  t(

nnoremap c; ct;
nnoremap d; dt;
nnoremap y; yt;

" move selected text up/down
" TODO: 1. fix it. 2. remap to something different.
" vnoremap J :m '>+1<cr>gv=gv
" vnoremap О :m '>+1<cr>gv=gv
" vnoremap K :m '<-2<cr>gv=gv
" vnoremap Л :m '<-2<cr>gv=gv

" TODO:
"xnoremap <leader>I :<C-U>call InsertAtBeginOfLine() <cr>
"xnoremap <leader>A :<C-U>call AppendAtEndOfLine() <cr>
" TODO: maybe one more plugin?)
"func! InsertAtBeginOfLine()
"    " TODO:
"    let l:mode = visualmode()
"    if l:mode ==# 'v'
"        " character-wise visual
"    elseif l:mode == 'V'
"        " line-wise visual
"    elseif l:mode == "\<C-V>"
"        " block-wise visual
"    else
"        echom "UNKNOWN VISUAL mode"
"    endif
"endf

" exit from insert mode:
"inoremap jk <esc>
"inoremap kj <esc>


" better binds for go half page down/up:
noremap <C-j> <C-d>zz
noremap <C-о> <C-d>zz
noremap <C-k> <C-u>zz
noremap <C-л> <C-u>zz

" move in insert mode:
" TODO: <C-;>
inoremap <C-;> <nop>
inoremap <C-ж> <nop>
inoremap <C-h> <left>
inoremap <C-р> <left>
inoremap <C-j> <down>
inoremap <C-о> <down>
inoremap <C-k> <up>
inoremap <C-л> <up>
inoremap <C-l> <right>
inoremap <C-д> <right>

" paste at end of line
nnoremap <C-p> $p
nnoremap <C-з> $p

" TODO:
" paste at begin of line
"nnoremap <C-S-p> 0p
"nnoremap <C-S-з> 0p


" TODO: <f1> -> open nvim help for current word
" noremap <f2> mapped in 'dmytruek/find-and-replace' plugin
noremap <f3> ^
noremap <f4> $
inoremap <f3> <home>
inoremap <f4> <end>
" TODO: insert mode: ctrl0- -> 0$


" set leader key
let mapleader = " "

xnoremap S :sort <cr>
xnoremap І :sort <cr>

" clear highlight after search
nnoremap <leader>o :nohlsearch <cr>
nnoremap <leader>щ :nohlsearch <cr>

" erase last symbol in line
nnoremap <leader>e m`$x``
nnoremap <leader>у m`$x``

" append symbols to end of line:
nnoremap <leader>; m`A;<esc>``
nnoremap <leader>ж m`A;<esc>``
nnoremap <leader>: m`A:<esc>``
nnoremap <leader>Ж m`A:<esc>``
nnoremap <leader>, m`A,<esc>``
nnoremap <leader>б m`A,<esc>``
nnoremap <leader>. m`A.<esc>``
nnoremap <leader>ю m`A.<esc>``

" WINDOW operations:
" save:
nnoremap <leader>w :w <cr>
nnoremap <leader>ц :w <cr>
nnoremap <leader>W :wa <cr>
nnoremap <leader>Ц :wa <cr>

" quit:
nnoremap <leader>q :q <cr>
nnoremap <leader>й :q <cr>
nnoremap <leader>Q :qa <cr>
nnoremap <leader>Й :qa <cr>

" save and quit:
nnoremap <leader>a :wq <cr>
nnoremap <leader>ф :wq <cr>
nnoremap <leader>A :wqa <cr>
nnoremap <leader>Ф :wqa <cr>

" move between windows inside vim:
nnoremap <leader>h :wincmd h <cr>
nnoremap <leader>р :wincmd h <cr>
nnoremap <leader>j :wincmd j <cr>
nnoremap <leader>о :wincmd j <cr>
nnoremap <leader>k :wincmd k <cr>
nnoremap <leader>л :wincmd k <cr>
nnoremap <leader>l :wincmd l <cr>
nnoremap <leader>д :wincmd l <cr>

" move windows themselves inside vim:
nnoremap <leader><leader>h :wincmd H <cr>
nnoremap <leader><leader>р :wincmd H <cr>
nnoremap <leader><leader>j :wincmd J <cr>
nnoremap <leader><leader>о :wincmd J <cr>
nnoremap <leader><leader>k :wincmd K <cr>
nnoremap <leader><leader>л :wincmd K <cr>
nnoremap <leader><leader>l :wincmd L <cr>
nnoremap <leader><leader>д :wincmd L <cr>

nnoremap <silent> <leader>v :call ToggleHorizontalVerticalSplit() <cr>
nnoremap <silent> <leader>м :call ToggleHorizontalVerticalSplit() <cr>



" TODO: make one more plugin?)
" my Change Current word with another (aka `viwy`):

" `cc` is duplication of `S`, so we can use it for our purposes, so firstly we clearing it
nnoremap cc <nop>
nnoremap сс <nop>

" map `cc<move>` to Change Current word with MOVE word
" this solution is better than `df<space>f<space>p` because it might not work if
" there is no space after second word (eg `,` `)` `\n` etc)

" TODO?: figure out better way to do this, so it works at least for `f<symbol>` or even any move

" TODO: fix it for ukr

" here `|` means cursor position
" a|aa bbb -> bbb| aaa
nnoremap ccw yiwwviwp2bviwp
" aaa.a|aa bbb.bbb -> bbb.bbb| aaa.aaa
nnoremap ccW yiWWviWp2BviWp

" aaa b|bb -> bbb aaa|
nnoremap ccb yiwbviwpwviwp
" aaa.aaa bbb.b|bb -> bbb.bbb aaa.aaa|
nnoremap ccB yiWBviWpWviWp

nnoremap cc2w yiw2wviwp3bviwp
nnoremap cc2W yiW2WviWp3BviWp
nnoremap cc2b yiw2bviwp2wviwp
nnoremap cc2B yiW2BviWp2WviWp

nnoremap cc3w yiw3wviwp4bviwp
nnoremap cc3b yiw3bviwp3wviwp
nnoremap cc3W yiW3WviWp4BviWp
nnoremap cc3B yiW3BviWp3WviWp



" spelling config:
" bind to toggle spelling for this file
nnoremap <leader>S :setlocal spell! <cr>
" enable spelling for this file types
autocmd FileType gitcommit,markdown setlocal spell


let g:python3_host_prog = '/usr/bin/python3'


""" Compiles:
" latex
autocmd BufReadPost *.tex nnoremap <leader>c :wa <bar> call CompileLatexToPDFsimple() <cr>
autocmd BufReadPost *.tex nnoremap <leader>с :wa <bar> call CompileLatexToPDFsimple() <cr>

" python
autocmd BufReadPost *.py nnoremap <leader>c :wa <bar> :! python3 % <cr>

" rust
autocmd BufReadPost *.rs nnoremap <leader>c :wa <bar> :! cargo test && cargo run <cr>

" c++
autocmd BufReadPost *.cpp nnoremap <leader>c :wa <bar> :! g++ % -o %:t:r.bin && ./%:t:r.bin <cr>

" neovim config file
autocmd BufReadPost init.vim nnoremap <leader>c :wa <bar> :source % <cr>
autocmd BufReadPost init.vim nnoremap <leader>с :wa <bar> :source % <cr>
" vim config file
"autocmd BufReadPost  .vimrc nnoremap <leader>c :wa <bar> :source % <cr>


" scrolloff: distance from window(viewport) top/bottom
let g:relative_scrolloff_fraction = 0.30

func! SetRelativeScrollOff(fraction)
    let l:visible_lines_in_active_window = winheight(win_getid())
    let &scrolloff = float2nr(l:visible_lines_in_active_window * a:fraction)
endf

autocmd BufEnter,BufLeave,BufWinEnter,BufWinLeave,WinNew,WinEnter,WinLeave,VimResized * call SetRelativeScrollOff(g:relative_scrolloff_fraction)
"nnoremap <silent> <C-r> :call SetRelativeScrollOff(g:relative_scrolloff_fraction) <cr> zz


" fix vim/neovim and alacritty compatibility:
" source: https://github.com/alacritty/alacritty/issues/919
" TODO?: turn on/off? if some strange bug will occur => remove next line:
"if &term == 'alacritty'
"    set term=xterm-256color
"    execute "set <xUp>=\e[1;*A"
"    execute "set <xDown>=\e[1;*B"
"    execute "set <xRight>=\e[1;*C"
"    execute "set <xLeft>=\e[1;*D"
"endif

" if VIM:
" scroll content instead of cursor line
"set ttymouse=sgr


" VIM or NEOVIM specific configs
" https://learnvimscriptthehardway.stevelosh.com/chapters/21.html
" https://vi.stackexchange.com/questions/12794/how-to-share-config-between-vim-and-neovim


func! ToggleHorizontalVerticalSplit()
    if !exists('t:splitType')
        let t:splitType = 'vertical'
    endif
    if t:splitType == 'vertical'
        windo wincmd K
        let t:splitType = 'horizontal'
    else
        windo wincmd H
        let t:splitType = 'vertical'
    endif
endf



" if vim-plug not installed then install it
" if VIM: change it to '~/.vim/autoload/plug.vim' in next and nextnext lines
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" PLUGINS:
call plug#begin()

""" Colorschemes:
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'nlknguyen/papercolor-theme'
Plug 'kjssad/quantum.vim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'rebelot/kanagawa.nvim'
Plug 'catppuccin/nvim'
Plug 'projekt0n/github-nvim-theme'
Plug 'navarasu/onedark.nvim'


""" Core Plugins:
" close brackets automatically
Plug 'jiangmiao/auto-pairs'

" enable repeat for plugins
Plug 'tpope/vim-repeat'

" surround manager
Plug 'tpope/vim-surround'

" exchange selections
Plug 'tommcdo/vim-exchange'

" better find in line
Plug 'unblevable/quick-scope'


""" General Plugins:
" comments manager
Plug 'tpope/vim-commentary'

" snippets
Plug 'sirver/ultisnips'

" git wrapper
" TODO?: enable and come up with some good binds
"Plug 'tpope/vim-fugitive'

" find and replace
Plug 'dmytruek/find-and-replace'
"Plug '~/Code/nvim-plugins/find-and-replace'

" arguments manager
"Plug 'dmytruek/argument-text-object'
"Plug '~/Code/nvim-plugins/argument-text-object'


""" UI Plugins:
" better status bar
" Plug 'nvim-lualine/lualine.nvim'
Plug '~/Code/nvim-plugins/lualine.nvim-my-fork'
" Plug '~/Code/nvim-plugins/lualine.nvim'

" file manager
Plug 'preservim/nerdtree'

" scrollbar
Plug 'Xuyuanp/scrollbar.nvim'

" better syntax highlight
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
"Plug '~/Code/nvim-plugins/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/playground'

" find files, text in them, change colorscheme(palette), etc
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"Plug 'nvim-telescope/telescope-fzy-native.nvim'


""" Programming Languages:
" lsp related
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
"Plug 'folke/lsp-colors.nvim'

" kotlin syntax highlight
"Plug 'udalov/kotlin-vim'    ,{'for': ['kt']}

" for latex
"Plug 'lervag/vimtex'        ,{'for': ['tex']}

" markdown preview in browser
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" rust-analyzer additional features (inlay hints, etc)
"Plug 'simrat39/rust-tools.nvim'
"Plug 'rust-lang/rust.vim'

call plug#end()




" paste at start of line
nnoremap <A-p> ^P
nnoremap <A-з> ^P




""" Colorscheme Settings:
set termguicolors   " enable true colors support
set background=dark
lua << EOF
require('gruvbox').setup {
    overrides = {
        Operator = { link = 'GruvboxOrange' }, -- undo italic
        -- change diagnostic colors:
        DiagnosticHint = { link = 'GruvboxYellow' },
        DiagnosticSignHint = { link = 'GruvboxYellowSign' },
        DiagnosticUnderlineHint = { link = 'GruvboxYellowUnderline' },
        DiagnosticFloatingHint = { link = 'GruvboxYellow' },
        DiagnosticVirtualTextHint = { link = 'GruvboxYellow' },
        -- rust btw
        --['@lsp.type.comment.rust'] = { link = 'GruvboxYellow' },
        ['@lsp.type.struct.rust'] = { link = 'GruvboxYellow' },
        -- TODO: special color for traits (interfaces).
        --['@lsp.type.interface.rust'] = { link = 'GruvboxOrange' },
        ['@lsp.typemod.comment.documentation.rust'] = { link = 'GruvboxOrange' },
    }
}
EOF
colorscheme gruvbox





""" Core Plugins Settings:
" auto-pairs (automatically pair brackets and quotes):
let g:AutoPairsMapCh = 0
let g:AutoPairsMultilineClose = 0
let g:AutoPairsShortcutToggle = ''
"autocmd BufReadPost * let g:AutoPairs['<'] = '>'
"autocmd BufReadPost *.cpp let g:AutoPairs['<'] = ''
" TODO: yswtOption: `|String` -> `Option<String>` (t stands for trait/type)
autocmd BufReadPost *.tex let g:AutoPairs['$'] = '$'
autocmd BufReadPost *.tex let g:AutoPairs['|'] = '|'


" vim-commentary (comment or uncomment lines):
" ukr binds:
nmap псс <Plug>CommentaryLine
map пс <Plug>Commentary


" vim-surround (yank(add,create), change, delete surround, like brackets, quotes):
" better map in visual mode:
let g:surround_no_mappings = 1 " bc of my 'xnoremap S'
nmap ds  <Plug>Dsurround
nmap cs  <Plug>Csurround
nmap cS  <Plug>CSurround
nmap ys  <Plug>Ysurround
nmap yS  <Plug>YSurround
nmap yss <Plug>Yssurround
nmap ySs <Plug>YSsurround
nmap ySS <Plug>YSsurround
xmap s   <Plug>VSurround
xmap і   <Plug>VSurround
" TODO: surround by spaces without double press space
"autocmd FileType * let g:surround_{char2nr(" ")} = " \r "
autocmd FileType * let g:surround_{char2nr("\<CR>")} = "\n\t\r\n"
autocmd FileType * let b:surround_{char2nr("<")} = "<\r>"
autocmd FileType * let b:surround_{char2nr("(")} = "(\r)"
autocmd FileType * let b:surround_{char2nr(")")} = "(\r)"
autocmd FileType * let b:surround_{char2nr("[")} = "[\r]"
autocmd FileType * let b:surround_{char2nr("]")} = "[\r]"
autocmd FileType * let b:surround_{char2nr("{")} = "{\r}"
autocmd FileType * let b:surround_{char2nr("}")} = "{\r}"
autocmd FileType markdown let b:surround_{char2nr("l")} = "[\r]()"
autocmd FileType markdown let b:surround_{char2nr("L")} = "[](\r)"
autocmd FileType python let b:surround_{char2nr("I")} = "Iterator[\r]"
autocmd FileType python let b:surround_{char2nr("L")} = "list[\r]"
autocmd FileType python let b:surround_{char2nr("T")} = "tuple[\r]"
autocmd FileType python let b:surround_{char2nr("i")} = "filter(\r)"
autocmd FileType python let b:surround_{char2nr("l")} = "list(\r)"
autocmd FileType python let b:surround_{char2nr("m")} = "map(\r)"
autocmd FileType python let b:surround_{char2nr("r")} = "range(\r)"
autocmd FileType python let b:surround_{char2nr("t")} = "\1Type: \1[\r]"
let s:wrap_in_new  = "\1Container Type: \1::new(\r)"
let s:wrap_in_type = "\1Container Type: \1<\r>"
let s:wrap_in_ok   = "Ok(\r)"
autocmd FileType rust let b:surround_{char2nr("b")} = "Box::new(\r)"
autocmd FileType rust let b:surround_{char2nr("B")} = "Box<\r>"
autocmd FileType rust let b:surround_{char2nr("c")} = s:wrap_in_new
autocmd FileType rust let b:surround_{char2nr("C")} = s:wrap_in_type
autocmd FileType rust let b:surround_{char2nr("e")} = "Err(\r)"
autocmd FileType rust let b:surround_{char2nr("i")} = "if \1If statement: \1 {\n\t\r\n}"
autocmd FileType rust let b:surround_{char2nr("k")} = s:wrap_in_ok
autocmd FileType rust let b:surround_{char2nr("m")} = "\1Macro name: \1!(\r)"
autocmd FileType rust let b:surround_{char2nr("n")} = s:wrap_in_new
autocmd FileType rust let b:surround_{char2nr("o")} = s:wrap_in_ok
autocmd FileType rust let b:surround_{char2nr("O")} = "Option<\r>"
autocmd FileType rust let b:surround_{char2nr("r")} = "Result<\r>"
autocmd FileType rust let b:surround_{char2nr("s")} = "Some(\r)"
autocmd FileType rust let b:surround_{char2nr("t")} = s:wrap_in_new
autocmd FileType rust let b:surround_{char2nr("T")} = s:wrap_in_type
autocmd FileType rust let b:surround_{char2nr("v")} = "vec![\r]"
autocmd FileType rust let b:surround_{char2nr("V")} = "Vec<\r>"
autocmd FileType tex let b:surround_{char2nr("l")} = "\\\1Name: \1{\r}"
autocmd FileType tex let b:surround_{char2nr("L")} = "\\begin{\1Environment: \1}\r\\end{\1\1}"
autocmd FileType tex let b:surround_{char2nr("b")} = "\\textbf{\r}"
autocmd FileType tex let b:surround_{char2nr("i")} = "\\textit{\r}"
autocmd FileType tex let b:surround_{char2nr("u")} = "\\underline{\r}"
autocmd FileType tex let b:surround_{char2nr("t")} = "\\text{\r}"


" vim-exchange (swap two text selections):
" better map in visual mode:
vnoremap x <Plug>(Exchange)
vnoremap ч <Plug>(Exchange)
nnoremap X <Plug>(Exchange)
nnoremap Ч <Plug>(Exchange)


" quick-scope (highlight when pressing `f`):
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" TODO?: better highlight colors





""" General Plugins Settings:
" ultisnips (snippets engine and manager):
let g:UltiSnipsExpandTrigger='<nop>'
let g:UltiSnipsJumpForwardTrigger='<nop>'
let g:UltiSnipsJumpBackwardTrigger='<nop>'
let g:UltiSnipsEditSplit="horizontal"
inoremap <f8>  <C-r>=UltiSnips#ExpandSnippetOrJump() <cr>
inoremap <f9>  <C-r>=UltiSnips#ExpandSnippetOrJump() <cr>
inoremap <f10> <C-r>=UltiSnips#ExpandSnippetOrJump() <cr>
"inoremap <f10> <C-r>=UltiSnips#JumpBackwards() <cr>


" vim-fugitive (git wrapper):
" TODO?: if use it: come up with some good binds


" argument-text-object (select(visually), delete, change, yank(copy) arguments):
"let g:argtextobj_disable_remaps = 1
"let g:argtextobj_search_limit = 100


" find-and-replace (bind for easy find and replace):
"let g:findandreplace_disable_remaps = 1

" DO YOU KNOW THIS MAN?
" thisisspamtonyes
" spamton spamton
" spamton
" spamton
" spamton spamton spamton





""" UI Plugins Settings:
" lualine (even better status line):
lua << END
require('lualine').setup {
    options = {
        theme = 'powerline_dark', -- gruvbox, kanagawa
        component_separators = { left = '', right = ''},
        section_separators   = { left = '', right = ''},
        always_divide_middle = false,
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'filename' },
        lualine_c = {
            'branch',
            'diff',
        },
        lualine_x = {
            {
                'encoding',
                fmt = function(str) if str == 'utf-8' then return '' else return str end end,
            },
            {
                'fileformat',
                symbols = {
                    unix = '',  -- e712 - 
                    dos  = '', -- e70f
                    mac  = '', -- e711
                },
            },
            --'filetype',
        },
        lualine_y = {
            {
                'diagnostics',
                --sources = { 'nvim_diagnostic' },
                sections = { 'error', 'warn', 'info', 'hint' },
                diagnostics_color = {
                    error = 'DiagnosticError',
                    warn  = 'DiagnosticWarn',
                    info  = 'DiagnosticInfo',
                    hint  = 'DiagnosticHint',
                },
                symbols = {
                    error = '󰅚 ', -- 󰅙
                    warn  = ' ', -- 
                    info  = ' ', -- 
                    hint  = ' ', --  
                },
                update_in_insert = true,
                always_visible = false,   -- Show diagnostics even if there are none.
                colored = true,
            },
            {
                'selectioncount',
                format = {
                    single_line_no_multibyte = '%c',
                    single_line_multibyte = '%c-%b',
                    multi_line_no_multibyte = '%c / %l',
                    multi_line_multibyte = '%c-%b / %l',
                    visual_block_mode = '%cx%l',
                },
            },
            {
                'searchcount',
                maxcount = 99999,
            },
        },
        lualine_z = {
            function()
                local line = vim.fn.line('.')
                local lines_total = vim.fn.line('$')
                local col = vim.fn.virtcol('.')
                return string.format('Line: %d/%d, Col: %d', line, lines_total, col)
            end
        },
    },
}
END


" nerdtree (in-nvim file manager):
let NERDTreeSortOrder = ['[[extension]]']   " sort by type
let NERDTreeNaturalSort = 1         " sort files in natural order (f1, f5, f10, f100)
nnoremap <leader>n :NERDTreeToggle <cr>
nnoremap <leader>т :NERDTreeToggle <cr>
"autocmd VimEnter * NERDTree        " launch on startup
"autocmd VimEnter * wincmd w        " auto move to main panel
let NERDTreeIgnore = ['\.bin$', '\.png$', '\.jpg$', '\.jpeg'] " ignore files with this extension


" scrollbar (show scroll progress as bar on the right):
augroup ScrollbarInit
    autocmd!
    " + QuitPre, but why?
    autocmd FocusGained,VimEnter,VimResized,WinScrolled * silent! lua require('scrollbar').show()
    " this line breaks nvim's diff mode:
    " autocmd WinEnter * silent! lua require('scrollbar').show()
    autocmd BufLeave,BufWinLeave,FocusLost,WinLeave * silent! lua require('scrollbar').clear()
augroup end
let g:scrollbar_min_size = 1
let g:scrollbar_max_size = 10
let g:scrollbar_right_offset = 0
let g:scrollbar_winblend = 50
let g:scrollbar_shape = { 'head': '', 'body': '░', 'tail': '' }


" treesitter:
lua << EOF
require('nvim-treesitter.configs').setup {
    ensure_installed = {
        'c', 'lua', 'vim', 'help', -- these are reqired
        --'cpp',
        --'kotlin',
        --'latex',
        'python',
        'rust',
        --'yaml',
        'yuck',
    },
    highlight = {
        enable = true,
        disable = function(lang, bufnr)
            --return vim.api.nvim_buf_line_count(bufnr) > 99999
            return vim.fn.getfsize(vim.api.nvim_buf_get_name(bufnr)) > 999999
        end,
    },
    --indent = { enable = false, disable = { 'python', 'css' } },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<c-backspace>',
        },
    },
    textobjects = { -- `nvim-treesitter-textobjects` required for this
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                ['aa'] = '@assignment.outer',
                ['ia'] = '@assignment.rhs',
                -- You can use the capture groups defined in textobjects.scm
                --['ab'] = '@block.outer',
                --['ib'] = '@block.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ap'] = '@parameter.outer',
                ['ip'] = '@parameter.inner',
                ['ar'] = '@return.outer',
                ['ir'] = '@return.inner',
                ['as'] = '@assignment.outer',
                ['is'] = '@assignment.rhs',
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- set jumps in jumplist
            goto_next_start = {
                [']]'] = '@block.inner',
                [']a'] = '@assignment.rhs',
                [']b'] = '@block.inner',
                [']c'] = '@class.outer',
                [']f'] = '@function.outer',
                [']m'] = '@scopename.inner',
                [']p'] = '@parameter.inner',
                [']r'] = '@return.inner',
                [']s'] = '@assignment.rhs', -- TODO: resolve conflict/overlap with next spelling
            },
            goto_previous_start = {
                ['[['] = '@block.inner',
                ['[a'] = '@assignment.rhs',
                ['[b'] = '@block.inner',
                ['[c'] = '@class.outer',
                ['[f'] = '@function.outer',
                ['[m'] = '@scopename.inner',
                ['[p'] = '@parameter.inner',
                ['[r'] = '@return.inner',
                ['[s'] = '@assignment.rhs', -- TODO: resolve conflict/overlap with next spelling
            },
            goto_next_end = {
                [']A'] = '@assignment.rhs',
                [']B'] = '@block.inner',
                [']C'] = '@class.outer',
                [']F'] = '@function.outer',
                [']M'] = '@scopename.inner',
                [']P'] = '@parameter.inner',
                [']R'] = '@return.inner',
                [']S'] = '@assignment.rhs',
                [']['] = '@block.inner',
            },
            goto_previous_end = {
                ['[A'] = '@assignment.rhs',
                ['[B'] = '@block.inner',
                ['[C'] = '@class.outer',
                ['[F'] = '@function.outer',
                ['[M'] = '@scopename.inner',
                ['[P'] = '@parameter.inner',
                ['[R'] = '@return.inner',
                ['[S'] = '@assignment.rhs',
                ['[]'] = '@block.inner',
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ['>p'] = '@parameter.inner',
            },
            swap_previous = {
                ['<p'] = '@parameter.inner',
            },
        },
    },
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
        },
    },
}
EOF


" telescope (different pickers, sorters and previewers):
nnoremap gd        :Telescope lsp_definitions <cr>
nnoremap gD        :Telescope lsp_type_definitions <cr>
nnoremap gr        :Telescope lsp_references <cr>
nnoremap gi        :Telescope lsp_implementations <cr>
nnoremap <leader>b :Telescope buffers <cr>
nnoremap <leader>и :Telescope buffers <cr>
nnoremap <leader>f :Telescope find_files <cr>
nnoremap <leader>а :Telescope find_files <cr>
nnoremap <leader>g :Telescope live_grep <cr>
nnoremap <leader>п :Telescope live_grep <cr>
nnoremap <leader>s :Telescope spell_suggest <cr>
nnoremap <leader>і :Telescope spell_suggest <cr>
nnoremap <leader>p :Telescope colorscheme <cr>
nnoremap <leader>з :Telescope colorscheme <cr>
nnoremap <leader>u :Telescope jumplist <cr>
nnoremap <leader>г :Telescope jumplist <cr>
"nnoremap <leader>x :Telescope quickfix <cr>
lua << EOF
local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<esc>'] = actions.close
            },
        },
    },
}
EOF





""" Programming Languages Settings:
" markdown-preview (github's markdown preview):
let g:mkdp_browser = 'firefox'
let g:mkdp_page_title = '${name}.md'
let g:mkdp_filetypes = ['markdown']
let g:mkdp_preview_options = { 'sync_scroll_type': 'relative' }
nnoremap <leader>m <cmd>MarkdownPreview <cr>


" lsp (language server protocol):
set completeopt=menu,menuone

"nnoremap <silent> gd        <cmd>lua vim.lsp.buf.definition() <cr>
"nnoremap <silent> gr        <cmd>lua vim.lsp.buf.references() <cr>
nnoremap <silent> <leader>r <cmd>lua vim.lsp.buf.rename() <cr>
nnoremap <silent> <leader>d <cmd>lua vim.diagnostic.open_float() <cr>
nnoremap <silent> g[        <cmd>lua vim.diagnostic.goto_prev() <cr>
"nnoremap <silent> <c-[>     <cmd>lua vim.diagnostic.goto_prev() <cr>
nnoremap <silent> g]        <cmd>lua vim.diagnostic.goto_next() <cr>
nnoremap <silent> <c-]>     <cmd>lua vim.diagnostic.goto_next() <cr>
nnoremap <silent> ga        <cmd>lua vim.lsp.buf.code_action() <cr>
nnoremap <silent> K         <cmd>lua vim.lsp.buf.hover() <cr>
"nnoremap <silent> gD        <cmd>lua vim.lsp.buf.type_definition() <cr>
" TODO?: <leader>i -> inline variable -> possible, bc when press `ga` there it exists
" TODO?: <leader>i -> autoimport this thing
"nnoremap <silent> <c-k>    <cmd>lua vim.lsp.buf.signature_help() <cr>
"nnoremap <silent> g0       <cmd>lua vim.lsp.buf.document_symbol() <cr>
"nnoremap <silent> gW       <cmd>lua vim.lsp.buf.workspace_symbol() <cr>

lua << EOF
-- enable this to print debug info to ~/.cache/nvim/lsp.log
--vim.lsp.set_log_level('debug')
local cmp = require('cmp')
cmp.setup {
    mapping = {
        ['<cr>'] = cmp.mapping.confirm({ select = true }),
        ['<tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ['<S-tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,
        ['<A-space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        --['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        --['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        --['<C-y>'] = cmp.config.disable, -- specify `cmp.config.disable` if you want to remove default `<C-y>` mapping
        --['<C-e>'] = cmp.mapping({
        --    i = cmp.mapping.abort(),
        --    c = cmp.mapping.close(),
        --}),
    },
    sources = {
        { name = 'nvim_lsp' }, --, group_index = 1
        --{ name = "nvim_lsp_signature_help" },  -- TODO: try it (from https://github.com/hrsh7th/nvim-cmp/wiki/Language-Server-Specific-Samples)
        -- TODO: dont ignore \ and ' in latex
        { name = 'buffer', option = { keyword_pattern = [[\Z\k\+]] } }, --, group_index = 3
        { name = 'path' },
        { name = 'ultisnips' }, -- for ultisnips users (, group_index = 2)
        --{ name = 'vsnip' },                    -- for vsnip users
        --{ name = 'snippy' },                   -- for snippy users
        --{ name = 'luasnip' },                  -- for luasnip users
    },
    snippet = {
        -- REQUIRED, IMPORTANT!!! - you MUST specify a snippet engine
        expand = function(args)
            vim.fn['UltiSnips#Anon'](args.body)           -- for `ultisnips` users
            --vim.fn["vsnip#anonymous"](args.body)        -- for `vsnip` users
            --require'snippy'.expand_snippet(args.body)   -- for `snippy` users
            --require'luasnip'.lsp_expand(args.body)      -- for `luasnip` users
        end,
    },
}
-- use buffer source for `/` (if you enabled `native_menu`, this won't work anymore)
--cmp.setup.cmdline('/', {
--    sources = {
--        { name = 'buffer' }
--    }
--})
-- use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore)
--cmp.setup.cmdline(':', {
--    sources = cmp.config.sources({
--        { name = 'path' }
--    }, {
--        { name = 'cmdline' }
--    })
--})
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local servers = {
    'rust_analyzer', -- TODO: enable `clippy`
    'pyright',
    'clangd',
}
for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
        capabilities = capabilities
    }
end
EOF





""" Latex Setup:

autocmd BufReadPost *.tex call s:SetupEverythingForLatex()

func! CompileLatexToPDFsimple()
    ! echo '\n\n\n\n\n' && pdflatex -halt-on-error -synctex=1 %:t
endf

" enable/disable vim to zathura sync
func! LatexAutoSyncDisable()
    let g:is_latex_auto_sync_enabled = 0
endf
func! LatexAutoSyncEnable()
    let g:is_latex_auto_sync_enabled = 1
endf

" enable/disable autocompile
func! LatexAutoCompileDisable()
    let g:is_latex_auto_compile_enabled = 0
endf
func! LatexAutoCompileEnable()
    let g:is_latex_auto_compile_enabled = 1
endf

" enable/disable autocompile and sync
func! LatexAutosDisable()
    call LatexAutoCompileDisable()
    call LatexAutoSyncDisable()
endf
func! LatexAutosEnable()
    call LatexAutoCompileEnable()
    call LatexAutoSyncEnable()
endf

func! s:SetupEverythingForLatex()
    setlocal spell spelllang=uk,en
    syntax spell toplevel

    nnoremap j gj
    nnoremap k gk
    nnoremap о gj
    nnoremap л gk
    inoremap <C-j> <C-o>gj
    inoremap <C-о> <C-o>gj
    inoremap <C-k> <C-o>gk
    inoremap <C-л> <C-o>gk

    nnoremap 0 g^
    nnoremap - g$

    let g:tex_flavor = 'latex'

    " look at: https://habr.com/ru/post/445066/
    let g:vimtex_quickfix_mode = 0
    let g:vimtex_view_method = 'zathura'

    let g:AutoPairs["'"] = ""
    let g:AutoPairs["`"] = ""

    " for autocompile and sync:
    let g:is_latex_auto_sync_enabled = 1
    let g:is_latex_auto_compile_enabled = 1

    autocmd CursorMoved *.tex call s:LatexSyncFromVimToZathura()
    "autocmd CursorMovedI *.tex call s:LatexSyncFromVimToZathura()

    let g:is_latex_compiling_now = 0
    let g:compile_latex_to_pdf_exit_code_last = 1
    let g:compile_latex_to_pdf_exit_code_prev = 1

    " set hold delay
    "set updatetime=1500
    autocmd TextChanged *.tex call s:CompileLatexToPDFasync()
    autocmd InsertLeave *.tex call s:CompileLatexToPDFasync()
    "autocmd CursorHoldI *.tex call s:CompileLatexToPDFasync()
    "autocmd InsertLeave *.tex call s:CompileLatexToPDFasync()
    "autocmd CursorMovedI *.tex call s:CompileLatexToPDFasync()
endf



" TODO: make async, so that vim dont slowdown when scrolling with sync enabled
func! s:LatexSyncFromVimToZathura()
    if g:compile_latex_to_pdf_exit_code_last == 0 && g:is_latex_auto_sync_enabled
        " remove `silent` for debugging
        execute "silent !zathura --synctex-forward " . line('.').":".col('.').":".bufname('%') . " " . expand('%:t:r').".pdf"
    endif
endf

" it's private, but not with `s:` prefix, bc `on_exit` can call only public functions
func! PrivateCompileLatextoPDFasyncOnExit(j, c, e)
    let g:compile_latex_to_pdf_exit_code_prev = g:compile_latex_to_pdf_exit_code_last
    let g:compile_latex_to_pdf_exit_code_last = a:c
    echom 'pdflatex finished. exit code: ' . g:compile_latex_to_pdf_exit_code_last

    " this `if` needed for case when prev compile wasnt successful, and
    " therefore simply calling `s:LatexSyncFromVimToZathura()` will
    " open new window + reload old one
    if g:compile_latex_to_pdf_exit_code_prev == 0
        " synchronize latex (vim) and pdf (zathura) using new synctex file
        call s:LatexSyncFromVimToZathura()
    endif

    " unlock another possible instances of this function
    let g:is_latex_compiling_now = 0
endf

func! s:CompileLatexToPDFasync()
    if g:is_latex_auto_compile_enabled && g:is_latex_compiling_now == 0
        " lock another possible instances of this function
        let g:is_latex_compiling_now = 1

        " save file before compiling
        execute "w"

        " compile file
        call jobstart("pdflatex -halt-on-error -synctex=1 " . bufname("%"), {"on_exit": "PrivateCompileLatextoPDFasyncOnExit"})
    endif
endf





" end :D
