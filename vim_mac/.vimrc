set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"Plugin 'bling/vim-bufferline'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'Chiel92/vim-autoformat'
Plugin 'airblade/vim-gitgutter'
Plugin 'bitc/vim-hdevtools'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jasoncodes/ctrlp-modified.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'pangloss/vim-javascript'
Plugin 'qpkorr/vim-bufkill'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'

call vundle#end()

filetype plugin indent on
syntax on

let g:ctrlp_map = "gQ"
let g:ctrlp_mruf_max = 888
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
                                      \ --ignore .git
                                      \ --ignore .DS_Store
                                      \ --ignore "**/*.pyc"
                                      \ --ignore-dir "node_modules"
                                      \ -g ""'


let g:skip_loading_mswin=1
let g:java_allow_cpp_keywords=1

" ### PLUGINS ###

let g:syntastic_aggregate_errors = 1 
let g:syntastic_id_checkers = 0
autocmd FileType javascript let b:syntastic_checkers = findfile('.jscsrc', '.;') != '' ? ['jscs', 'jshint'] : ['jshint']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_error_symbol = '☡'
let g:syntastic_style_warning_symbol = '¡'
let g:syntastic_enable_balloons = 1

let g:BufKillOverrideCtrlCaret = 1
cnoreabbrev bd BD
cnoreabbrev bun BUN
cnoreabbrev bw BW

cnoreabbrev bdd bd
cnoreabbrev bunn bun
cnoreabbrev bww bw

set updatetime=250


au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>


" Avoid loading unused plugins
let loaded_vimirc=1
let loaded_tagmenu = 1

" Tmenu options
let Tmenu_sort_type = "name"
let Tmenu_max_tag_length = 32

"let Tlist_Use_SingleClick = 1

set dir=~/.vim/swp

highlight MBEVisibleNormal guifg=white guibg=#00aa00
highlight MBEVisibleChanged guifg=white guibg=#00aa00
highlight MBENormal guifg=darkblue
highlight MBEChanged guifg=#bb0000 gui=bold

let php_parent_error_close = 1
let php_parent_error_open = 1

runtime macros/matchit.vim

set tabstop=4
set shiftwidth=4
set expandtab
set showmatch
set matchtime=2

set cino=c0

set scrolloff=1

" Searching options
"set smartcase
"set ignorecase
set incsearch
set hlsearch

set isfname-=:
set shortmess+=AIxmlifn
set shortmess-=T

set wildmenu

set nf-=alpha
set nf-=octal

" Directories
"set backupdir=~/.vim/bk
"set backupskip=~/.vim/bk
"set backupext=.bk
set path=
set path+=.;src,,
set path+=../inc
set path+=inc
set path+=modules
set path+=builder
set path+=../modules
set path+=../src
set path+=../builder

"au FileType c,cpp,java,php set mps+==:;
:au BufNewFile,BufRead *.php set nowrap

" Java
"set makeprg=anticate
"set makeprg=c:\\progs\\mingw\\bin\\g++\ %
"set makeprg=bd.bat
set makeprg=javac\ -source\ 1.3\ -target\ 1.3\ -d\ ../clazzez\ -bootclasspath\ \"C:/WTK2.5.2/lib/cldcapi11.jar;C:/WTK2.5.2/lib/midpapi21.jar;\"\ *.java
set errorformat=%f:%l:\ %m
"-o\ $*\ $*
set errorformat=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
set errorformat=%f:%l:\ %m,%-Z\ %p^,%-C%.%#
set efm=%A%f:%l:\ %m,%+Z%p^,%+C%.%#,%-G%.%#
set efm=%A%f:%l:\ %m
",%-Z%p^
",%-C%.%#


" Window appearance
set helpheight=2000
set hidden

" Control options
set keymodel=startsel
set mouse=a
set backspace=start,indent,eol

set updatecount=50
set isk+=$
" set iskeyword="@,48-57,_,128-167,224-235,,"
" set clipboard=unnamed

" Auto-formatting
set formatoptions-=o
set formatoptions-=t
set formatoptions-=a
set formatoptions+=1nw
set autoindent
set nocindent
set smartindent
set cpo+=I
"set diffopt+=iwhite

"set relativenumber
set laststatus=2

