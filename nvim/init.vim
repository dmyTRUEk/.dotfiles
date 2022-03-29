" ----------------- dmyTRUEk's NVIM config -----------------



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

" for giant files:
set redrawtime=10000

" Change panes size by mouse
autocmd VimEnter * set mouse=a



" Set leader key:
let mapleader = " "

" make Y copy till end of line
nnoremap Y y$

" Unmap Ex Mode (vi/visual):
map Q <NOP>
map Й <NOP>

" swap 0 and ^
noremap 0 ^
noremap ^ 0

" Better bind for redo:
nnoremap U <C-r>

" move in insert:
inoremap <C-H> <Left>
inoremap <C-J> <Down>
inoremap <C-K> <Up>
inoremap <C-L> <Right>

" Exit from insert mode:
inoremap jk <Esc>
inoremap kj <Esc>



" TODO: <F1> -> nvim help for current word
" nnoremap <F2> <C-w>   " deprecated: for change window use `<leader>hjkl` instead
nnoremap <F3> ^
nnoremap <F4> $

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv



" Save (Write) file:
nnoremap <leader>w :w <CR>
nnoremap <leader>W :wa <CR>
nnoremap <leader>ц :w <CR>
nnoremap <leader>Ц :wa <CR>

" Quit:
nnoremap <leader>q :q <CR>
nnoremap <leader>Q :qa <CR>
nnoremap <leader>й :q <CR>
nnoremap <leader>Й :qa <CR>

" Save (Write) file and Quit:
nnoremap <leader>a :wq <CR>
nnoremap <leader>A :wqa <CR>
nnoremap <leader>ф :wq <CR>
nnoremap <leader>Ф :wqa <CR>

" move between windows inside vim:
nnoremap <leader>h :wincmd h <CR>
nnoremap <leader>j :wincmd j <CR>
nnoremap <leader>k :wincmd k <CR>
nnoremap <leader>l :wincmd l <CR>
nnoremap <leader>р :wincmd h <CR>
nnoremap <leader>о :wincmd j <CR>
nnoremap <leader>л :wincmd k <CR>
nnoremap <leader>д :wincmd l <CR>



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

" C++:
function SetupLeaderMapForCPP()
    nnoremap <leader>c :wa <bar> :! g++ % -o %:t:r && ./%:t:r <CR>
endfunction
autocmd BufReadPost *.cpp call SetupLeaderMapForCPP()



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
" if there is no space after second word (for example `,` or `)` or `\n` or other

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



" SCROLLOFF: distance from window(viewport) top/bottom
" set scrolloff=16            " minimal number of lines to keep between cursor and top/bottom of viewport (screen)
let g:scrolloff_fraction = 0.15

function SetFractionalScrollOff(fraction)
    let l:visible_lines_in_active_window = winheight(win_getid())
    let &scrolloff = float2nr(l:visible_lines_in_active_window * a:fraction)
endfunction

autocmd BufEnter,WinEnter,WinNew,VimResized * call SetFractionalScrollOff(g:scrolloff_fraction)



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
    set ttymouse=sgr

    let g:airline_section_x = 'VIM'

endif



" use ukr in normal mode:
set langmap=аf,б\\,,вd,гu,дl,еt,є',ж\\;,зp,иb,іs,ї],йq,кr,лk,мv,нy,оj,пg,рh,сc,тn,уe,фa,х[,цw,чx,шi,щo,ьm,ю.,яz,АF,Б<,ВD,ГU,ДL,ЕT,Є\\",Ж:,ЗP,ИB,ІS,Ї},ЙQ,КR,ЛK,МV,НY,ОJ,ПG,РH,СC,ТN,УE,ФA,Х{,ЦW,ЧX,ШI,ЩO,ЬM,Ю>,ЯZ
" TODO: make gcc (comment) work on ukr layout
nnoremap псс gcc



" CURSOR settings in different modes:
let &t_EI.="\e[2 q"         "EI = normal mode
let &t_SR.="\e[4 q"         "SR = replace mode
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
Plug 'sirver/ultisnips'    ",{'for': ['tex']}

" Kotlin Syntax:
Plug 'udalov/kotlin-vim'    ,{'for': ['kt']}

" Telescope:
" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'



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

" Quantum: good light theme
"set background=light
"colorscheme quantum

