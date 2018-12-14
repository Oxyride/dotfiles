" 文字コード設定
set encoding=utf-8
scriptencoding utf-8

" 行番号表示
set number
" 行、列番号をハイライト
set cursorline
set cursorcolumn
" ウィンドウの最後の行をできる限り表示
set display=lastline

" 改行時に前の行のインデントを継続
set autoindent
" 自動インデントでずれる幅 
set shiftwidth=4
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減
set smartindent

" 不可視文字を可視化
set list
set listchars=tab:▸-
" <TAB>入力を複数の空白入力に置き換える
set expandtab
" 入力した<TAB>を空白に変換する文字数
set softtabstop=4
" 読み込んだ<TAB>を空白に変換する文字数
set tabstop=4


" 対応する括弧にカーソルを一瞬移動
set showmatch
" showmatchする時間
set matchtime=1

" ファイル名のタブ補完
set wildmode=list:longest

" 検索/置換
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch

" キーバインド
inoremap <silent> jj  <esc>
nnoremap Y y$

" キーバインド ブラグイン
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
nnoremap <silent><C-e> :NERDTreeToggle <CR>

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

function! CPPCodeCleanup()
  " echo "Cleanup cpp code"
  let l:lines="all"
  let g:clang_format_fallback_style = 'Google'
  :pyf /usr/local/share/clang/clang-format.py
endfunction
command! CPPCodeCleanup call CPPCodeCleanup()

autocmd BufWrite *.{cpp} :CPPCodeCleanup
autocmd BufWrite *.{hpp} :CPPCodeCleanup
autocmd BufWrite *.{c} :CPPCodeCleanup
autocmd BufWrite *.{h} :CPPCodeCleanup

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

filetype off

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
  \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'cohama/lexima.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'thinca/vim-quickrun'
let g:quickrun_config = {'*': {'hook/time/enable': '1'},}
" colorscheme
NeoBundle 'altercation/vim-colors-solarized'
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

call neobundle#end()

filetype plugin indent on     " required!
filetype indent on
syntax on

" カラーテーマ
set background=dark
colorscheme solarized

NeoBundleCheck
