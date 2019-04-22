set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'junegunn/fzf.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'morhetz/gruvbox'
Plugin 'luochen1990/rainbow'
Plugin 'a.vim'
Plugin 'w0rp/ale'
Plugin 'Valloric/YouCompleteMe'
Plugin 'JamshedVesuna/vim-markdown-preview'

call vundle#end()
filetype plugin indent on

set wrap
set showbreak=->
set linebreak
set number
set laststatus=2
set showcmd
set colorcolumn=80
inoremap # X#


"colorscheme slate

" otherwise spelling errors won't be visible whith 'gruvbox' colorscheme
" see https://github.com/morhetz/gruvbox/issues/175
"
let g:gruvbox_guisp_fallback = "bg"

colorscheme gruvbox
set background=dark


"set statusline=%{fugitive#statusline()}\ %<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P
"
" configure the statusline with 'itchyny/lightline' plugin
"
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }


set wildmenu
set wildmode=longest,full

syntax on
filetype plugin on
set completeopt=menu ",preview
set autoindent
set cindent
set backspace=eol,start,indent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
au FileType make set sw=4 ts=4 noet
au FileType go set noet

let g:is_bash = 1

filetype plugin on
set fileencodings=utf-8

set incsearch
set hlsearch

" junegunn/fzf.vim
map <c-p> :GFiles<CR>

" do not write files whoes name starts with [:;]
" use `:noa w :ok.txt` to ignore this filter
"
:autocmd BufWritePre [:;]*
\   try | echoerr 'Forbidden file name: ' . expand('<afile>') | endtry


" turn on 'luochen1990/rainbow'
let g:rainbow_active = 1

" rainbow breakes cmake syntax highlighting
" https://github.com/luochen1990/rainbow/issues/77
let g:rainbow_conf = {
\   'separately': {
\       'cmake': 0,
\   }
\}


" w0rp/ale
let g:ale_set_highlights = 0
let g:ale_sign_column_always = 1


" JamshedVesuna/vim-markdown-preview
let g:vim_markdown_preview_hotkey='<C-m>'
let g:vim_markdown_preview_browser='Firefox'
let g:vim_markdown_preview_use_xdg_open=1
let g:vim_markdown_preview_github=1


" Valloric/YouCompleteMe
map <c-h> :YcmCompleter GetDoc<CR>
let g:ycm_confirm_extra_conf = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
