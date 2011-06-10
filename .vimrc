set nocompatible            " enables vim-only commands
set number                  " enable line numbering
set cf                      " jump to first error in error file
set clipboard+=unnamed      " place yanked contents on the Windows clipboard
set nowrap                  " do not wrap lines
set tabstop=2               " set tab stops every 2 characters
set shiftwidth=2            " number of spaces for autoindent
set expandtab               " expand tabs into spaces
set smarttab                " tab inserts spaces specified by shiftwidth
set autoindent              " auto indent based on language
set smartindent             " smarter indenting
set statusline=%f\ %h%m%r%y%{fugitive#statusline()}%=%-10.(%l,%c%V%)\ %P
set laststatus=2            " always show status line
syntax enable               " enable syntax highlighting

set directory=/tmp//        " put swap files in a central (non-wd) location
set backupdir=/tmp//        " put backup file in a central (non-wd) location

filetype off                " just for enabling pathogen
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype plugin indent on   " automatically detect file type

set guifont=FreeMono        " gvim only - use Consolas on Windows, FreeMono on Ubuntu
set background=dark         " use the dark scheme
colorscheme solarized       " set color scheme to solarized

highlight Pmenu ctermbg=238 gui=bold
let g:SuperTabDefaultCompletionType="<c-x><c-o>"
if has("autocmd") 
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading=1
  autocmd FileType ruby,eruby let g:rubycomplete_rails=1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
  autocmd BufReadPost fugitive://* set bufhidden=delete
endif

" Configure window size
if has("gui_running")
  set lines=65 columns=160
else
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif

" Mappings
map <S-CR> O<Esc>j
map <CR> o<Esc>k
map <C-J> i<CR><Esc>k$
