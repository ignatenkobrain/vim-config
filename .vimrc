" Load bundle/*
call pathogen#incubate()

" SPEC
let spec_chglog_prepend = 1
let spec_chglog_format = "%a %b %d %Y Igor Gnatenko <i.gnatenko.brain@gmail.com> -"

" Tabs
set et ts=2 sw=2 sts=2
filetype indent plugin on

" Translating
let g:po_translator = "Igor Gnatenko <i.gnatenko.brain@gmail.com>"
let g:po_lang_team = "Russian Fedora"

" Local .vimrc .exrc
set exrc
set secure

" Python
au FileType python set et ts=4 sw=4 sts=4

" Color
colo desert
set background=dark

" Show line numbers
set nu

" TaskList
map <leader>td <Plug>TaskList

" File Browser
map <leader>n :NERDTreeToggle<CR>

" Git status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
