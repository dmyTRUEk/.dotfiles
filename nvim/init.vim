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
"set autochdir               " change current dir to file's dir
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

" remove esc delay
" https://www.johnhawthorn.com/2012/09/vi-escape-delays/
"set esckeys                "however, this will break any sequences using <esc> in insert mode
set timeoutlen=1000
set ttimeoutlen=0

" if VIM: remove this
" for clipboard in wayland+nvim to work:
set clipboard+=unnamedplus

" for giant files
set redrawtime=10000

" change panes size by mouse
set mouse=a



" set leader key
let mapleader = " "

" unmap ex mode
map Q <nop>
map ?? <nop>

" better copy till end of line
nnoremap Y y$

" swap 0 and ^
noremap 0 ^
noremap ^ 0

" better move to end of line
noremap - $

" swap ` and '
noremap ` '
noremap ' `

" better bind for redo
nnoremap U <C-r>

" better bind for visual-block
nnoremap <A-v> <C-v>

" maps for go back and forward
nnoremap <A-o> <C-o>
nnoremap <A-i> <C-i>

" maps for go half page down/up
nnoremap <A-d> <C-d>
nnoremap <A-u> <C-u>

" move in insert:
inoremap <A-;> <nop>
inoremap <A-h> <left>
inoremap <A-j> <down>
inoremap <A-k> <up>
inoremap <A-l> <right>

inoremap <A-??> <nop>
inoremap <A-??> <left>
inoremap <A-??> <down>
inoremap <A-??> <up>
inoremap <A-??> <right>

" exit from insert mode:
"inoremap jk <esc>
"inoremap kj <esc>



func AskAndReplaceAll()
    " save current cursor position
    let l:saved_winview = winsaveview()
    let l:current_word = expand("<cword>")
    call inputsave()
    let l:replace_by = input('Replace by: ', l:current_word)
    call inputrestore()
    if l:replace_by != ""
        execute ':%s/\<' . l:current_word . '\>/' . l:replace_by
    endif
    " restore cursor position
    call winrestview(l:saved_winview)
endf

func s:GetSelectedText()
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endf

func AskAndReplaceAllVisual()
    let l:mode = visualmode()
    if l:mode ==# "v"
        " save current cursor position
        let l:saved_winview = winsaveview()
        let l:selected_text = s:GetSelectedText()
        call inputsave()
        let l:replace_by = input('Replace by: ', l:selected_text)
        call inputrestore()
        if l:replace_by != ""
            execute ':%s/\(' . l:selected_text . '\)/' . l:replace_by
        endif
        " restore cursor position
        call winrestview(l:saved_winview)
    else
        " TODO: clear output
    endif
endf

" TODO: <f1> -> nvim help for current word
nnoremap <f2> :call AskAndReplaceAll()<cr>
xnoremap <f2> :call AskAndReplaceAllVisual()<cr>
noremap <f3> ^
noremap <f4> $
inoremap <f3> <home>
inoremap <f4> <end>

" erase last symbol in line
nnoremap <leader>e m`$x``

" append symbols to end of line
nnoremap <leader>; m`A;<esc>``
nnoremap <leader>, m`A,<esc>``
nnoremap <leader>: m`A:<esc>``

" move selected text up/down
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv



" save:
nnoremap <leader>w :w <cr>
nnoremap <leader>W :wa <cr>
nnoremap <leader>?? :w <cr>
nnoremap <leader>?? :wa <cr>

" quit:
nnoremap <leader>q :q <cr>
nnoremap <leader>Q :qa <cr>
nnoremap <leader>?? :q <cr>
nnoremap <leader>?? :qa <cr>

" save and quit:
nnoremap <leader>a :wq <cr>
nnoremap <leader>A :wqa <cr>
nnoremap <leader>?? :wq <cr>
nnoremap <leader>?? :wqa <cr>

" move between windows inside vim:
nnoremap <leader>h :wincmd h <cr>
nnoremap <leader>j :wincmd j <cr>
nnoremap <leader>k :wincmd k <cr>
nnoremap <leader>l :wincmd l <cr>
nnoremap <leader>?? :wincmd h <cr>
nnoremap <leader>?? :wincmd j <cr>
nnoremap <leader>?? :wincmd k <cr>
nnoremap <leader>?? :wincmd l <cr>



