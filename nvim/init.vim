" ----------------- This is dmyTRUEk's NVIM config file -----------------
"
" v0.1 - 2021.07.28:
"   added: load from vim config file
"



set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc



" for Clipboard in Wayland to work:
set clipboard+=unnamedplus