" Completion
"set wildmenu
"set wildmode=longest:full,full
set wildmode=list:longest
set wildignore+=*/tmp/*,*.so,*.sw?,*.zip     " MacOSX/Linux
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set showfulltag
set tags=c:/harcore/tags/tags\ ./tags;\ tags

set confirm


nnoremap - "_
onoremap - "_

nnoremap v mv
onoremap v `v
onoremap V 'v

"inoreabbrev FF for(int i=0; i<; ++i)
"inoreabbrev TT System.currentTimeMillis()
"inoreabbrev PP System.out.println("xxyyzz
"inoreabbrev LL LogWork()->Place(
inoreabbrev _S _SESSION
inoreabbrev _P _GET
inoreabbrev _G _POST
inoreabbrev _R _REQUEST

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

let mapleader = "'"
map '' <Leader>_
map <Leader>- <Leader>_
nnoremap <Leader>t :Tlist<C-M>
" nnoremap <Leader>_ :e ~/_vimrc<C-M>
nnoremap <Leader>_ :e ~/.vimrc<C-M>
nnoremap <Leader>; yy:<C-R>"<BS><C-M>
nnoremap <Leader>: <Leader>;
nnoremap <Leader>7 :%s/\V192.168.1.\[^:]\*/127.0.0.1/g<C-M>
nnoremap <Leader>6 :%s/\V127.0.0.1/61.9.201.173/g<C-M>
nnoremap <Leader>5 :%s/\V61.9.201.173/192.168.1.246/g<C-M>
" 60.229.111.241
nnoremap <Leader>d :set fdm=diff<C-M>:set scrollbind<C-M>:set nowrap<C-M>:set diff<C-M>:set go+=b<C-M>:nnoremap <C-L> :diffu<C-M>:noh<C-M><C-L>
nnoremap <Leader>D :browse vert diffs<C-M>
nnoremap <Leader><C-d> :diffu<C-M>
nnoremap <Leader>r :set readonly<C-M>:set nomodifiable<C-M>
nnoremap <Leader>R :set noreadonly<C-M>:set modifiable<C-M>
nnoremap <Leader>P yaWPE<C-A>
nnoremap <Leader>b :set nowrap<C-M>:set go+=b<C-M>
nnoremap <Leader>a :g/\v^(.*arrived after)@!/normal dd/<C-M>
" nnoremap <Leader>j "*P/service:<C-M>"*y$
nnoremap <Leader>T /\v\[([^:]+:){2}(..).*\n\zs\[([^:]+:){2}\2@!...<C-M>
nnoremap <Leader>c :cd /<C-M>:cd %:h<C-M>:pwd<C-M>
nnoremap <Leader>C :cd /<C-M>:cd %:h<C-M>:cd ..<C-M>:pwd<C-M>
nnoremap <Leader>q P0<C-A>yy0
" nnoremap <Leader>j :%s={={\r=ge<C-M>:%s=}=\r}=ge<C-M>:%s=,=,\r=ge<C-M>gg=G:noh<CR><C-L>
nnoremap <Leader>j !!python -mjson.tool<C-M>
vnoremap <Leader>j !python -mjson.tool<C-M>
nnoremap <Leader>n :NERDTreeToggle<C-M>

nnoremap <Leader>s{ :%s=\V{={\r=ge<C-M>:%s=\V}=\r}=ge<C-M>:%s=\v,\s*\ze\S=,\r=ge<C-M>gg=G:noh<CR><C-L>
nmap <Leader>s} s{
nnoremap <Leader>s[ :%s=\V[=[\r=ge<C-M>:%s=\V]=\r]=ge<C-M>:%s=\v,\s*\ze\S=,\r=ge<C-M>gg=G:noh<CR><C-L>
nmap <Leader>s] s[
nnoremap <Leader>s( :%s=\V(=(\r=ge<C-M>:%s=\V)=\r)=ge<C-M>:%s=\v,\s*\ze\S=,\r=ge<C-M>gg=G:noh<CR><C-L>
nmap <Leader>s) s(

nnoremap <M-Left> :bN<C-M>
nnoremap <M-Right> :bn<C-M>

nnoremap <M-D> :g/\v^(.*
cnoremap <M-D> \v)@!/normal dd/

nnoremap zx zt12<C-Y>
nnoremap zX zb12<C-E>

nnoremap ; :

nnoremap <C-`> :e #<CR>
nnoremap <M-`> :e #<CR>
nnoremap <C-~> :e #<CR>
nnoremap `<Tab> :e #<CR>


nnoremap [l :lprevious<C-M>
nnoremap ]l :lnext<C-M>

nnoremap o :set fo-=o<C-M>o
nnoremap O :set fo-=o<C-M>O

"nnoremap Q @@
nnoremap K @@

nnoremap gf gF
nnoremap gF gf
nnoremap g<C-F> :e <cfile><CR>
"nmap gQ Q<C-\\>f
nnoremap Q :CtrlPMRUFiles<CR>

"nnoremap gh :lr<CR>zz
"nnoremap gj :lnext<CR>zz
"nnoremap gk :lprevious<CR>zz

inoremap <C-G><C-U> <C-G>u

map <M-Z> zt
map zm [mzt<C-Y><C-Y>

map <C-W><C-W> <C-W>W

map <C-Up> <C-Y>
map <C-Down> <C-E>


"map g<C-D> YF.b<C-]>b<C-]><M-/><C-R>"<M-/>

map <M-]> :execute ':cstag <cword>'<C-M>

"cnoremap <C-'> <C-R>"
"cnoremap <C-"> <C-R>*

com! -complete=file -nargs=* Edit silent! exec "!vim --servername " . v:servername . " --remote <args>" 

nnoremap zq zt<C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>

nnoremap <silent> <C-S> :wall<C-M>
vmap <silent> <C-S> <Esc><C-S>gv
imap <silent> <C-S> <C-O><C-S>

nnoremap <silent> <M-q> :execute ':cscope find c <cword>'<C-M>
nnoremap <silent> <M-z> :execute ':cscope find s <cword>'<C-M>

" source C:/core/codex/cscope_maps.vim

set grepprg=ag\ \"$*\"
" set grepprg=grep\ -nHIr\ \"$*\"\ *\ \\\|\ grep\ -v\ ^\\.svn\ \\\|\ grep\ -v\ \\development.log\ \\\|\ grep\ -v\ ^\\_svn\ \\\|\ grep\ -v\ \.dump\ \\\|\ grep\ -v\ cscope\.out\ \\\|\ grep\ -v\ tags
" set grepprg=grep\ -nHiIr\ \"$*\"\ *\ \\\|\ grep\ -v\ ^\\_svn\ \\\|\ grep\ -v\ cscope\.out\ \\\|\ grep\ -v\ tags
" set grepprg="grep\ -nHi\ $*\ *.%:e?"
" set grepprg="C:/harcore/UnxUtils/usr/local/wbin/grep.exe -nHi\ $*\ *.%:e?"
" set grepprg=grep\ -nHiIr\ --include=*.%:e\ --include=*.cpp\ --include=*.h\ --include=*.hpp\ \"$*\"\ *
" set grepprg=grep\ -PnHiIr\ --include=*.%:e\ --include=*.cpp\ --include=*.h\ --include=*.hpp\ \"$*\"\ *

nnoremap <F12> :execute ':grep <cword>'<C-M>
nnoremap <M-*> :execute ':grep <cword>'<C-M>
vnoremap <M-*> y:grep <C-R>"<C-M>
nnoremap g* :execute ':grep <cword>'<C-M>
vnoremap g* y:grep <C-R>"<C-M>
"vnoremap * y:%s@\V\C\<<C-R>"\>@&@gc
vnoremap * y/\V\c\<<C-R>"\>/<C-M>

"vnoremap p d"0p
vnoremap P d"0P
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

nnoremap <F6> :!entag<C-M>
" Some example entags:
" ctags -h ".php" -R *.php
"nnoremap <F7> :wall<C-M>:make<C-M>:copen<C-M>:set nobuflisted<C-M><C-^>
":cr<C-M>:cn<C-M>
nnoremap <F7> :wall<C-M>:copen<C-M>:set nobuflisted<C-M>:make<C-M>
nnoremap <S-F7> :wall<C-M>:make<C-M>
nnoremap <F9> :wall<CR>:!start mingw32-gcc % -lstdc++ -mwindows
nnoremap <C-F5> :!start epoc<CR>

nmap <MiddleMouse> <LeftMouse><C-]>
imap <MiddleMouse> <Esc><MiddleMouse>
nnoremap <C-MiddleMouse> <LeftMouse>*
nmap <M-MiddleMouse> <LeftMouse><M-*>
imap <C-MiddleMouse> <Esc><MiddleMouse>

nnoremap <M-`> :e %:r.h<C-M>
nnoremap <M-~> :e %:r.cpp<C-M>

nnoremap di' f'dT'
nnoremap yi' f'yT'
nnoremap ci' f'cT'

nnoremap da' F'df'
nnoremap ya' F'yf'
nnoremap ca' F'cf'

nnoremap di" f"dT"
nnoremap yi" f"yT"
nnoremap ci" f"cT"

nnoremap da" F"df"
nnoremap ya" F"yf"
nnoremap ca" F"cf"

nnoremap di. f.dT.
nnoremap yi. f.yT.
nnoremap ci. f.cT.

nnoremap da. F.df.
nnoremap ya. F.yf.
nnoremap ca. F.cf.

nnoremap di> f<dT>
nnoremap yi> f<yT>
nnoremap ci> f<cT>

nnoremap da> F<d2f>
nnoremap ya> F<y2f>
nnoremap ca> F<c2f>

nnoremap da/ F/df/
nnoremap ya/ F/yf/
nnoremap ca/ F/cf/

nnoremap di/ T/dt/
nnoremap yi/ T/yt/
nnoremap ci/ T/ct/

nnoremap daa ?\v[(,]<C-M>wd/\v[),]<C-M>:noh<C-M>
nnoremap yaa ?\v[(,]<C-M>wy/\v[),]<C-M>:noh<C-M>
nnoremap caa ?\v[(,]<C-M>wc/\v[),]<C-M>

nmap dia daa
nmap yia yaa
nmap cia caa

nnoremap <C-L> :noh<C-M><C-L>

" nnoremap ; :
" nnoremap : ;
" vnoremap ; :
" vnoremap : ;

imap <C-Tab> <Esc><C-Tab>
vmap <C-Tab> <Esc><C-Tab>
"nnoremap <C-Tab> :bn<C-M>
nnoremap <C-Tab> <C-^>

imap <C-S-Tab> <C-O><C-S-Tab>
vmap <C-S-Tab> <Esc><C-S-Tab>
nnoremap <C-S-Tab> :bN<C-M>

nnoremap dD D

nnoremap Y yiw

cnoreabbrev bda bufdo bd
cabbrev bdo bufdo bd<C-M>`<Tab>;bn<C-M>;bd<C-M>

nnoremap ds 0d$
nnoremap dil 0d$ 
nnoremap dam ]Md[mdk
nnoremap vam ]Mv[m

nnoremap yam ]MV[Mjy<C-O><C-O>

nnoremap <PageDown> <C-D>
nnoremap <PageUp> <C-U>

" map <2-LeftMouse> :call DoubleClick()<CR>
map <C-LeftMouse> ".P
nmap <Space> i <Esc>
nmap <CR> i<CR><Esc>
nnoremap <S-CR> o<Esc>
noremap <C-S> :wall<CR>

" map <buffer> <Up> gk
" map <buffer> <Down> gj

nmap <buffer> <F2> mq<Home>i//<Esc>'q
imap <buffer> <F2> <Esc>mq<Home>i//<Esc>'qi

inoremap <M-/> <C-P>

" inoremap <Esc> <Esc>l
" inoremap ^C ^Cl

noremap <F4> :cn<C-M>
noremap <F3> :cN<C-M>
noremap <S-F4> :cnf<C-M>
noremap g<F4> :cnf<C-M>
noremap <S-F3> :cNf<C-M>
noremap g<F3> :cNf<C-M>
noremap <C-F4> :tn<C-M>
noremap <C-F3> :tN<C-M>

map <S-Insert> "*gP
map <M-Space> :simalt ~<CR>

" noremap / /\v
set nomagic
nmap <Space> i<Space><Esc>l

nnoremap <F1> <Esc>
vmap <F1> "qy:execute ":help " @q<CR>
vnoremap <LeftMouse> V<LeftMouse>

com! Kwbd let kwbd_bn= bufnr("%")|enew|exe "bdel ".kwbd_bn|unlet kwbd_bn

imap <C-Space> <C-P>
imap <A-/> <C-Space>
imap <C-BS> <C-W>

inoremap <Esc> z<BS><Esc>
inoremap <C-C> z<BS><C-C>

nnoremap # *NN

inoreabbrev breka break
inoreabbrev braek break
inoreabbrev reutrn return
inoreabbrev ownder owner
inoreabbrev sumbit submit
inoreabbrev _SESSIOn _SESSION
inoreabbrev equlas equals
inoreabbrev oeprator operator

cnoreabbrev nowarp nowrap
cnoreabbrev warp wrap

	" vim -b : edit binary using xxd-format!
	augroup Binary
	  au!
	  au BufReadPre  *.bin,*.exe,*.tga let &bin=1
	  au BufReadPost *.bin,*.exe,*.tga if &bin | %!xxd
	  au BufReadPost *.bin,*.exe,*.tga set ft=xxd | endif
	  au BufWritePre *.bin,*.exe,*.tga if &bin | %!xxd -r
	  au BufWritePre *.bin,*.exe,*.tga endif
	  au BufWritePost *.bin,*.exe,*.tga if &bin | %!xxd
	  au BufWritePost *.bin,*.exe,*.tga set nomod | endif
	augroup END
    "	:if !exists("autocommands_loaded")
	"   :  let autocommands_loaded = 1
	"   :  au ...
	"   :endif

set report=1

set history=400
set ruler
set showcmd

set listchars=tab:>-

  " I like highlighting strings inside C comments
     let c_comment_strings=1
     
let macvim_skip_colorscheme=1
