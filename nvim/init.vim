" ----------------- This is dmyTRUEk's NVIM config file -----------------
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
"   added: no preview on autocomplete
"   edited: set default theme
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
" v4.0.0 - 2021.08.04:
"   added: if term=alacritty => term=xterm-256color (for some bug fix),
"     vim or neovim specific settings, cursor min dist from edges,
"     custom airline_section_x = vim/neovim
"
" v4.1.0 - 2021.08.10:
"   added: leader+hjkl to move between windows in vim
"   edited: fixed goto definition and back
"   removed: scrolloff, compile latex and c/c++
"
" v4.2.0 - 2021.09.14:
"   added: vim-latex-zathura synchronization
"
" v4.2.1 - 2021.09.17:
"   added: fractional scrolloff
"
" v5.0.0 - 2021.09.18:
"   edited: migrated from VIM to NVIM
"     but this config file still almost fully compatible with vim,
"     just attentively read lines that starts with `if VIM:`
"
" v5.1.0 - 2021.09.21:
"   added: set leader+l/p/r only for latex/python/rust files,
"     map in tex files j/k -> gj/gk, completion from buffer(file)
"     (use all words from current file)
"   edited: completions: much better functionality, ux and visuals
"
" v5.1.1 - 2021.09.21:
"   removed: unused plugins
"
" v5.1.2 - 2021.09.24:
"   added: ukrainian language for completion
"
" v5.1.3 - 2021.09.25:
"   added: enable/disable all latex autos
"
" v5.2.0 - 2021.09.25:
"   added: map `cc<MOVE>` to Change Current word with MOVE word
"
" v5.3.0 - 2021.10.31:
"   added: vim-exchange (cxx)
"
" v6.0.0 - 2021.11.13:
"   changed: moved from `completion-nvim` to `nvim-cmp`
"





filetype plugin indent on   " turns on 'detection', 'plugin' and 'indent' at once
syntax enable               " highlight syntax

" if VIM: use this if you dont want vi compatibility
"set nocompatible            " dont use 'vi' (before vim) compability

set encoding=utf-8          " use utf-8 encoding

set number relativenumber   " set line numbers relative to caret
set cursorline              " highlight cursor line
set showmatch               " shows matching brackets
set autochdir               " change current dir to file's dir
set completeopt-=preview    " dont show preview if using autocomplete
set laststatus=2            " it controls, when/how to display the status-bar: 0=never, 1={if > than 2 windows}, 2=always
"set showcmd                 " ? show last command (if you pressed 'j' then 'j' will be showed)

" better search:
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

" remove ESC delay:
" https://www.johnhawthorn.com/2012/09/vi-escape-delays/
" set esckeys                "However, this will break any sequences using Escape in insert mode
set timeoutlen=1000
set ttimeoutlen=0

" for Clipboard in Wayland+NVIM to work:
" if VIM: remove this
set clipboard+=unnamedplus

" Set leader key:
let mapleader = " "

" Save (Write) file:
nnoremap <leader>w :w <CR>

" Quit:
nnoremap <leader>q :q <CR>

" Save (Write) All files:
nnoremap <leader>W :wa <CR>

" Quit All without saving:
nnoremap <leader>Q :qa! <CR>

" Save All and Quit All:
nnoremap <leader>A :wqa <CR>

" move between windows inside vim:
nnoremap <leader>h :wincmd h <CR>
nnoremap <leader>j :wincmd j <CR>
nnoremap <leader>k :wincmd k <CR>
nnoremap <leader>l :wincmd l <CR>



" SCROLLOFF: distance from window(viewport) top/bottom
" set scrolloff=16            " minimal number of lines to keep between cursor and top/bottom of viewport (screen)
let g:scrolloff_fraction = 0.15

function SetFractionalScrollOff(fraction)
    let l:visible_lines_in_active_window = winheight(win_getid())
    let &scrolloff = float2nr(l:visible_lines_in_active_window * a:fraction)
endfunction

autocmd BufEnter,WinEnter,WinNew,VimResized * call SetFractionalScrollOff(g:scrolloff_fraction)



" my Change Current word with another:
function Nothing()
    " nothing ;)
    " `echom` used instead of `echo`, because it seems faster
    echom ""
endfunction

" `cc` is duplication of `S`
" so i can use it for my purposes
" so firstly i clearing it:
nnoremap cc :call Nothing() <CR>

" map `cc<MOVE>` to Change Current word with MOVE word
" this solution is better than `df<space>f<space>p` because it might not work
" if there is no space after second word (for example `,` or `)` or `\n` or other)

" here `|` means cursor position
" aa|a bbb -> bbb| aaa
nnoremap ccw viwywviwp2bviwp
" aaa bb|b -> bbb aaa|
nnoremap ccb viwybviwpwviwp

