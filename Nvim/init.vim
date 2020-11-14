" Plug Manage
call plug#begin()
Plug 'preservim/nerdtree'
Plug 'Yggdroot/LeaderF'
Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'luochen1990/rainbow'
call plug#end()


" Plug Setup
" " nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$")) == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree() | q | endif
" " rainbow
let g:rainbow_active=1
" " indentLine
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2
" " Coc-extension
let g:coc_global_extensions = ['coc-explorer', 'coc-pairs', 'coc-python']

" Set
" " 是设置为双字款显示, 确保完整显示
set ambiwidth=double
" " Tab
set tabstop=4
set shiftwidth=4
set noexpandtab  " 不自动替换tab为space
" " 行号
set number
set relativenumber
" " 语法高亮
syntax enable
syntax on
" " 保存
set autowrite

" " 搜索
set hlsearch
set ignorecase
set smartcase
set nowrapscan

" " 自动重新读入
" set autoread

" " 粘贴模式
" set paste
set clipboard+=unnamed

" " 自动切换到文件当前目录
set autochdir

" " 缩进 智能对齐方式
set autoindent
set smartindent


" " 代码折叠
set foldmethod=syntax
set foldmethod=marker

" " 显示匹配的括号
" set showmatch

" " 高亮所在行
set cursorline

" " 拼写检查
" set spell

" " kj移动留白
set so=7

" Autocmd
" " Learn
" " autocmd [vimEvent, ...] [Pattern] [Cmd]
" " autocmd FileType python nnoremap <buffer><Leader>cc I#<esc>
" " autocmd FileType python iabbrev <buffer>iff if:<left
" " augroup to aviod redefine and exe n times
" augroup testGroup
	"autocmd BufWrite * :echom "Hello"
" augroup END

" " nnoremap <leader>g :execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

" " record cur pos
augroup resCur
	autocmd! 
	autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" Operator Pending
" " like aw iw, exe onoremap will enter visual mode, so / can be useed
" onoremap p i(
" onoremap b /return<Cr>
onoremap in( :<C-u>normal! f(vi(<Cr>

" Abbrev
iabbrev adn and
iabbrev lyh .by lyh
iabbrev calss class
iabbrev sefl self

" Leader
nnoremap <Space> <Nop>
let mapleader = " "

" Key Maping

" " 热更vim
nnoremap <Leader>rv :source $MYVIMRC<Cr>

" " 搜索
nnoremap <Leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

" " GUI
map <A-1> :NERDTreeToggle<Cr>
 
" " 基础键位
inoremap jk <Esc>
tnoremap jk <C-\><C-n>
vnoremap v <Esc>
nnoremap <Leader>q q
nnoremap T J
" " 移动
nnoremap H ^
nnoremap L $
vnoremap L $
inoremap <C-l> <esc>la
nnoremap ' `
nnoremap ` '
" " TextObj Operator
nmap Y y$
nmap P v$"1dp
vnoremap p "1dP
" " Tab/Window
nnoremap K gt
nnoremap J gT
nnoremap <Tab> <C-w>w
nnoremap q :wq!<Cr>
" " 取消高亮搜索显示
nnoremap <BackSpace> :noh<Cr>

