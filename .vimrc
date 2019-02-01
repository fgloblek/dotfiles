syntax on
set hidden
set wildmenu
set showcmd

"set autoindent
set confirm 

"""""""""""""""""""""" vundle stuff
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Bundle 'mattn/calendar-vim'
Bundle 'vimwiki'

call vundle#end()
filetype plugin indent on

""""""""""""""""""""""


" this turns on hybrid numbers but switches to absolute in insert mode
set ruler
set number relativenumber
augroup numbertoggle
 autocmd!
 autocmd BufEnter,FocusGained,InsertLeave * set number relativenumber
 autocmd BufLeave,FocusLost,InsertEnter * set number norelativenumber
augroup END

" this turns TAB into 4 spaces
set tabstop=4
set softtabstop=4
set expandtab 

set showcmd " shows last command

set cursorline " highlights current line

" these highlight searches, etc.
set hlsearch
set incsearch
set ignorecase
set smartcase

" themes i like: minimalist, wombat256mod, meta5
colorscheme meta5

"set clipboard+=unnamed
"set paste
"set go+=a

"hi Normal guibg=NONE ctermbg=NONE "will make themes transparent

" stuff needed for plugins (vimwiki,..)
 set nocompatible
filetype plugin on

let mapleader=","


" vimwiki stuff "
" Run multiple wikis "
let g:vimwiki_list = [
                        \{'path': '~/Documents/VimWiki/personal.wiki'},
                        \{'path': '~/Documents/VimWiki/tech.wiki'}
                \]
au BufRead,BufNewFile *.wiki set filetype=vimwiki
:autocmd FileType vimwiki map d :VimwikiMakeDiaryNote
function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction
:autocmd FileType vimwiki map c :call ToggleCalendar()




" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" OPTIONAL: This enables automatic indentation as you type.
" filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
