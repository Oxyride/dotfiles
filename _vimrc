" 文字コード設定
set encoding=utf-8
scriptencoding utf-8

" 行番号表示
set number
" 行を強調表示
set cursorline
" 列を強調表示
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
" 入力した<TAB>を変換する空白の文字数
set softtabstop=4
" 読み込んだ<TAB>を変換する空白の文字数
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
let mapleader = "\ "
nnoremap <Leader>w :w<CR>
inoremap <silent> jj  <esc>
nnoremap Y y$
nnoremap <Leader>c :<C-u>setlocal cursorline! cursorcolumn!<CR>

" NERDTree
nnoremap <silent> <Leader>e :NERDTreeToggle <CR>
"----------------------------------------------------------------------
" NeoSnippet 
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" ---------------------------------------------------------------------
"dein.vim
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/oxyride/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/oxyride/.cache/dein')
  call dein#begin('/Users/oxyride/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/oxyride/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  let g:deoplete#enable_at_startup = 1

  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/unite.vim')
  call dein#add('cohama/lexima.vim')
  call dein#add('scrooloose/nerdtree') 
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('altercation/vim-colors-solarized')
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

" カラーテーマ
set background=dark
colorscheme solarized
