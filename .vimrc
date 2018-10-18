" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"if has("vms")
"  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file
"endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

"git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set nowrap

" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Plugin
Bundle 'gmarik/vundle'
" Go
"Bundle 'dgryski/vim-godef'
"Bundle 'Blackrush/vim-gocode'
"Bundle 'majutsushi/tagbar'
" C
Bundle 'c.vim'
Bundle 'realid/vimdoc-zh'
Bundle 'corntrace/bufexplorer'
Bundle 'autoload_cscope.vim'
"let g:autocscope_menus = 0
"Bundle 'Mark'
"Bundle 'Visual-Mark'
"Bundle 'indent-guides'
"let g:indent_guides_guide_size=1
Bundle 'commentary.vim'
Bundle 'Tagbar'
"Bundle 'lookupfile'
"Bundle 'genutils'
Bundle 'a.vim'
"Bundle 'c.vim'
"Bundle 'cpp.vim'
Bundle 'Lokaltog/vim-powerline'
set laststatus=2
set t_Co=256
set encoding=utf-8
"Bundle 'Pydiction'
"filetype plugin on
"let g:pydiction_location='~/.vim/bundle/Pydiction/complete-dict'
"Bundle 'exclipy/clang_complete'
"let g:clang_auto_select=1
"let g:clang_complete_auto=0
"let g:clang_complete_copen=1
"let g:clang_h1_errors=1
"let g:clang_periodic_quickfix=0
"let g:clang_snippets=1
"let g:clang_snippets_engine="clang_complete"
"let g:clang_conceal_snippets=1
"let g:clang_exec="clang"
"let g:clang_user_options=""
"let g:clang_auto_user_options="path, .clang_complete"
"let g:clang_use_library=1
"let g:clang_library_path="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib"
"let g:clang_sort_algo="priority"
"let g:clang_complete_macros=1
"let g:clang_complete_patterns=0
"nnoremap <Leader>q :call g:ClangUpdateQuickFic()<CR>
"let g:clic_filename="/Users/real/src/work/webrtc-index/index.db"
"nnoremap <Leader>r :call ClangGetReferences()<CR>
"nnoremap <Leader>d :call ClangGetDeclarations()<CR>
"nnoremap <Leader>s :call ClangGetSubclasses()<CR>
"Bundle 'Rip-Rip/clang_complete'
"let g:clang_complete_copen=1
"let g:clang_periodic_quickfix=1
"let g:clang_snippets=1
"let g:clang_close_preview=1
"let g:clang_usr_library=1
"let g:clang_user_options='-stdlib=libc++ -std=c++11 -IIncludePath'

call vundle#end()
filetype plugin indent on

"cscope
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"Set mapleader
let mapleader = ","
"Fast reloading of the .vimrc
map <silent><leader>ss :source ~/.vimrc<cr>
"Fast editing of .vimrc
map <silent><leader>ee :e ~/.vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

nmap <UP> <C-Y>
nmap <DOWN> <C-E>
nmap <LEFT> zhh
nmap <RIGHT> lzl

set showcmd

let g:loaded_zipPlugin= 1
let g:loaded_zip      = 1

set fileencodings=utf-8