" Gruvbox:
set termguicolors       " enable true colors support
set background=dark
colorscheme gruvbox



" NERDTree settings:
" autocmd VimEnter * NERDTree       " launch on startup
" autocmd VimEnter * wincmd w       " auto move to main panel

let NERDTreeSortOrder = ['[[extension]]']       " sort by type
let NERDTreeNaturalSort = 1         " Sort files in natural order (f1, f5, f10, f100)

" let NERDTreeIgnore = ['\.pyc$']   "ignore files with this extension

nnoremap <leader>n :NERDTreeToggle <CR>
nnoremap <leader>т :NERDTreeToggle <CR>




" AutoPairs settings:
" TODO: autopair for '<' -> '<>'
"let g:AutoPairs['<']='>'
" removes in insert mode <C-H> => backspace
let g:AutoPairsMapCh = 0
let g:AutoPairsMultilineClose = 0



" Surrounding settings:
" TODO: change so that `ys(` dont add spaces inside



" Quick-scope settings:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" TODO: better highlight colors



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
" nnoremap <leader>f :Telescope find_files <CR>
" nnoremap <leader>g :Telescope live_grep <CR>





" LSP config:
set completeopt=menu,menuone

" Code navigation shortcuts
nnoremap <silent> gd        <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gi        <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr        <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> K         <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>r <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> g[        <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> g]        <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <leader>d <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
" TODO?: add <leader>i -> inline variable
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
        sources = {
            { name = 'nvim_lsp', group_index = 1 },

            { name = 'path' },

            { name = 'ultisnips', group_index = 2 }, -- For ultisnips users.
            --{ name = 'vsnip' },   -- For vsnip users.
            --{ name = 'snippy' },  -- For snippy users.
            --{ name = 'luasnip' }, -- For luasnip users.

            { name = 'buffer', group_index = 3, option = { keyword_pattern = [[\Z\k\+]] } },
            --{ name = 'buffer', group_index = 3, option = { keyword_pattern = [[\%C\k\+]] } },
            --{ name = 'buffer', group_index = 3, option = { keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\|[а-яА-Я]\)]] } },
            --{ name = 'buffer', group_index = 3, option = { keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%([\-.]\w*\)*\|[а-яА-Я]\)]] } },
            --{ name = 'buffer', group_index = 3, option = { keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\%(\h\w*\|[А-Яа-я]*\)\%([\-.]\w*\)*\)]] } },
            --{ name = 'buffer', group_index = 3, option = { get_bufnrs = get_all_buffers, keyword_pattern = anyWord } },
        },
        snippet = {
            -- REQUIRED!!! - you MUST specify a snippet engine
            expand = function(args)
                vim.fn["UltiSnips#Anon"](args.body)           -- For `ultisnips` users.
                --vim.fn["vsnip#anonymous"](args.body)        -- For `vsnip` users.
                --require'snippy'.expand_snippet(args.body)   -- For `snippy` users.
                --require'luasnip'.lsp_expand(args.body)      -- For `luasnip` users.
            end,
        },
    })

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    --cmp.setup.cmdline('/', {
    --    sources = {
    --        { name = 'buffer' }
    --    }
    --})

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    --cmp.setup.cmdline(':', {
    --    sources = cmp.config.sources({
    --        { name = 'path' }
    --    }, {
    --        { name = 'cmdline' }
    --    })
    --})

    -- Setup lspconfig.
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    local servers = { 'rust_analyzer', 'pyright' }
    for _, lsp in pairs(servers) do
        require('lspconfig')[lsp].setup {
            capabilities = capabilities
        }
    end
EOF





" for LaTeX:
command CompileLaTeXtoPDF ! echo '\n\n\n\n\n' && pdflatex -halt-on-error -synctex=1 %:t

" snippets for LaTeX:
let g:UltiSnipsExpandTrigger='<NOP>'
let g:UltiSnipsJumpForwardTrigger='<NOP>'
let g:UltiSnipsJumpBackwardTrigger='<NOP>'
let g:UltiSnipsEditSplit="horizontal"

inoremap <F8> <C-R>=UltiSnips#ExpandSnippetOrJump() <CR>
inoremap <F9> <C-R>=UltiSnips#ExpandSnippetOrJump() <CR>
inoremap <F10> <C-R>=UltiSnips#JumpBackwards() <CR>

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





" the end ;)