""" Compiles:
" latex:
func s:SetupLeaderMapForLaTeX()
    nnoremap <leader>c :w <bar> CompileLaTeXtoPDF <cr>
endf
autocmd BufReadPost *.tex call s:SetupLeaderMapForLaTeX()

" python:
func s:SetupLeaderMapForPython()
    nnoremap <leader>c :wa <bar> :! python3 % <cr>
endf
autocmd BufReadPost *.py call s:SetupLeaderMapForPython()

" rust:
func s:SetupLeaderMapForRust()
    nnoremap <leader>c :wa <bar> :! cargo test && cargo run <cr>
endf
autocmd BufReadPost *.rs call s:SetupLeaderMapForRust()

" c++:
func s:SetupLeaderMapForCPP()
    nnoremap <leader>c :wa <bar> :! g++ % -o %:t:r.bin && ./%:t:r.bin <cr>
endf
autocmd BufReadPost *.cpp call s:SetupLeaderMapForCPP()



" scrolloff: distance from window(viewport) top/bottom
" set scrolloff=16            " minimal number of lines to keep between cursor and top/bottom of viewport (screen)
let g:scrolloff_fraction = 0.20

func SetFractionalScrollOff(fraction)
    let l:visible_lines_in_active_window = winheight(win_getid())
    let &scrolloff = float2nr(l:visible_lines_in_active_window * a:fraction)
endf

autocmd BufEnter,WinEnter,WinNew,VimResized * call SetFractionalScrollOff(g:scrolloff_fraction)



" fix vim/neovim and alacritty compatibility:
" source: https://github.com/alacritty/alacritty/issues/919
" TODO: turn on/off? if some strange bug will occur => remove next line:
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
func s:SetTextVimOrNvim()
    if has('nvim')
        " echom 'NEOVIM'
        let g:airline_section_x = 'neovim'
    else
        " echom 'VIM'
        let g:airline_section_x = 'vim'
    endif
endf
call s:SetTextVimOrNvim()



" use ukr in normal mode:
set langmap=??~,??f,??\\,,??d,??u,??l,??t,??',??\\;,??p,??b,??s,??],??q,??r,??k,??v,??y,??j,??g,??h,??c,??n,??e,??a,??[,??w,??x,??i,??o,??m,??.,??z,??F,??<,??D,??U,??L,??T,??\\",??:,??P,??B,??S,??},??Q,??R,??K,??V,??Y,??J,??G,??H,??C,??N,??E,??A,??{,??W,??X,??I,??O,??M,??>,??Z

nmap ?????? <Plug>CommentaryLine
map ???? <Plug>Commentary



" cursor settings in different modes:
let &t_EI.="\e[2 q"         "EI = normal mode
let &t_SR.="\e[4 q"         "SR = replace mode
let &t_SI.="\e[6 q"         "SI = insert mode
" 1 - ??? rectangle blinking
" 2 - ??? rectangle
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

""" Colorschemes:
"Plug 'nlknguyen/papercolor-theme'
"Plug 'ErichDonGubler/vim-sublime-monokai'
"Plug 'kjssad/quantum.vim'
Plug 'morhetz/gruvbox'


""" Core Plugins:
" close brackets automatically:
Plug 'jiangmiao/auto-pairs'

" comments manager:
Plug 'tpope/vim-commentary'

" surround manager:
Plug 'tpope/vim-surround'

" exchange selections:
Plug 'tommcdo/vim-exchange'

" better find in line:
Plug 'unblevable/quick-scope'


""" General Plugins:
" snippets:
Plug 'sirver/ultisnips'

" git wrapper:
"Plug 'tpope/vim-fugitive'


""" UI Plugins:
" better status bar:
Plug 'vim-airline/vim-airline'

" file manager:
Plug 'scrooloose/nerdtree'

" scrollbar:
Plug 'Xuyuanp/scrollbar.nvim'

" find files and text in them:
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"Plug 'nvim-telescope/telescope-fzy-native.nvim'


""" Programming Languages:
" lsp related:
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
"Plug 'folke/lsp-colors.nvim'

" for latex:
"Plug 'lervag/vimtex'        ,{'for': ['tex']}

" markdown preview in browser:
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" kotlin syntax highlight:
Plug 'udalov/kotlin-vim'    ,{'for': ['kt']}

" rust-analyzer additional features (inlay hints, etc)
"Plug 'simrat39/rust-tools.nvim'
"Plug 'rust-lang/rust.vim'

call plug#end()





""" Colorschemes Settings:
" papercolor:
"set background=light
"colorscheme PaperColor

" sublimemonokai:
"colorscheme sublimemonokai

" quantum: good light theme
"set background=light
"colorscheme quantum

" gruvbox:
set termguicolors       " enable true colors support
set background=dark
colorscheme gruvbox





""" Core Plugins Settings:
" auto-pairs:
let g:AutoPairsMapCh = 0
let g:AutoPairsMultilineClose = 0
" TODO: autopair for '<' -> '<>'
"let g:AutoPairs['<']='>'
" TODO: yswtOption: `|String` -> `Option<String>` (t stands for trait)


" vim-surround:
" TODO: change so that `ys(` dont add spaces inside
" https://github.com/tpope/vim-surround/issues/314
" better map in visual mode:
vmap s S
vmap ?? S


