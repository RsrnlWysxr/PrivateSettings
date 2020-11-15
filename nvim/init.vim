" Plug Manage
call plug#begin()
" 插件平台
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 文本操作
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-multiple-cursors'

" 模糊查找
Plug 'Yggdroot/LeaderF'

" 快速移动
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'

" session保存
Plug 'farmergreg/vim-lastplace'

" 显示优化
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'luochen1990/rainbow'
Plug 'junegunn/limelight.vim'
Plug 'terryma/vim-smooth-scroll'
Plug 'sheerun/vim-polyglot'
Plug 'MattesGroeger/vim-bookmarks'

" 主题
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'beikome/cosme.vim'
" Plug 'itchyny/vim-cursorword'  " Be replace by coc-highlight
call plug#end()

colorscheme cosme

" Coc-extension
let g:coc_global_extensions = ['coc-explorer', 'coc-pairs', 'coc-python', 'coc-highlight']


" Plug Setup
" " nerdtreae
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd bufenter * if (winnr("$")) == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree() | q | endif

" easymotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1  " 1 match 1 and ! 

" rainbow
let g:rainbow_active=1

" indentLine
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2

" limelight
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
let g:limelight_default_coefficient = 0.7
" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 0
" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
" let g:limelight_bop = '^\s'
" let g:limelight_eop = '\ze\n^\s'
"
" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

" coc-highlight
autocmd CursorHold * silent call CocActionAsync('highlight')

" smooth-scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 4)<cr>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 4)<cr>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<cr>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<cr>

"
" Abbrev
"
iabbrev adn and
iabbrev lyh .by lyh
iabbrev calss class
iabbrev sefl self

"
" GUI
"
map <A-1> :CocCommand explorer<cr>

"
" Set
"

" updatetime
set updatetime=200

" 是设置为双字款显示, 确保完整显示
set ambiwidth=double
set linespace=8
set termguicolors

" Tab
set tabstop=8
set shiftwidth=8
set noexpandtab  " 不自动替换tab为space

" 行号
set number
set relativenumber

" 语法高亮
syntax enable
syntax on

" 保存
set autowrite

" 搜索
set hlsearch
set ignorecase
set smartcase
set nowrapscan

" 自动重新读入
" set autoread

" 复制粘贴
" set paste
set clipboard+=unnamed

" 自动切换到文件当前目录
set autochdir

" 缩进 智能对齐方式
set autoindent
set smartindent


" 代码折叠
set foldmethod=syntax
set foldmethod=marker

" 显示匹配的括号
" set showmatch

" 高亮所在行
set cursorline
" highlight CursorLine guibg=#

" 拼写检查
" set spell

" kj移动留白
set so=7

" 持久化undo历史
set undofile
set undodir=~/.vim/undodir

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
" augroup resCur
	" autocmd! 
	" autocmd BufReadPost * call setpos(".", getpos("'\""))
" augroup END

" Operator Pending
" " like aw iw, exe onoremap will enter visual mode, so / can be useed
" onoremap p i(
" onoremap b /return<Cr>
onoremap in( :<C-u>normal! f(vi(<Cr>

"
" Leader
"
nnoremap <Space> <Nop>
let mapleader = " "

"
" Key Maping
"

" undo & redo
nnoremap U <C-r>

" 热更vim
nnoremap <Leader>rv :source $MYVIMRC<Cr>

" 搜索
nnoremap <Leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

" 基础键位
inoremap jk <Esc>
tnoremap jk <C-\><C-n>
vnoremap v <Esc>
nnoremap <Leader>q q
nnoremap T J

" 移动
nnoremap H ^
nnoremap L $
vnoremap L $
inoremap <C-l> <esc>la
nnoremap ' `
nnoremap ` '

" TextObj Operator

" yank and paste
nmap Y y$
nmap P v$"1dp
vnoremap p "1dP"


" Tab/Window
nnoremap K gt
nnoremap J gT
nnoremap <Tab> <C-w>w
nnoremap q ZZ

" 取消高亮搜索显示
nnoremap <BackSpace> :noh<Cr>

"
" Key Map Action
"

" easymotion
nmap s <Plug>(easymotion-overwin-f2)

" fuzzy search
nmap / <Plug>(incsearch-fuzzy-/)

" commentary
nmap <leader>cc gcc
vmap <leader>cc gc
