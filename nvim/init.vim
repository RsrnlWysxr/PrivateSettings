let g:polyglot_disabled = ['autoindent', 'sensible']
" Plug Manage
call plug#begin()
" 插件平台
Plug 'neoclide/coc.nvim'

" terminal
Plug 'voldikss/vim-floaterm'

" tmux
Plug 'christoomey/vim-tmux-navigator'

" vcs
Plug 'juneedahamed/vc.vim'
Plug 'mhinz/vim-signify'

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

" session保存
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'


" 显示优化
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'luochen1990/rainbow'
Plug 'terryma/vim-smooth-scroll'
Plug 'kshenoy/vim-signature'

" 语法高亮
Plug 'sheerun/vim-polyglot'

" 主题
Plug 'sainnhe/gruvbox-material'
call plug#end()

set nocompatible

set termguicolors
set background=dark
let g:gruvbox_material_transparent_background=1
colorscheme gruvbox-material

" Coc-extension
let g:coc_global_extensions = ['coc-explorer', 'coc-pairs', 'coc-highlight', 'coc-clangd', 'coc-bookmark', 'coc-python', 'coc-snippets', 'coc-yank']


"
" Plug Setup
"

" debug
let g:vimspector_install_gadgets = ['debugpy', 'vscode-cpptools', 'CodeLLDB' ]

" airline
let g:airline_extensions = ['tabline', 'hunks']
let g:airline_highlighting_cache = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 0
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

" coc-highlight
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd BufRead * highlight CurrentWord guibg=#05354E

" smooth-scroll
noremap <silent><nowait> <c-u> :call smooth_scroll#up(&scroll, 0, 9)<cr>
noremap <silent><nowait> <c-d> :call smooth_scroll#down(&scroll, 0, 9)<cr>

" session
let g:session_directory = '~/vim-session'
let g:session_autosave = "yes"
let g:session_default_to_last = 1

" LeaderF
let g:Lf_ShowDevIcons = 0

" python-indent
let g:python_pep8_indent_searchpair_timeout = 20

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
" map <A-1> :CocCommand explorer<cr>

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
	  \ setlocal tabstop=4 | 
	  \ setlocal softtabstop=4 |
	  \ setlocal shiftwidth=4 |
	  \ setlocal noexpandtab |
	  \ setlocal noautoindent |
	  \ setlocal nosmartindent 


" autocmd BufNewFile,BufRead *.py
" 	  \ set foldmethod=indent
" 	  \ set foldlevel=2


" 代码折叠
" set foldmethod=syntax
" set foldmethod=marker

" 显示匹配的括号
" set showmatch

" 高亮所在行
set cursorline

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
let g:floaterm_width = 0.4
let g:floaterm_height = 0.4
let g:floaterm_wintype = 'floating'
let g:floaterm_position = 'bottomright'
function! ExecuteShellCmdAndAutoClose(cmd)
	exe "FloatermNew --height=0.4 --width=0.4 --wintype=floating --name=nullptr --position=bottomright --autoclose=1 " . expand("cd &&") . expand(a:cmd)
endfunction

highlight Floaterm guibg=None
highlight FloatermBorder guibg=None guifg=#7DAEA3
nnoremap <silent><nowait> <leader>to :FloatermNew! --height=0.4 --width=0.4 --wintype=floating --name=nullptr --position=bottomright --autoclose=1 cd<cr>
nnoremap <silent><nowait> <leader>tc :FloatermKill<cr>
nnoremap <silent><nowait> <leader>tt :FloatermToggle<cr>

" undo & redo
nnoremap U <C-r>

" 热更vim
nnoremap <Leader>rv :source $MYVIMRC<Cr>

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


" Tab/Window
nmap <silent><nowait> J :bp<CR>
nmap <silent><nowait> K :bn<CR>


function! WinBufSwap()
  let thiswin = winnr()
  let thisbuf = bufnr("%")
  let thisline = line(".")
  let thiscol = col(".")

  let lastwin = winnr("#")
  exec lastwin . " wincmd w"

  let lastbuf = bufnr("%") 
  let lastline = line(".") 
  let lastcol = col(".")

  exec  "buffer ". thisbuf
  call cursor(thisline, thiscol)

  exec  thiswin ." wincmd w" ."|".
      \ "buffer ". lastbuf
  call cursor(lastline, lastcol)

endfunction

