" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'nvie/vim-flake8'
Bundle 'tpope/vim-fugitive'
Bundle 'jaxbot/github-issues.vim'
Bundle 'davidhalter/jedi-vim'
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'vim-scripts/po.vim--gray'
Bundle 'vim-scripts/TaskList.vim'

filetype plugin indent on
" Vundle END

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
let g:flake8_ignore="E501"
au FileType python map <Leader>p :call InsertPdb()<CR>
function! InsertPdb()
  let trace = expand("import pdb; pdb.set_trace()")
  execute "normal o".trace
endfunction

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

" Github issues
map <c-g> :Gissues<CR>
let g:github_upstream_issues = 1