" aaa.aa|a bbb.bbb -> bbb.bbb| aaa.aaa
nnoremap ccW viWyWviWp2BviWp
" aaa.aaa bbb.bbb| -> bbb.bbb aaa.aaa|
nnoremap ccB viWyBviWpWviWp

nnoremap cc2w viwy2wviwp3bviwp
nnoremap cc2b viwy2bviwp2wviwp
nnoremap cc2W viWy2WviWp3BviWp
nnoremap cc2B viWy2BviWp2WviWp

nnoremap cc3w viwy3wviwp4bviwp
nnoremap cc3b viwy3bviwp3wviwp
nnoremap cc3W viWy3WviWp4BviWp
nnoremap cc3B viWy3BviWp3WviWp



" Fix Vim/Neovim and Alacritty compatibility:
" source: https://github.com/alacritty/alacritty/issues/919
" TODO: turn on/off?
" if some strange BUG will occur => remove next line:
"if &term == 'alacritty'
"    set term=xterm-256color
"    execute "set <xUp>=\e[1;*A"
"    execute "set <xDown>=\e[1;*B"
"    execute "set <xRight>=\e[1;*C"
"    execute "set <xLeft>=\e[1;*D"
"endif



" VIM or NEOVIM specific configs
" https://learnvimscriptthehardway.stevelosh.com/chapters/21.html
" https://vi.stackexchange.com/questions/12794/how-to-share-config-between-vim-and-neovim
if has('nvim')
    " echom 'NEOVIM'

    let g:airline_section_x = 'NEOVIM'

else
    " echom 'VIM'

    " Scroll content instead of cursor line
    " set ttymouse=sgr

    let g:airline_section_x = 'VIM'

endif



" remaps in NORMAL mode:
" TODO: <F1> -> nvim help for current word
" nnoremap <F2> <C-w>   " deprecated: for change window use `<leader>hjkl` instead
nnoremap <F3> ^
nnoremap <F4> $

" remaps in INSRET mode:
" move in insert:
inoremap <C-H> <Left>
inoremap <C-J> <Down>
inoremap <C-K> <Up>
inoremap <C-L> <Right>

" remaps in VISUAL mode:
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" make Y copy till end of line
nnoremap Y y$



" use ukr in normal mode:
" TODO: update
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
" if VIM: change it to '~/.vim/autoload/plug.vim' in next and nextnext lines
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" PLUGINS:
call plug#begin()

" Color Themes:
"Plug 'nlknguyen/papercolor-theme'
"Plug 'ErichDonGubler/vim-sublime-monokai'
"Plug 'kjssad/quantum.vim'
Plug 'morhetz/gruvbox'

" Status Bar (bottom):
Plug 'vim-airline/vim-airline'

" File Manager inside vim (default on left side):
Plug 'scrooloose/nerdtree'

" Vim Surround:
" cs'<t> inside '' => 'Hello world' -> <t>Hello world</t>
" TODO?: ys( == ys)   https://github.com/tpope/vim-surround/issues/314
Plug 'tpope/vim-surround'

" Auto Completion:
" if VIM: i think easier to use this instead of LSP based solution
"Plug 'valloric/youcompleteme'
", {'for': ['cpp', 'python']}

" Close Brackets automatically:
Plug 'jiangmiao/auto-pairs'

" Comments manager: 'gcc' (not C compiler) to comment/uncomment line:
Plug 'tpope/vim-commentary'

" Highlight words' unique symbols when pressing f F t T
Plug 'unblevable/quick-scope'

" Exchange two selections: swap two words: goto word1 -> `cxiw` -> goto word2 -> `cx.`
Plug 'tommcdo/vim-exchange'

" Git wrapper so awesome, it should be illegal:
"Plug 'tpope/vim-fugitive'

" ? Syntax Highlight:
"Plug 'scrooloose/syntastic'

" for LaTeX:
Plug 'lervag/vimtex'        ,{'for': ['tex']}

" Snippets (i use it for LaTeX):
Plug 'sirver/ultisnips'     ",{'for': ['tex']}

" Kotlin Syntax:
Plug 'udalov/kotlin-vim'    ,{'for': ['kt']}

" Telescope:
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'



" LSP based completions:
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
"Plug 'honza/vim-snippets'
"Plug 'folke/lsp-colors.nvim'

" Extentions to built-in LSP, for example, providing type inlay hints:
"Plug 'nvim-lua/lsp_extensions.nvim'

" To enable more of the features of rust-analyzer, such as inlay hints and more!
"Plug 'simrat39/rust-tools.nvim'
"Plug 'rust-lang/rust.vim'

call plug#end()



" COLORSCHEME settings:
" Papercolor:
"set background=light
"colorscheme PaperColor

" Sublimemonokai:
"colorscheme sublimemonokai

" Quantum:
"set background=light   " light theme
"colorscheme quantum

" Gruvbox:
set termguicolors       " enable true colors support
set background=dark
colorscheme gruvbox



" YouCompleteMe settings:
"let g:ycm_min_num_of_chars_for_completion=1



" NERDTree settings:
autocmd VimEnter * set mouse=a      " enable changing panes size by mouse
" autocmd VimEnter * NERDTree       " launch on startup
" autocmd VimEnter * wincmd w       " auto move to main panel

let NERDTreeSortOrder = ['[[extension]]']       " sort by type
let NERDTreeNaturalSort = 1         " Sort files in natural order (f1, f5, f10, f100)

" let NERDTreeIgnore = ['\.pyc$']   "ignore files with this extension

nnoremap <leader>n :NERDTreeToggle <CR>




" AutoPairs settings:
" TODO:
"let g:AutoPairs['<']='>'
" removes in insert mode <C-H> => backspace
let g:AutoPairsMapCh = 0
let g:AutoPairsMultilineClose = 0



" Surrounding settings:
" TODO: change so that `ys(` dont add spaces inside



" Quick-scope settings:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']



" AIRLINE settings:
let g:airline_powerline_fonts = 1
"let g:airline_detect_spelllang=1
"let g:airline_section_a=""
"let g:airline_section_b=""
"let g:airline_section_c=""
"let g:airline_section_gutter=""
" let g:airline_section_x=""
let g:airline_section_y = ""
let g:airline_section_z = "Line: %l/%L, Col: %c"
"let g:airline_section_error=""
"let g:airline_section_warning=""

let b:airline_whitespace_checks = ['indent', 'mixed-indent-file', 'conflicts']
"let b:airline_whitespace_checks = ['indent', 'trailing', 'long', 'mixed-indent-file', 'conflicts']

let g:Powerline_symbols = 'unicode'



" Telescope:
nnoremap <leader>f :Telescope find_files <CR>
nnoremap <leader>g :Telescope live_grep <CR>





" LSP config:
set completeopt=menu,menuone

" Code navigation shortcuts
nnoremap <silent> gd        <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD        <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr        <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> K         <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>r <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> g[        <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> g]        <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
"nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
"nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
"nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
"nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

lua << EOF
    -- Setup nvim-cmp.
    local cmp = require('cmp')

    cmp.setup({
        mapping = {
            ['<CR>'] = cmp.mapping.confirm({ select = true }),

            ['<Tab>'] = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end,

            ['<S-Tab>'] = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end,

            ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
            --['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
            --['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
            --['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            --['<C-e>'] = cmp.mapping({
            --  i = cmp.mapping.abort(),
            --  c = cmp.mapping.close(),
            --}),
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            --{ name = 'vsnip' },   -- For vsnip users.
            --{ name = 'luasnip' }, -- For luasnip users.
            { name = 'ultisnips' }, -- For ultisnips users.
            --{ name = 'snippy' },  -- For snippy users.
            { name = 'buffer' },
        }),
        snippet = {
            -- REQUIRED - you MUST specify a snippet engine
            expand = function(args)
              --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
              --require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
              vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
              --require'snippy'.expand_snippet(args.body) -- For `snippy` users.
            end,
        },
    })

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    --cmp.setup.cmdline('/', {
    --  sources = {
    --    { name = 'buffer' }
    --  }
    --})

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    --cmp.setup.cmdline(':', {
    --  sources = cmp.config.sources({
    --    { name = 'path' }
    --  }, {
    --    { name = 'cmdline' }
    --  })
    --})

    -- Setup lspconfig.
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    require('lspconfig')['rust_analyzer'].setup {
        capabilities = capabilities
    }
EOF





" for LaTeX:
command CompileLaTeXtoPDF ! echo '\n\n\n\n\n' && pdflatex -halt-on-error -synctex=1 %:t

" snippets for LaTeX:
let g:UltiSnipsExpandTrigger='<F8>'
let g:UltiSnipsJumpForwardTrigger='<F8>'
let g:UltiSnipsJumpBackwardTrigger='<F9>'
let g:UltiSnipsEditSplit="horizontal"

" you may want disable it, if you want to see only .tex, without .pdf
function SynctexFromVimToZathuraDisable()
    let g:is_synctex_from_vim_to_zathura_must_work = 0
endfunction
function SynctexFromVimToZathuraEnable()
    let g:is_synctex_from_vim_to_zathura_must_work = 1
endfunction

" you may want disable it, if you dont want to compile latex
function CompileLaTeXtoPDFDisable()
    let g:is_compile_latex_to_pdf_must_work = 0
endfunction
function CompileLaTeXtoPDFEnable()
    let g:is_compile_latex_to_pdf_must_work = 1
endfunction

" you may want to disable all LaTeX connected autos
function LaTeXautosDisable()
    let g:is_compile_latex_to_pdf_must_work = 0
    let g:is_synctex_from_vim_to_zathura_must_work = 0
endfunction
function LaTeXautosEnable()
    let g:is_compile_latex_to_pdf_must_work = 1
    let g:is_synctex_from_vim_to_zathura_must_work = 1
endfunction

function SynctexFromVimToZathura()
    " remove 'silent' for debugging
    " execute "silent !zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " " . g:syncpdf
    if g:is_synctex_from_vim_to_zathura_must_work
        execute "silent !zathura --synctex-forward " . line('.').":".col('.').":".bufname('%') . " " . expand('%:t:r').".pdf"
    endif
endfunction

function SynctexFromVimToZathuraSafe()
    if g:compile_latex_to_pdf_last_exit_code == 0
        call SynctexFromVimToZathura()
    endif
endfunction

function CompileLaTeXtoPDFasyncOnExit(j, c, e)
    let g:compile_latex_to_pdf_prev_exit_code = g:compile_latex_to_pdf_last_exit_code
    let g:compile_latex_to_pdf_last_exit_code = a:c
    echom 'pdflatex finished. exit code: ' . g:compile_latex_to_pdf_last_exit_code

    " synchronize latex (vim) and pdf (zathura) using new synctex file:
    " this `if` needed for case when prev compile wasnt successful, and
    " therefore simply calling `SynctexFromVimToZathuraSafe()` will
    " open new window + reload old one.
    if g:compile_latex_to_pdf_prev_exit_code == 0
        call SynctexFromVimToZathuraSafe()
    endif

    " unlock another possible instances of this function:
    let g:compile_latex_to_pdf_is_now_compiling = 0
endfunction

function CompileLaTeXtoPDFasync()
    if g:is_compile_latex_to_pdf_must_work && g:compile_latex_to_pdf_is_now_compiling == 0
        " lock another possible instances of this function:
        let g:compile_latex_to_pdf_is_now_compiling = 1

        " save file before compiling:
        execute "w"

        " compile file:
        call jobstart("pdflatex -halt-on-error -synctex=1 " . bufname("%"), {"on_exit": "CompileLaTeXtoPDFasyncOnExit"})
    endif
endfunction

function SetupEverythingForLaTeX()
    nnoremap j gj
    nnoremap k gk

    let g:tex_flavor = 'latex'

    " look at: https://habr.com/ru/post/445066/
    " let g:vimtex_view_general_viewer='okular'
    " let g:vimtex_view_general_options='--unique file:@pdf\#src:@line@tex'
    " let g:vimtex_view_general_options_latexmk='--unique'
    let g:vimtex_quickfix_mode = 0
    " set conceallevel=1
    " let g:tex_conceal='abdmg'

    let g:vimtex_view_method = 'zathura'

    " things for reactivity/dynamics:
    let g:is_synctex_from_vim_to_zathura_must_work = 1
    let g:is_compile_latex_to_pdf_must_work = 1

    autocmd CursorMoved *.tex call SynctexFromVimToZathuraSafe()
    " autocmd CursorMovedI *.tex call SynctexFromVimToZathuraSafe()

    let g:compile_latex_to_pdf_is_now_compiling = 0
    let g:compile_latex_to_pdf_last_exit_code = 1
    let g:compile_latex_to_pdf_prev_exit_code = 1

    " set hold delay
    set updatetime=1500
    autocmd CursorHold *.tex call CompileLaTeXtoPDFasync()
    " autocmd CursorHoldI *.tex call CompileLaTeXtoPDFasync()
    " autocmd InsertLeave *.tex call CompileLaTeXtoPDFasync()
    " autocmd CursorMovedI *.tex call CompileLaTeXtoPDFasync()

endfunction

autocmd BufReadPost *.tex call SetupEverythingForLaTeX()



" COMPILES:

" here `<leader>c` stands for `compile/run` whatever it be
" LaTeX:
function SetupLeaderMapForLaTeX()
    nnoremap <leader>c :w <bar> CompileLaTeXtoPDF <CR>
endfunction
autocmd BufReadPost *.tex call SetupLeaderMapForLaTeX()

" Python:
function SetupLeaderMapForPython()
    nnoremap <leader>c :wa <bar> :! python % <CR>
endfunction
autocmd BufReadPost *.py call SetupLeaderMapForPython()

" Rust:
function SetupLeaderMapForRust()
    nnoremap <leader>c :wa <bar> :! cargo test && cargo run <CR>
endfunction
autocmd BufReadPost *.rs call SetupLeaderMapForRust()





" the end ;)
