" Plug Manage
call plug#begin()
" 插件平台
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" terminal
Plug 'voldikss/vim-floaterm'

" debug
Plug 'puremourning/vimspector'

" buff
Plug 'qpkorr/vim-bufkill'

" 文本操作
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-multiple-cursors'
Plug 'wellle/targets.vim'

" 查找
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'rhysd/clever-f.vim'
" Plug 'junegunn/vim-peekaboo'

" session保存
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'


" 显示优化
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'luochen1990/rainbow'
Plug 'terryma/vim-smooth-scroll'
Plug 'kshenoy/vim-signature'
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-signify'
" Plug 'TaDaa/vimade'
" Plug 'junegunn/limelight.vim'

" 主题
Plug 'sainnhe/gruvbox-material'
call plug#end()

set termguicolors
set background=dark
let g:gruvbox_material_transparent_background=1
colorscheme gruvbox-material

" Coc-extension
let g:coc_global_extensions = ['coc-explorer', 'coc-pairs', 'coc-highlight', 'coc-python', 'coc-clangd']


" Plug Setup
" " nerdtreae
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd bufenter * if (winnr("$")) == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree() | q | endif

" debug
let g:vimspector_install_gadgets = ['debugpy', 'vscode-cpptools', 'CodeLLDB' ]

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 0

let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" easymotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1  " 1 match 1 and ! 


" rainbow
let g:rainbow_active=1

" clever-f
let g:clever_f_across_no_line = 1
let g:clever_f_smart_case = 1
let g:clever_f_not_overwrites_standard_mappings = 1
nmap f <Plug>(clever-f-f)
nmap F <Plug>(clever-f-F)

" indentLine
let g:indentLine_enabled = 1


" limelight
" Color name (:help cterm-colors) or ANSI code
" let g:limelight_conceal_ctermfg = 'gray'
" let g:limelight_conceal_ctermfg = 240
" let g:limelight_conceal_guifg = 'DarkGray'
" let g:limelight_conceal_guifg = '#777777'
" let g:limelight_default_coefficient = 0.7
" Number of preceding/following paragraphs to include (default: 0)
" let g:limelight_paragraph_span = 0
" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
" let g:limelight_bop = '^\s'
" let g:limelight_eop = '\ze\n^\s'
"
" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
" let g:limelight_priority = -1

" coc-highlight
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd BufRead * highlight CurrentWord guibg=#05354E

" smooth-scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 7)<cr>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 7)<cr>

" session
let g:session_directory = '~/vim-session'
let g:session_autosave = "yes"
let g:session_default_to_last = 1

" LeaderF
let g:Lf_ShowDevIcons = 0


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
set updatetime=100
set nobackup
set nowritebackup

" coc example config
set shortmess+=c


" 显示
set ambiwidth=double
set linespace=8
set guicursor=n-v-c:block,i-ci-ve:ver20,r-cr:hor20,o:hor50
		  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
		  \,sm:block-blinkwait175-blinkoff150-blinkon175

" 行号
set number
set relativenumber
set signcolumn=yes

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
set autoread

" 复制粘贴
" set paste
set clipboard+=unnamed

" 自动切换到文件当前目录
" set autochdir

" 缩进 智能对齐方式
set noexpandtab  " 不自动替换tab为space
set smartindent
set autoindent
set softtabstop=4
set shiftwidth=4
set tabstop=4
set list
set listchars=tab:\ \ \| 

autocmd BufRead *.py 
	  \ set tabstop=4 | 
	  \ set softtabstop=4 |
	  \ set shiftwidth=4 |
	  \ set noexpandtab

autocmd BufNewFile,BufRead *.py
	  \ set foldmethod=indent


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

" buff
set hidden
set switchbuf=usetab

" Autocmd
" " Learn
" " autocmd [vimEvent, ...] [Pattern] [Cmd]
" " autocmd FileType python nnoremap <buffer><Leader>cc I#<esc>
" " autocmd FileType python iabbrev <buffer>iff if:<left
" " augroup to aviod redefine and exe n times
" augroup testGroup
	"autocmd BufWrite * :echom "Hello"
