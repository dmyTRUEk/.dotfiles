" ----------------- dmyTRUEk's NVIM config -----------------

filetype plugin indent on   " turns on 'detection', 'plugin' and 'indent' at once
syntax enable               " highlight syntax

" if VIM: use this if you dont want vi compatibility
"set nocompatible            " dont use 'vi' (before vim) compability

set encoding=utf-8          " use utf-8 encoding

set number relativenumber   " set line numbers relative to caret
set cursorline              " highlight cursor line
set showmatch               " shows matching brackets
set completeopt-=preview    " dont show preview if using autocomplete
set laststatus=2            " it controls, when/how to display status-bar: 0=never, 1={if > than 2 windows}, 2=always
set autochdir               " change current dir to file's dir (folder directory)
"set showcmd                 " ? show last command (if you pressed 'j' then 'j' will be showed)

" better search
set incsearch               " show search results immedeatly
set hlsearch                " highlight found
set ignorecase              " /word will find 'word' or 'Word' or 'WORD'
set smartcase               " when 'ignorecase' and 'smartcase' are both on, if a pattern contains an uppercase letter, it is case sensitive, otherwise, it is not; for example, '/The' would find only 'The', while '/the' would find both 'the' and 'The'

" 'smart' tabs
set tabstop=4               " when indenting with '>', use 4 spaces width
set shiftwidth=4            " on pressing tab, insert 4 spaces
set expandtab               " use spaces instead of tabs
set autoindent              " set tabs automatically, when starting new line

" dont wrap lines
"set nowrap

" set scrolloff=16            " minimal number of lines to keep between cursor and top/bottom of viewport (screen)

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

" use ukr in normal mode
set langmap=ʼ~,аf,б\\,,вd,гu,дl,еt,є',ж\\;,зp,иb,іs,ї],йq,кr,лk,мv,нy,оj,пg,рh,сc,тn,уe,фa,х[,цw,чx,шi,щo,ьm,ю.,яz,АF,Б<,ВD,ГU,ДL,ЕT,Є\\",Ж:,ЗP,ИB,ІS,Ї},ЙQ,КR,ЛK,МV,НY,ОJ,ПG,РH,СC,ТN,УE,ФA,Х{,ЦW,ЧX,ШI,ЩO,ЬM,Ю>,ЯZ



" set leader key
let mapleader = " "



