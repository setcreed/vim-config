" 常用设置
" 设置行号
set number
set t_Co=256
syntax on

" 自动缩进
set tabstop=4
set shiftwidth=4
set noexpandtab
set softtabstop=4
set smartindent
set autoindent

set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set paste  " 解决拷贝的时遇到注释会自动注释后续所有行的问题

set laststatus=2

set term=xterm-256color
"set guifont=Monaco\ 12
"set guifont=Monaco\ for\ Powerline\ Nerd\ Font\ 12

" 编码设置
set encoding=utf-8
set termencoding=utf-8
set formatoptions+=mM
set fencs=utf-8,gbk

filetype off 
filetype plugin indent on

set background=dark
colorscheme hybrid

" 按F2进入粘贴模式
set pastetoggle=<F2>

" 高亮搜索
set hlsearch
set incsearch

" 设置折叠方式
" set foldmethod=indent
set foldmethod=manual

" 一些方便的映射
let mapleader=','
let g:mapleader=','

" 使用jj 进入 normal模式
inoremap jj <Esc> `^

" 使用 leader+w 直接保存
inoremap <leader>w <Esc>:w<cr>
noremap <leader>w :w<cr>

" 切换 buffer

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> [n :bnext<CR>

" 使用 ctrl+h/j/k/l 切换窗口
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" tagbar标签导航

nnoremap <leader>t :TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_width=30
autocmd BufReadPost *.py call tagbar#autoopen()
let g:jedi#auto_initialization = 1


" sudo to write
"cnoremap w!! w!sudo tee % >/dev/null

" json 格式化
com! FormatJSON %!python3 -m json.tool


" 插件设置，使用了 vim-plug
call plug#begin('~/.vim/plugged')
" 安装插件只需要 把 github 地址放到这里重启后执行  :PlugInstall

" 开屏插件
Plug 'mhinz/vim-startify'


" 状态栏美化
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 增加代码缩进线条
Plug 'Yggdroot/indentLine'

" nerdtree文件树目录管理
Plug 'preservim/nerdtree'

" 模糊搜索器
Plug 'ctrlpvim/ctrlp.vim'


" 快速定位插件
Plug 'easymotion/vim-easymotion'

" 成双成对编辑
Plug 'tpope/vim-surround'  " normal模式下增加(ys)  删除(ds)   修改(cs)

" 命令行模糊搜索工具，使用Ag[PATTERN]模糊搜索字符串，使用Files[PATH] 模糊搜索目录
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" 批量搜索替换
Plug 'brooth/far.vim'  " 使用 :Far 要替换的字符 替换为的字符 路径


" golang 插件 vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" python插件
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" vim tagbar 浏览代码, 使用 :TagbarToggle
Plug 'majutsushi/tagbar'

call plug#end()



" 插件相关设置
" 禁止 startify 自动切换目录
let g:startify_change_to_dir = 0

" 目录管理快捷键，
nnoremap <leader>v :NERDTreeFind<cr>
nnoremap <leader>g :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
let NERDTreeIgnore = [
	\ '\.git$', '\.hg$', '\.svn$', '\.stversions$', '\.pyc$', '\.pyo$', '\.svn$', '\.swp$',
	\ '\.DS_Store$', '\.sass-cache$', '__pycache__$', '\.egg-info$', '\.ropeproject$',
	\ ]

" 模糊搜索命令
let g:ctrlp_map = '<c-p>'

" 快速定位
nmap ss <Plug>(easymotion-s2)

" vim-go
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4


" python-mode
"let g:pymode_python = 'python3'
let g:pymode_python = 'python3'  " Values are `python`, `python3`, `disable`.
let g:pymode_trim_whitespaces = 1
let g:pymode_doc=1
let g:pymode_doc_bind = 'K'
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pylint']
let g:pymode_options_max_line_length = 120


" tagbar，
nnoremap <leader>t :TagbarToggle<CR>