" vim-exchange:
" better map in visual mode:
vmap x X
vmap ?? X


" quick-scope:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" TODO: better highlight colors





""" General Plugins Settings:
" ultisnips:
let g:UltiSnipsExpandTrigger='<nop>'
let g:UltiSnipsJumpForwardTrigger='<nop>'
let g:UltiSnipsJumpBackwardTrigger='<nop>'
let g:UltiSnipsEditSplit="horizontal"
inoremap <f8>  <C-r>=UltiSnips#ExpandSnippetOrJump() <cr>
inoremap <f9>  <C-r>=UltiSnips#ExpandSnippetOrJump() <cr>
inoremap <f10> <C-r>=UltiSnips#ExpandSnippetOrJump() <cr>
" inoremap <f10> <C-r>=UltiSnips#JumpBackwards() <cr>





""" UI Plugins Settings:
" airline:
let g:airline_powerline_fonts = 0
let g:airline_section_y = ""
let g:airline_section_z = "Line: %l/%L, Col: %c"
let b:airline_whitespace_checks = ['indent', 'mixed-indent-file', 'conflicts']
"let b:airline_whitespace_checks = ['indent', 'trailing', 'long', 'mixed-indent-file', 'conflicts']


" nerdtree:
let NERDTreeSortOrder = ['[[extension]]']   " sort by type
let NERDTreeNaturalSort = 1         " sort files in natural order (f1, f5, f10, f100)
nnoremap <leader>n :NERDTreeToggle <cr>
nnoremap <leader>?? :NERDTreeToggle <cr>
"autocmd VimEnter * NERDTree        " launch on startup
"autocmd VimEnter * wincmd w        " auto move to main panel
let NERDTreeIgnore = ['\.bin$', '\.png$', '\.jpg$', '\.jpeg'] " ignore files with this extension


" scrollbar:
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
let g:scrollbar_shape = { 'head': '', 'body': '???', 'tail': '' }


" telescope:
nnoremap <leader>b :Telescope buffers <cr>
nnoremap <leader>?? :Telescope buffers <cr>
nnoremap <leader>f :Telescope find_files <cr>
nnoremap <leader>?? :Telescope find_files <cr>
nnoremap <leader>g :Telescope live_grep <cr>
nnoremap <leader>?? :Telescope live_grep <cr>
nnoremap <leader>s :Telescope spell_suggest <cr>
nnoremap <leader>?? :Telescope spell_suggest <cr>
nnoremap <leader>u :Telescope jumplist <cr>
nnoremap <leader>?? :Telescope jumplist <cr>
nnoremap gd        :Telescope lsp_definitions <cr>
nnoremap gr        :Telescope lsp_references <cr>
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
" markdown-preview:
let g:mkdp_browser = 'firefox'
let g:mkdp_page_title = '${name}.md'
let g:mkdp_filetypes = ['markdown']
let g:mkdp_preview_options = { 'sync_scroll_type': 'relative' }
nnoremap <leader>m <cmd>MarkdownPreview<cr>


" lsp:
set completeopt=menu,menuone

nnoremap <silent> <leader>r <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap <silent> <leader>d <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>
nnoremap <silent> g[        <cmd>lua vim.lsp.diagnostic.goto_prev()<cr>
nnoremap <silent> g]        <cmd>lua vim.lsp.diagnostic.goto_next()<cr>
nnoremap <silent> ga        <cmd>lua vim.lsp.buf.code_action()<cr>
nnoremap <silent> K         <cmd>lua vim.lsp.buf.hover()<cr>
" TODO?: add <leader>i -> inline variable
"nnoremap <silent> gi       <cmd>lua vim.lsp.buf.implementation()<cr>
"nnoremap <silent> 1gD      <cmd>lua vim.lsp.buf.type_definition()<cr>
"nnoremap <silent> <c-k>    <cmd>lua vim.lsp.buf.signature_help()<cr>
"nnoremap <silent> g0       <cmd>lua vim.lsp.buf.document_symbol()<cr>
"nnoremap <silent> gW       <cmd>lua vim.lsp.buf.workspace_symbol()<cr>

