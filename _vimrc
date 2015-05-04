set number
syntax on
"colorscheme elflord
set tabstop=2
set mouse=a
set whichwrap=b,s,<,>,[,]
"set clipboard+=unnamed
"set clipboard+=autoselect
set directory=~/.vim/tmp
set backupdir=~/.vim/tmp
set undodir=~/.vim/tmp
scriptencoding utf-8
set encoding=utf-8
colorscheme torte
set guifont=Ricty\10

"indent config
"filetype plugin indent on
set autoindent
"set expandtab
set shiftwidth=4
set background=dark

" ビジュアルモードで選択したテキストが、クリップボードに入るようにする
" http://nanasi.jp/articles/howto/editing/clipboard.html
" set clipboard=autoselect
 
 " 無名レジスタに入るデータを、*レジスタにも入れる。
 " set clipboard+=unnamed
" set clipboard=unnamedplus
 set clipboard=unnamedplus,unnamed,autoselect

" スワップファイルは使わない(ときどき面倒な警告が出るだけで役に立ったことがない)
set noswapfile
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
""""""""""""""""""""""""""""""
" バックスペースを有効化
set backspace=indent,eol,start

""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
"" const variable
let s:FALSE = 0
let s:TRUE = !s:FALSE

if has('vim_starting')
  "" runtimepathにneobundle.vimをインストールしたディレクトリを指定
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

let s:is_neobundle_installed = s:TRUE
try
  "" プラグインをインストールする基準となるパスを指定
  call neobundle#begin(expand('~/.vim/bundle/'))
catch /^Vim\%((\a\+)\)\=:E117/› " catch error E117: Unkown function
  let s:is_neobundle_installed = s:FALSE
  set title titlestring=NeoBundle\ is\ not\ installed!
endtry

if s:is_neobundle_installed
  "" Let NeoBundle manage NeoBundle
  NeoBundleFetch 'Shougo/neobundle.vim'
  filetype plugin indent on " valid vim plugin

  NeoBundle 'Shougo/neocomplete'
  "" ... " ここにNeoBundleで管理したいプラグインを好きなだけ列挙する。
  NeoBundle 'tyru/caw.vim'
	" ファイルオープンを便利に
	NeoBundle 'Shougo/unite.vim'
	" Unite.vimで最近使ったファイルを表示できるようにする
	NeoBundle 'Shougo/neomru.vim'
	" コメントON/OFFを手軽に実行
	NeoBundle 'tomtom/tcomment_vim'
	" インデントに色を付けて見やすくする
	" NeoBundle 'nathanaelkane/vim-indent-guides'
	
	" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
	let g:indent_guides_enable_on_vim_startup = 1
	" ログファイルを色づけしてくれる
	NeoBundle 'vim-scripts/AnsiEsc.vim'
	" 行末の半角スペースを可視化
	NeoBundle 'bronson/vim-trailing-whitespace'
	" インデントを把握しやすくするプラグイン
	NeoBundle 'nathanaelkane/vim-indent-guides'

  call neobundle#end()
  filetype plugin indent on
  " NeoBundleCheck " I'm not prefered checking.
endif

" Plugin設定部
function! s:neobundled(bundle)
  return s:is_neobundle_installed && neobundle#is_installed(a:bundle)
endfunction

if s:neobundled('neocomplete')
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_ignore_case = 1
  let g:neocomplete#enable_smart_case = 1
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns._ = '\h\w*'
  "" C++
  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif
  let g:neocomplete#force_omni_input_patterns.cpp =
        \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
  inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
endif

if s:neobundled('vim-indent-guides')
	" Vim 起動時 vim-indent-guides を自動起動
	let g:indent_guides_enable_on_vim_startup=1
	" ガイドをスタートするインデントの量
	let g:indent_guides_start_level=2
	" 自動カラー無効
	let g:indent_guides_auto_colors=0
	" 奇数番目のインデントの色
	autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=black
	" 偶数番目のインデントの色
	autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray
	" ガイドの幅
	let g:indent_guides_guide_size = 1
endif
"" 好きな数だけif s:neobundled('プラグイン名') - endifを繰り返す。
""""""""""""""""""""""""""""""
