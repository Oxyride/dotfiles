" 文字コード設定
set encoding=utf-8
scriptencoding utf-8

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
 

" 対応する括弧にカーソルを一瞬移動
set showmatch
" showmatchする時間
set matchtime=1

" ファイル名のタブ補完
set wildmode=list:longest
set wildmenu " コマンドモードの補完

"----------------------------------------------------------------------
" 検索/置換
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set incsearch
set wrapscan
set hlsearch " 検索結果をハイライト
" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

"----------------------------------------------------------------------
" キーバインド
let mapleader = "\ "
nnoremap <Leader>w :w <CR>
inoremap <silent> jj  <esc>
nnoremap Y y$
nnoremap <Leader>c :<C-u>setlocal cursorline! cursorcolumn! number!<CR>

" NERDTree
nnoremap <silent> <Leader>e :NERDTreeToggle <CR>

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

  call dein#add('Shougo/neosnippet.vim')                  "コード補完
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/unite.vim')
  call dein#add('scrooloose/syntastic')                   "構文エラーチェック
  call dein#add('cohama/lexima.vim')                      "括弧補完
  call dein#add('scrooloose/nerdtree')                    "ディレクトリをツリー表示
  call dein#add('itchyny/lightline.vim')                  "ステータスラインの表示内容強化
  call dein#add('bronson/vim-trailing-whitespace')        "末尾の全角と半角の空白文字を赤くハイライト
  call dein#add('Yggdroot/indentLine')                    "インデント可視化
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('altercation/vim-colors-solarized')       "カラーテーマ
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
" カラーテーマ
set background=dark
colorscheme solarized

"----------------------------------------------------------------------
" ステータスラインの設定
set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set ruler " ステータスラインの右側にカーソルの現在位置を表示する
"----------------------------------------------------------
" neocomplete・neosnippetの設定
"----------------------------------------------------------
" Vim起動時にneocompleteを有効にする
let g:neocomplete#enable_at_startup = 1
" smartcase有効化. 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete#enable_smart_case = 1
" 3文字以上の単語に対して補完を有効にする
let g:neocomplete#min_keyword_length = 3
" 区切り文字まで補完する
let g:neocomplete#enable_auto_delimiter = 1
" 1文字目の入力から補完のポップアップを表示
let g:neocomplete#auto_completion_start_length = 1
" バックスペースで補完のポップアップを閉じる
inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"
" エンターキーで補完候補の確定. スニペットの展開もエンターキーで確定
imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
" タブキーで補完候補の選択. スニペット内のジャンプもタブキーでジャンプ
imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"

"----------------------------------------------------------
" Syntasticの設定
"----------------------------------------------------------
" 構文エラー行に「>>」を表示
let g:syntastic_enable_signs = 1
" 他のVimプラグインと競合するのを防ぐ
let g:syntastic_always_populate_loc_list = 1
" 構文エラーリストを非表示
let g:syntastic_auto_loc_list = 0
" ファイルを開いた時に構文エラーチェックを実行する
let g:syntastic_check_on_open = 1
" 「:wq」で終了する時も構文エラーチェックする
let g:syntastic_check_on_wq = 1

" 言語毎の規約指定
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_python_checkers = ['pylint']