function! WinBufMove()
  let thiswin = winnr()
  let lastwin = winnr("#")

  let thisbuf = bufnr("%")
  let thisline = line(".")
  let thiscol = col(".")

  let lastbuf = bufnr("#") 

  exec lastwin . " wincmd w"

  exec  "buffer ". thisbuf
  call cursor(thisline, thiscol)

  if lastbuf != -1
	  exec  thiswin ." wincmd w" ."|".
		  \ "buffer ". lastbuf
  endif

  exec lastwin . " wincmd w"

endfunction


" 
" snippets
"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'


nnoremap <silent><nowait> R :call WinBufSwap()<cr>
nnoremap <silent><nowait> <leader><tab> :call WinBufMove()<cr>
" nnoremap <Tab> <C-w>w
nnoremap q :BD<cr>
nnoremap Q ZZ
function! NewVs()
	exe (winwidth(0) * 3/5) . " vs"
endfunction
" nnoremap <leader>ws :80vs<cr><C-w>l
nnoremap <silent><nowait> <leader>wk :call NewVs()<Cr>
set winfixwidth 



" 取消高亮搜索显示
nnoremap <silent><nowait> <BackSpace> :noh<Cr>


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
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)

"
" coc
"
"
nmap <silent><nowait> <leader>rn <Plug>(coc-rename)
nmap <silent><nowait> <leader>gg :<C-U><C-R>=printf("CocListResume")<CR><CR>
nmap <silent><nowait> <leader>cf <Plug>(coc-fix-current)
nmap <silent> <leader>yl  :<C-u>CocList -A --normal yank<cr>

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

let g:coc_enable_locationlist = 0
autocmd User CocLocationsChange CocList --auto-preview --normal location


"
" LeaderF
"
let g:Lf_HideHelp = 1
let g:Lf_WindowPosition = 'popup'
let g:Lf_PopupPosition = [15, 0]
let g:Lf_PopupPreviewPosition = 'bottom'
let g:Lf_PreviewCode = 0
let g:Lf_PreviewResult = {
		\ 'File': 0,
		\ 'Buffer': 0,
		\ 'Mru': 0,
		\ 'Tag': 0,
		\ 'BufTag': 0,
		\ 'Function': 0,
		\ 'Line': 0,
		\ 'Colorscheme': 0,
		\ 'Rg': 0,
		\ 'Gtags': 0
		\}
let g:Lf_PreviewInPopup = 1
let g:Lf_DefaultMode = 'NameOnly'
let g:Lf_ShortcutF = "<leader>fl"
let g:Lf_UseCache = 0

let g:Lf_Gtagslabel = 'native-pygments'
let g:Lf_Gtagsconf = '/usr/local/share/gtags/gtags.conf'

noremap <leader>bl :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>ll :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
noremap <leader>jj :<C-U><C-R>=printf("Leaderf! rg --recall")<CR><CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR><CR>
" search visually selected text literally
xnoremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR><CR>

noremap gj :<C-U><C-R>=printf("Leaderf gtags")<CR><CR>
noremap gk :<C-U><C-R>=printf("Leaderf! gtags --by-context --auto-jump")<CR><CR>
" noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
nnoremap gD :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
nnoremap gR :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap gn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap gp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

"
" bookmark
"
nnoremap mm :CocCommand bookmark.annotate<CR>
nnoremap <leader>ml :<C-U><C-R>=printf("CocList --auto-preview bookmark")<CR><CR>

" 
" Debug
"
nnoremap <silent><nowait> <leader>pp :call vimspector#Continue()<CR>
nnoremap <silent><nowait> <leader>pc :call vimspector#Reset()<CR>
nmap <A-1> :call vimspector#Continue()<CR>
nmap <A-2> :call vimspector#StepOver()<CR>
nmap <A-3> :call vimspector#StepInto()<CR>
nmap <A-4> :call vimspector#StepOut()<CR>
nmap <A-5> :call vimspector#RunToCursor()<CR>
nnoremap <silent><nowait> <leader>ps :call vimspector#ToggleBreakpoint()<CR>
nnoremap <silent><nowait> <leader>pd :call vimspector#ToggleBreakpoint(
nnoremap <leader>pw :VimspectorWatch 

"
" Svn
"
nmap <leader>vr :w<cr>:SignifyHunkUndo<cr>
nmap <leader>vl :SignifyHunkDiff<cr>
nmap <leader>vn <plug>(signify-next-hunk)
nmap <leader>vp <plug>(signify-prev-hunk)

"
" tmux
"   
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
nnoremap <silent> <A-l> :TmuxNavigateRight<cr>

"
" Spiecal
"
if filereadable(".vimrc.local")
	source .vimrc.local
endif
