:set encoding=utf-8     " バッファ内のエンコード
set fileencoding=utf-8 " ファイル書き込み時のエンコード
scriptencoding utf-8   " Vim Scriptで使用するエンコード

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

  "test
  " Add or remove your plugins here like this:
  call dein#add('Shougo/deoplete.nvim')
 if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  let g:deoplete#enable_at_startup = 1
  call dein#add('Shougo/neocomplete.vim')           " コード自動補完
  call dein#add('Shougo/neosnippet.vim')            " スニペット
  call dein#add('Shougo/neosnippet-snippets')       " スニペット辞書
  call dein#add('mattn/emmet-vim')                  " html/css入力補助
  call dein#add('tell-k/vim-browsereload-mac')
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('taichouchou2/html5.vim')
  call dein#add('taichouchou2/vim-javascript')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('scrooloose/syntastic')             " 構文エラーチェック
  call dein#add('cohama/lexima.vim')                " 括弧補完
  call dein#add('tomtom/tcomment_vim')              " コメントON/OFF切り替え
  call dein#add('scrooloose/nerdtree')              " ディレクトリをツリー表示
  call dein#add('itchyny/lightline.vim')            " ステータスラインの表示内容強化
  call dein#add('bronson/vim-trailing-whitespace')  " 末尾の全角と半角の空白文字を赤くハイライト
  call dein#add('nathanaelkane/vim-indent-guides')  " インデント可視化
  call dein#add('christoomey/vim-tmux-navigator')   " tmuxとvimのペイン操作を統一
  call dein#add('altercation/vim-colors-solarized') " カラーテーマ
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
" キーバインド
"----------------------------------------------------------------------
let mapleader = "\ "
inoremap <silent> jj <ESC>
inoremap <silent> っj <ESC>
nnoremap Y y$

" NERDTree
nnoremap <silent> <Leader>e :NERDTreeToggle <CR>

"----------------------------------------------------------------------
" コマンドモード
"----------------------------------------------------------------------
nnoremap <Leader>w :w <CR>
nnoremap <Leader>s :wq <CR>

" ノーマルモード時';'と':'を入れ替え
nnoremap ; :
nnoremap : ;

" ファイル名のタブ補完
set wildmenu
set wildmode=list:longest

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
" タブ/インデント
"----------------------------------------------------------------------

set autoindent    " 改行時に前の行のインデントを継続
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減
set expandtab     " <TAB>入力を複数の空白入力に置き換える

set shiftwidth=2  " autoindentで挿入される幅
set softtabstop=2 " <TAB>や<BackSpace>等でカーソルが動く幅
set tabstop=2     " タブ文字の表示幅

if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "ファイルタイプに合わせたインデントを利用
  filetype indent on
  "sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtabの略
  autocmd FileType c           setlocal sw=4 sts=4 ts=4 et
  autocmd FileType java        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType js          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType json        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scss        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sass        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript  setlocal sw=4 sts=4 ts=4 et
endif

" 不可視文字を可視化
set list
set listchars=tab:▸-


"全角スペースをハイライト表示
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

"----------------------------------------------------------------------
" 括弧/タグ
"----------------------------------------------------------------------
set showmatch   " 対応する括弧にカーソルを一瞬移動
set matchtime=1 " showmatchする時間

"----------------------------------------------------------------------
" 文字列検索/置換
"----------------------------------------------------------------------
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase  " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set incsearch
set wrapscan
set hlsearch   " 検索結果をハイライト

" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

"----------------------------------------------------------------------
" バックアップファイス/スワップファイルの設定
"----------------------------------------------------------------------
set nobackup      " バックアップファイルを作成しない
set nowritebackup " 上書き成功時にバックアップファイルを破棄
set noswapfile    " スワップファイルを作成しない
set noundofile    " undoファイルを作成しない

"----------------------------------------------------------------------
" ステータスラインの設定
"----------------------------------------------------------------------
set laststatus=2 " ステータスラインを常に表示
set showmode     " 現在のモードを表示

"----------------------------------------------------------------------
" カラーテーマ
"----------------------------------------------------------------------
colorscheme solarized
set background=dark

"----------------------------------------------------------------------
" Neocompleteの設定
"----------------------------------------------------------------------
" neocompleteをvim起動時に有効化.
let g:neocomplete#enable_at_startup = 1
" smartcase有効化
let g:neocomplete#enable_smart_case = 1
" シンタックスをキャッシュするときの最小文字数
let g:neocomplete#sources#syntax#min_keyword_length = 3

" ディクショナリの設定
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" キーマッピング
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"----------------------------------------------------------------------
" NeoSnippetの設定
"----------------------------------------------------------------------
" キーマッピング
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" 補完入力候補を<TAB>で選択
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
" 構文エラー行にシンボルを表示
let g:syntastic_enable_signs = 1
" 他のVimプラグインと競合するのを防ぐ
let g:syntastic_always_populate_loc_list = 1
" 構文エラーリストを非表示
let g:syntastic_auto_loc_list = 0
" ファイルを開いた時に構文エラーチェックを実行する
let g:syntastic_check_on_open = 1
" 「:wq」で終了する時も構文エラーチェックする
let g:syntastic_check_on_wq = 0
" エラーシンボル設定
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'

" ステータスラインにメッセージを表示
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" 自動チェックする言語を設定
let g:syntastic_mode_map = {
    \ 'mode': 'passive',
    \ 'active_filetypes': ['java','ruby','python']
    \}

" 言語毎の規約指定
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_python_checkers = ['pylint']

"----------------------------------------------------------------------
" Emmet Vimの設定
"----------------------------------------------------------------------
let g:user_emmet_mode = 'iv'
let g:user_emmet_leader_key = '<C-Y>'
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
      \ 'lang' : 'ja',
      \ 'html' : {
      \   'filters' : 'html',
      \ },
      \ 'css' : {
      \   'filters' : 'fc',
      \ },
      \ 'php' : {
      \   'extends' : 'html',
      \   'filters' : 'html',
      \ },
      \}
augroup EmmitVim
  autocmd!
  autocmd FileType * let g:user_emmet_settings.indentation = '               '[:&tabstop]
augroup END

"----------------------------------------------------------------------
" Vim Indent Guideの設定
"----------------------------------------------------------------------
" vim-indent-duitesをvim起動時に有効化
let g:indent_guides_enable_on_vim_startup = 1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level = 2
" 無効にするファイル
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

" 奇数行と偶数行の色を設定
let g:indent_guides_auto_colors = 0
" 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=24
" 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=22
" 可視化領域のサイズ
let g:indent_guides_guide_size = 1

"----------------------------------------------------------------------
" Vim Tmux Navigatorの設定
"----------------------------------------------------------------------
" ウィンドウ操作を Vim Tmux Navigator に移譲する
nnoremap <silent> <C-w>h :TmuxNavigateLeft<cr>
nnoremap <silent> <C-w>j :TmuxNavigateDown<cr>
nnoremap <silent> <C-w>k :TmuxNavigateUp<cr>
nnoremap <silent> <C-w>l :TmuxNavigateRight<cr>
nnoremap <silent> <C-w>\\ :TmuxNavigatePrevious<cr>

"----------------------------------------------------------------------
