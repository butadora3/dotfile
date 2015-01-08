set number 
syntax on
"colorscheme elflord
set tabstop=2
set mouse=a
set whichwrap=b,s,<,>,[,]
set clipboard+=unnamed
set clipboard+=autoselect

scriptencoding utf-8
set encoding=utf-8

set guifont=Ricty\10

"indent config
"filetype plugin indent on
set tabstop=4
set autoindent
"set expandtab
set shiftwidth=4
set background=dark

" ビジュアルモードで選択したテキストが、クリップボードに入るようにする
" http://nanasi.jp/articles/howto/editing/clipboard.html
" set clipboard=autoselect
 
 " 無名レジスタに入るデータを、*レジスタにも入れる。
 " set clipboard+=unnamed
 set clipboard=unnamedplus

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

""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""

if has('vim_starting')
	set nocompatible               " Be iMproved

	" Required:
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'
call neobundle#end()
" インデントに色を付けて見やすくする
" NeoBundle 'nathanaelkane/vim-indent-guides'

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1
" ログファイルを色づけしてくれる
NeoBundle 'vim-scripts/AnsiEsc.vim'
" 行末の半角スペースを可視化
NeoBundle 'bronson/vim-trailing-whitespace'

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" " this will conveniently prompt you to install them.
NeoBundleCheck
""""""""""""""""""""""""""""""