lua << EOF
    -- setup nvim-cmp
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
            --['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
            --['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
            --['<C-y>'] = cmp.config.disable, -- specify `cmp.config.disable` if you want to remove default `<C-y>` mapping.
            --['<C-e>'] = cmp.mapping({
            --  i = cmp.mapping.abort(),
            --  c = cmp.mapping.close(),
            --}),
        },
        sources = {
            { name = 'nvim_lsp', group_index = 1 },
            { name = 'path' },
            { name = 'ultisnips', group_index = 2 }, -- for ultisnips users.
            --{ name = 'vsnip' },                    -- for vsnip users.
            --{ name = 'snippy' },                   -- for snippy users.
            --{ name = 'luasnip' },                  -- for luasnip users.
            { name = 'buffer', group_index = 3, option = { keyword_pattern = [[\Z\k\+]] } },
        },
        snippet = {
            -- REQUIRED, IMPORTANT!!! - you MUST specify a snippet engine
            expand = function(args)
                vim.fn["UltiSnips#Anon"](args.body)           -- for `ultisnips` users.
                --vim.fn["vsnip#anonymous"](args.body)        -- for `vsnip` users.
                --require'snippy'.expand_snippet(args.body)   -- for `snippy` users.
                --require'luasnip'.lsp_expand(args.body)      -- for `luasnip` users.
            end,
        },
    })
    -- use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    --cmp.setup.cmdline('/', {
    --    sources = {
    --        { name = 'buffer' }
    --    }
    --})
    -- use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    --cmp.setup.cmdline(':', {
    --    sources = cmp.config.sources({
    --        { name = 'path' }
    --    }, {
    --        { name = 'cmdline' }
    --    })
    --})
    -- setup:
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    local servers = { 'rust_analyzer', 'pyright' }
    for _, lsp in pairs(servers) do
        require('lspconfig')[lsp].setup {
            capabilities = capabilities
        }
    end
EOF





""" Latex Setup:
" TODO: rewrite it to function
command CompileLaTeXtoPDF ! echo '\n\n\n\n\n' && pdflatex -halt-on-error -synctex=1 %:t

" enable/disable vim to zathura sync
func LatexAutoSyncDisable()
    let g:is_latex_auto_sync_enabled = 0
endf
func LatexAutoSyncEnable()
    let g:is_latex_auto_sync_enabled = 1
endf

" enable/disable autocompile
func LatexAutoCompileDisable()
    let g:is_latex_auto_compile_enabled = 0
endf
func LatexAutoCompileEnable()
    let g:is_latex_auto_compile_enabled = 1
endf

" enable/disable autocompile and sync
func LatexAutosDisable()
    call LatexAutoCompileDisable()
    call LatexAutoSyncDisable()
endf
func LatexAutosEnable()
    call LatexAutoCompileEnable()
    call LatexAutoSyncEnable()
endf

func s:LatexSyncFromVimToZathuraUnsafe()
    " remove 'silent' for debugging
    if g:is_latex_auto_sync_enabled
        execute "silent !zathura --synctex-forward " . line('.').":".col('.').":".bufname('%') . " " . expand('%:t:r').".pdf"
    endif
endf

func s:LatexSyncFromVimToZathura()
    if g:compile_latex_to_pdf_exit_code_last == 0
        call s:LatexSyncFromVimToZathuraUnsafe()
    endif
endf

func PrivateCompileLatextoPDFasyncOnExit(j, c, e)
    let g:compile_latex_to_pdf_exit_code_prev = g:compile_latex_to_pdf_exit_code_last
    let g:compile_latex_to_pdf_exit_code_last = a:c
    echom 'pdflatex finished. exit code: ' . g:compile_latex_to_pdf_exit_code_last

    " synchronize latex (vim) and pdf (zathura) using new synctex file:
    " this `if` needed for case when prev compile wasnt successful, and
    " therefore simply calling `s:LatexSyncFromVimToZathura()` will
    " open new window + reload old one.
    if g:compile_latex_to_pdf_exit_code_prev == 0
        call s:LatexSyncFromVimToZathura()
    endif

    " unlock another possible instances of this function:
    let g:is_latex_compiling_now = 0
endf

func s:CompileLatexToPDFasync()
    if g:is_latex_auto_compile_enabled && g:is_latex_compiling_now == 0
        " lock another possible instances of this function:
        let g:is_latex_compiling_now = 1

        " save file before compiling:
        execute "w"

        " compile file:
        call jobstart("pdflatex -halt-on-error -synctex=1 " . bufname("%"), {"on_exit": "PrivateCompileLatextoPDFasyncOnExit"})
    endif
endf

func s:SetupEverythingForLatex()
    setlocal spell spelllang=uk

    nnoremap j gj
    nnoremap k gk
    nnoremap ?? gj
    nnoremap ?? gk
    inoremap <A-j> <C-O>gj
    inoremap <A-k> <C-O>gk
    inoremap <A-??> <C-O>gj
    inoremap <A-??> <C-O>gk

    nnoremap 0 g^
    nnoremap - g$

    " TODO?: make it work
    "call SetTextVimOrNvim()

    let g:tex_flavor = 'latex'

    " look at: https://habr.com/ru/post/445066/
    let g:vimtex_quickfix_mode = 0
    let g:vimtex_view_method = 'zathura'

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

autocmd BufReadPost *.tex call s:SetupEverythingForLatex()





" end :D
