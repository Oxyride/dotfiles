set encoding=utf-8
scriptencoding utf-8

"----------------------------------------------------------------------
" dein.vim プラグイン管理
"----------------------------------------------------------------------
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

  call dein#add('Shougo/neosnippet.vim')               "コード補完
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/unite.vim')
  call dein#add('scrooloose/syntastic')                "構文エラーチェック
  call dein#add('cohama/lexima.vim')                   "括弧補完
  call dein#add('scrooloose/nerdtree')                 "ディレクトリをツリー表示
  call dein#add('itchyny/lightline.vim')               "ステータスラインの表示内容強化
  call dein#add('bronson/vim-trailing-whitespace')     "末尾の全角と半角の空白文字を赤くハイライト
  call dein#add('Yggdroot/indentLine')                 "インデント可視化
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('altercation/vim-colors-solarized')    "カラーテーマ
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

"----------------------------------------------------------------------
" タブ/インデント
"----------------------------------------------------------------------
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

"----------------------------------------------------------------------
" 括弧/タグ
"----------------------------------------------------------------------
" 対応する括弧にカーソルを一瞬移動
set showmatch
" showmatchする時間
set matchtime=1

"----------------------------------------------------------------------
" コマンドモード
"----------------------------------------------------------------------
" ファイル名のタブ補完
set wildmode=list:longest

"----------------------------------------------------------------------
" 文字列検索/置換
"----------------------------------------------------------------------
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set incsearch
set wrapscan
set hlsearch " 検索結果をハイライト
" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

"----------------------------------------------------------------------
" キーバインド
"----------------------------------------------------------------------
let mapleader = "\ "
nnoremap <Leader>w :w <CR>
inoremap <silent> jj  <esc>
nnoremap Y y$

" NERDTree
nnoremap <silent> <Leader>e :NERDTreeToggle <CR>

"----------------------------------------------------------------------
" カラーテーマ
"----------------------------------------------------------------------
colorscheme solarized
set background=dark

"----------------------------------------------------------------------
" カーソル
"----------------------------------------------------------------------
" カーソルの行・列をハイライト、行番号を表示
nnoremap <Leader>c :<C-u>setlocal cursorline! cursorcolumn! number!<CR>

" カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set whichwrap=b,s,h,l,<,>,[,],~
" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

" バックスペースキーの有効化
set backspace=indent,eol,start

"----------------------------------------------------------------------
" ステータスラインの設定
"----------------------------------------------------------------------
set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set ruler " ステータスラインの右側にカーソルの現在位置を表示する

"----------------------------------------------------------------------
" neosnippetの設定
"----------------------------------------------------------------------
" キーバインド
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

"----------------------------------------------------------------------
" Syntasticの設定
"----------------------------------------------------------------------
" 構文エラー行に「>>」を表示
let g:syntastic_enable_signs = 1
" 他のVimプラグインと競合するのを防ぐ
let g:syntastic_always_populate_loc_list = 1
" syntastic有効化
let g:syntastic_mode_map = {'mode': 'passive'}
" 構文エラーリストを非表示
let g:syntastic_auto_loc_list = 0
" ファイルを開いた時に構文エラーチェックを実行する
let g:syntastic_check_on_open = 1
" 「:wq」で終了する時も構文エラーチェックする
let g:syntastic_check_on_wq = 1

" 言語毎の規約指定
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_python_checkers = ['pylint']