" unmap ex mode
map Q <nop>
map Й <nop>

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
xnoremap  n  t(
nnoremap cn ct(
nnoremap dn dt(
nnoremap yn yt(

" move selected text up/down
vnoremap J :m '>+1<cr>gv=gv
vnoremap О :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
vnoremap Л :m '<-2<cr>gv=gv


" better binds for go half page down/up:
nnoremap <C-j> <C-d>
nnoremap <C-о> <C-d>
nnoremap <C-k> <C-u>
nnoremap <C-л> <C-u>

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

" exit from insert mode:
"inoremap jk <esc>
"inoremap kj <esc>

" paste at end of line
nnoremap <C-p> $p
nnoremap <C-з> $p


" TODO: <f1> -> open nvim help for current word
" <f2> mapped in 'dmytruek/find-and-replace' plugin
noremap <f3> ^
noremap <f4> $
inoremap <f3> <home>
inoremap <f4> <end>


" clear highlight after search
nnoremap <leader>o :nohlsearch<cr>
nnoremap <leader>щ :nohlsearch<cr>

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



" my Change Current word with another (aka `viwy`):

" `cc` is duplication of `S`, so we can use it for our purposes, so firstly we clearing it
nnoremap cc <nop>
nnoremap сс <nop>

" map `cc<move>` to Change Current word with MOVE word
" this solution is better than `df<space>f<space>p` because it might not work if
" there is no space after second word (eg `,` `)` `\n` etc)

" TODO: figure out better way to do this, so it works at least for `f<symbol>` or even any move

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



""" Compiles:
" latex
autocmd BufReadPost *.tex nnoremap <leader>c :wa <bar> call CompileLatexToPDFsimple() <cr>

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

autocmd BufEnter,BufWinEnter,WinEnter,WinNew,VimResized * call SetRelativeScrollOff(g:relative_scrolloff_fraction)



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
func! s:SetTextVimOrNvim()
    if has('nvim')
        " echom 'NEOVIM'
        let g:airline_section_x = 'neovim'
    else
        " echom 'VIM'
        let g:airline_section_x = 'vim'
    endif
endf
call s:SetTextVimOrNvim()


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
"Plug 'nlknguyen/papercolor-theme'
"Plug 'ErichDonGubler/vim-sublime-monokai'
"Plug 'kjssad/quantum.vim'
Plug 'morhetz/gruvbox'


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
"Plug 'tpope/vim-fugitive'
" TODO?: enable and come up with some good binds

" find and replace
Plug 'dmytruek/find-and-replace'

" arguments manager
Plug 'dmytruek/argument-text-object'


""" UI Plugins:
" better status bar
Plug 'vim-airline/vim-airline'
" TODO?: use lualine

" file manager
Plug 'preservim/nerdtree'

" scrollbar
Plug 'Xuyuanp/scrollbar.nvim'

" find files and text in them
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
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

" for latex
"Plug 'lervag/vimtex'        ,{'for': ['tex']}

" markdown preview in browser
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" kotlin syntax highlight
Plug 'udalov/kotlin-vim'    ,{'for': ['kt']}

" rust-analyzer additional features (inlay hints, etc)
"Plug 'simrat39/rust-tools.nvim'
"Plug 'rust-lang/rust.vim'

call plug#end()





""" Colorscheme Settings:
set termguicolors       " enable true colors support
set background=dark
colorscheme gruvbox





""" Core Plugins Settings:
" auto-pairs (automatically pair brackets and quotes):
let g:AutoPairsMapCh = 0
let g:AutoPairsMultilineClose = 0
"autocmd BufReadPost * let g:AutoPairs['<'] = '>'
"autocmd BufReadPost *.cpp let g:AutoPairs['<'] = ''
" TODO: yswtOption: `|String` -> `Option<String>` (t stands for trait/type)


" vim-commentary (comment or uncomment lines):
" ukr binds:
nmap псс <Plug>CommentaryLine
map пс <Plug>Commentary


" vim-surround (yank(add,create), change, delete surround, like brackets, quotes):
" better map in visual mode:
vmap s S
vmap і S
let g:surround_{char2nr("\<CR>")} = "\n\t\r\n"
" TODO: add option for `ys(` to not add spaces inside
" https://github.com/tpope/vim-surround/issues/314


" vim-exchange (swap two text selections):
" better map in visual mode:
vmap x X
vmap ч X


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
" airline (better status bar):
let g:airline_powerline_fonts = 0
let g:airline_section_y = ""
let g:airline_section_z = "Line: %l/%L, Col: %c"
let b:airline_whitespace_checks = ['indent', 'mixed-indent-file', 'conflicts']
"let b:airline_whitespace_checks = ['indent', 'trailing', 'long', 'mixed-indent-file', 'conflicts']


" nerdtree (in-nvim file manager):
let NERDTreeSortOrder = ['[[extension]]']   " sort by type
let NERDTreeNaturalSort = 1         " sort files in natural order (f1, f5, f10, f100)
nnoremap <leader>n :NERDTreeToggle <cr>
nnoremap <leader>т :NERDTreeToggle <cr>
"autocmd VimEnter * NERDTree        " launch on startup
"autocmd VimEnter * wincmd w        " auto move to main panel
let NERDTreeIgnore = ['\.bin$', '\.png$', '\.jpg$', '\.jpeg'] " ignore files with this extension


" scrollbar (show scroll progess as bar on the right):
augroup ScrollbarInit
  autocmd!
  autocmd WinScrolled,VimResized,QuitPre          * silent! lua require('scrollbar').show()
  autocmd WinEnter,FocusGained,VimEnter           * silent! lua require('scrollbar').show()
  autocmd WinLeave,BufLeave,BufWinLeave,FocusLost * silent! lua require('scrollbar').clear()
augroup end
let g:scrollbar_min_size = 1
let g:scrollbar_max_size = 10
let g:scrollbar_right_offset = 0
let g:scrollbar_winblend = 50
let g:scrollbar_shape = { 'head': '', 'body': '░', 'tail': '' }


" telescope (different pickers, sorters and previewers):
nnoremap gd        :Telescope lsp_definitions <cr>
nnoremap gr        :Telescope lsp_references <cr>
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
    local actions = require("telescope.actions")
    require("telescope").setup{
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close
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

nnoremap <silent> <leader>r <cmd>lua vim.lsp.buf.rename() <cr>
nnoremap <silent> <leader>d <cmd>lua vim.lsp.diagnostic.show_line_diagnostics() <cr>
nnoremap <silent> g[        <cmd>lua vim.lsp.diagnostic.goto_prev() <cr>
nnoremap <silent> g]        <cmd>lua vim.lsp.diagnostic.goto_next() <cr>
nnoremap <silent> [c        <cmd>lua vim.lsp.diagnostic.goto_prev() <cr>
nnoremap <silent> ]c        <cmd>lua vim.lsp.diagnostic.goto_next() <cr>
nnoremap <silent> ga        <cmd>lua vim.lsp.buf.code_action() <cr>
nnoremap <silent> K         <cmd>lua vim.lsp.buf.hover() <cr>
" TODO?: <leader>i -> inline variable
"        impossible bc LSP itself dont have such option? :'(
"nnoremap <silent> gi       <cmd>lua vim.lsp.buf.implementation() <cr>
"nnoremap <silent> 1gD      <cmd>lua vim.lsp.buf.type_definition() <cr>
"nnoremap <silent> <c-k>    <cmd>lua vim.lsp.buf.signature_help() <cr>
"nnoremap <silent> g0       <cmd>lua vim.lsp.buf.document_symbol() <cr>
"nnoremap <silent> gW       <cmd>lua vim.lsp.buf.workspace_symbol() <cr>

lua << EOF
    -- enable this to print debug info to ~/.cache/nvim/lsp.log
    --vim.lsp.set_log_level('debug')
    local cmp = require('cmp')
    cmp.setup({
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
            --  i = cmp.mapping.abort(),
            --  c = cmp.mapping.close(),
            --}),
        },
        sources = {
            { name = 'nvim_lsp' }, --, group_index = 1
            --{ name = "nvim_lsp_signature_help" },  -- TODO: try it (from https://github.com/hrsh7th/nvim-cmp/wiki/Language-Server-Specific-Samples)
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
                vim.fn["UltiSnips#Anon"](args.body)           -- for `ultisnips` users
                --vim.fn["vsnip#anonymous"](args.body)        -- for `vsnip` users
                --require'snippy'.expand_snippet(args.body)   -- for `snippy` users
                --require'luasnip'.lsp_expand(args.body)      -- for `luasnip` users
            end,
        },
    })
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
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    local servers = { 'rust_analyzer', 'pyright' }
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

    " TODO?: make it work
    "call SetTextVimOrNvim()

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