" augroup END

" nnoremap <leader>g :execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

" " record cur pos
" augroup resCur
	" autocmd! 
	" autocmd BufReadPost * call setpos(".", getpos("'\""))
" augroup END

" Operator Pending
" " like aw iw, exe onoremap will enter visual mode, so / can be useed
" onoremap p i(
" onoremap b /return<Cr>
" onoremap in( :<C-u>normal! f(vi(<Cr>

"
" Leader
"
nnoremap <Space> <Nop>
let mapleader = " "

"
" Key Maping
"

"
" 补全
" 
let complete=".,w,b,u,t,i,d,t"


"
" Terminal
"
autocmd TermOpen * set modifiable
highligh TermCursor guifg=#7DAEA3 guibg=None
" float term
let g:floaterm_winblend=1
let g:floaterm_borderchars=['-', '|', '-', '|', '-', '-', '-', '-']
let g:floaterm_autoinsert=v:false
function! ExecuteShellCmdAndAutoClose(cmd)
	exe "FloatermNew --height=0.4 --width=0.33 --wintype=floating --name=nullptr --position=bottomleft --autoclose=1 " . expand("cd &&") . expand(a:cmd)
endfunction

highlight Floaterm guibg=None
highlight FloatermBorder guibg=None guifg=#7DAEA3
nnoremap <silent> <leader>to :FloatermNew! --height=0.4 --width=0.33 --wintype=floating --name=nullptr --position=bottomleft --autoclose=1 cd<cr>
nnoremap <silent> <leader>tc :FloatermKill<cr>
nnoremap <silent> <leader>tt :FloatermToggle<cr>

"
" g108 server
"
nnoremap <silent> <leader>ss :call ExecuteShellCmdAndAutoClose("cd workspace && sh kill_serv.sh && sh run_serv.sh")<cr>
nnoremap <silent> <leader>sl :call executeshellcmdandautoclose("cd workspace && sh rl_serv.sh")<cr>


" undo & redo
nnoremap U <C-r>

" 热更vim
nnoremap <Leader>rv :source $MYVIMRC<Cr>

" 搜索
" nnoremap <Leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

" 基础键位
inoremap jk <Esc>
tnoremap jk <C-\><C-n>
tnoremap <Esc> <C-\><C-n>
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

" yank and paste
nmap Y y$
nmap P v$dp
vnoremap p "1dP"


" Tab/Window
nmap J <Plug>AirlineSelectPrevTab
nmap K <Plug>AirlineSelectNextTab


function! WinBufSwap()
  let thiswin = winnr()
  let thisbuf = bufnr("%")
  let lastwin = winnr("#")
  let lastbuf = winbufnr(lastwin)

  exec  lastwin . " wincmd w" ."|".
      \ "buffer ". thisbuf ."|".
      \ thiswin ." wincmd w" ."|".
      \ "buffer ". lastbuf
endfunction

nnoremap <silent> R :call WinBufSwap()<cr>
nnoremap <Tab> <C-w>w
nnoremap q :BD<cr>
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap Q ZZ
function! NewVs()
	exe (winwidth(0) * 1/3) . " vs" . "|" . "wincmd w"
endfunction
" nnoremap <leader>ws :80vs<cr><C-w>l
nnoremap <silent> <leader>wk :call NewVs()<Cr>
set winfixwidth 



" 取消高亮搜索显示
nnoremap <BackSpace> :noh<Cr>

"
" easymotion
"
nmap s <Plug>(easymotion-overwin-f2)

" 
" fuzzy search
"
nmap ? <Plug>(incsearch-fuzzy-/)

"
" commentary
"
nmap <leader>cc gcc
vmap <leader>cc gc

"
" goto
"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>rn <Plug>(coc-rename)

"
" LeaderF = open
"
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_ShortcutF = "<leader>fo"

let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>bo :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>lo :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
noremap <leader>oo :<C-U>Leaderf! rg --recall<CR>
" noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR><CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR><CR>
" search visually selected text literally
xnoremap <leader>f :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR><CR>

noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
" noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

" debug
"
let g:vimspector_enable_mappings = 'HUMAN'
