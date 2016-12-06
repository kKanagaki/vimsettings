
:set enc=utf-8

syntax on

" kaoriya
set ignorecase
" kaoriya
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase


"---------------------------------------------------------------------------
" 編集に関する設定:
"
" kaority のパクリ
"
" タブの画面上での幅
"set tabstop=4
" タブをスペースに展開しない (expandtab:展開する)
" tabstop:				Tab文字を画面上で何文字分に展開するか
" shiftwidth:				cindentやautoindent時に挿入されるインデントの幅
" softtabstop:				Tabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
set tabstop=4 shiftwidth=4 softtabstop=0
set noexpandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" バックスペースでインデントや改行を削除できるようにする
"set backspace=indent,eol,start
" indent:1 eol:2 start:3
set backspace=2
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM


set smartindent		" 自動インデント，スマートインデント


"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
"
" 行番号を非表示 (number:表示)
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set nolist
" どの文字でタブや改行を表示するかを設定
"set listchars=tab:>-,extends:<,trail:-,eol:<
" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title
" 画面を黒地に白にする (次行の先頭の " を削除すれば有効になる)
"colorscheme evening " (Windows用gvim使用時はgvimrcを編集すること)
"colorscheme mycolor
colorscheme desert

set showmatch				" 括弧の対応をハイライト
set showcmd				" 入力中のコマンドを表示
set showmode				" 現在のモードを表示
set nowrap				" 画面幅で折り返さない
set list					" 不可視文字表示
set listchars=tab:^\ 			" 不可視文字の表示方法
set notitle				" タイトル書き換えない
set scrolloff=5				" 行送り
set display=uhex				" 印字不可能文字を16進数で表示


" 全角スペースの定義
hi ZenkakuSpace gui=underline guibg=Cyan cterm=underline ctermbg=Cyan ctermfg=LightBlue
match ZenkakuSpace \　\ 			" 全角スペースの色を変更

set cursorline				" カーソル行をハイライト
augroup cch
	autocmd! cch
	autocmd WinLeave * set nocursorline
	autocmd WinEnter,BufRead * set cursorline
augroup END
:hi clear CursorLine
:hi CursorLine gui=underline
hi CursorLine cterm=underline ctermbg=black guibg=black

set hlsearch	"検索箇所のハイライト

:set fenc=utf-8
:set fencs=iso-2022-jp,enc-jp,cp932


" grep.vim 用の設定
" Rgrep 使用時にMACの場合、xargsのオプションがUnixと異なるため、
" 同じオプションを持つGNU版xargs である gxargs を使用する。
" MAC用の処理しか書いてません。Windows版とかどうするのかしら？
let OS_TYPE = substitute(system('uname'), '\n', '', '')

"if has('mac')
if OS_TYPE == 'Darwin'
	if system ('which gxargs') != ''
		let Grep_Xargs_Path = 'gxargs'
	else
		echo 'Rgrep gxargs none.'
		let Grep_Find_Use_Xargs = 0
	endif
else
	echo 'OS_TYPE is not Darwin.'
endif

if has('mac')
  " let g:vimproc_dll_path = $VIMRUNTIME . '/autoload/proc.so'
  let g:vimproc_dll_path = $VIMRUNTIME . '/../plugins/vimproc/lib/vimproc_mac.so'
endif 


" ■プラグインの検索 
" :Bundles plagin_name 
" プラグインを検索して、インストール削除などが行えます。 

set nocompatible
filetype off                   " (1)

set rtp+=~/.vim/bundle/vundle/    " (2)
call vundle#rc()               " (3)

" original repos on github
"Bundle 'tpope/vim-fugitive'	" Git関連のプラグイン

" vim-scripts repos
"Bundle 'rails.vim'				" Vim上だけで環境が完結するようになるらしい for Ruby

" non github repos
"Bundle 'git://git.wincent.com/command-t.git'

" ファイルエクスプローラーを表示する
" Bundle 'git://github.com/scrooloose/nerdtree.git'

" Trinity
Bundle 'SrcExpl'
Bundle 'Trinity'
Bundle 'The-NERD-tree'
Bundle 'taglist.vim'

" quickrun
Bundle 'quickrun.vim'
Bundle 'quickrun'

" unite
Bundle 'unite.vim'

" vimfiler
Bundle 'Shougo/vimfiler'

" vimshell/vimproc
Bundle 'https://github.com/Shougo/vimshell.git'
Bundle 'https://github.com/Shougo/vimproc'
" neocomplcache
Bundle 'https://github.com/Shougo/neocomplcache'

filetype plugin indent on     " (5)


"------------------------------------
" unite.vim
"------------------------------------
"unite prefix key.
nnoremap [unite] <Nop>
nmap <Space>f [unite]

" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap [unite]b :Unite buffer<CR>
" ファイル一覧
noremap [unite]f :UniteWithBufferDir -buffer-name=files file<CR>
" 最近使ったファイルの一覧
noremap [unite]m :Unite file_mru<CR>
" レジスタ一覧
noremap [unite]r :Unite -buffer-name=register register<CR>
" ファイルとバッファ
noremap [unite]u :Unite buffer file_mru<CR>
" 全部
noremap [unite]a :UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
" au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" <C-[>押すと終了する
au FileType unite nnoremap <silent> <buffer> <C-[> :q<CR>
" au FileType unite inoremap <silent> <buffer> <C-[> <ESC>:q<CR>

call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')

"------------------------------------
" vimshell
"------------------------------------

"------------------------------------
" ショートカット定義（独自系）
"------------------------------------
" .vimrcを開く
nnoremap <Space>.  :<C-u>edit $MYVIMRC<CR>
" source ~/.vimrc を実行する。
nnoremap <Space>,  :<C-u>source $MYVIMRC<CR> 
" jjエスケープ
inoremap jj <ESC>
" tagジャンプ
nnoremap <C-CR> <C-]>

noremap! ¥ \
noremap! \ ¥



"keywordprg
"既定では "man" または "man -s"
set keywordprg=:help


" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1















