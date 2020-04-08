" 基本设置
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

set tags=tags
set noautochdir    " 注意这个自动切换目录会使rope找目录不正确，禁用

" 编码设置
set encoding=utf-8
" 文件编码探测列表
" vim 启动的时候会依次使用本配置中的编码对文件内容进行解码
" 如果遇到解码失败，则尝试使用下一个编码
" 常见的乱码基本都是 windows 下的 gb2312, gbk, gb18030 等编码导致的
" 所以探测一下 utf8 和 gbk 足以应付大多数情况了
set fileencodings=utf-8,gb18030

" vim 默认使用单行显示状态，但有些插件需要使用双行展示，不妨直接设成 2
set laststatus=2

" 开启自动识别文件类型，并根据文件类型加载不同的插件和缩进规则
filetype plugin indent on

" 主题颜色
set background=dark
colorscheme hybrid
"syntax enable
"colorscheme monokai
"colorscheme solarized
" 高亮搜索
set hlsearch
set incsearch


" 开启真彩色
set termguicolors

" 显示窗口比较小的时候折行展示，不然需要水平翻页，推荐
set linebreak

" 高亮光标所在行
set cursorline


" 一些方便的映射
let mapleader=','
let g:mapleader=','

" 使用jj 进入 normal模式
inoremap jj <Esc> `^

" 使用 leader+w 直接保存
inoremap <leader>w <Esc>:w<cr>
noremap <leader>w :w<cr>


noremap <leader>s :vs<cr>  " vertical split

" 切换 buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> [n :bnext<CR>

" 使用 ctrl+h/j/k/l 切换窗口
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" json 格式化
com! FormatJSON %!python3 -m json.tool

" 插件设置，使用了 vim-plug
call plug#begin('~/.vim/plugged')
" 安装插件只需要 把 github 地址放到这里重启后执行  :PlugInstall

" 开屏插件
Plug 'mhinz/vim-startify'
" nerdtree文件树目录管理
Plug 'preservim/nerdtree'
" 增加代码缩进线条
Plug 'Yggdroot/indentLine'
" 状态栏美化
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 添加文件图标
Plug 'ryanoasis/vim-devicons'

" 在窗口中显示标签的vim插件
Plug 'majutsushi/tagbar'
"for Tagbarbar https://github.com/universal-ctags/ctags
nnoremap <silent> <F8> :TagbarToggle<CR>
nnoremap <leader>t :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0    " sort by sourcefile
"let g:tagbar_show_linenumbers = 1
set updatetime=1000    " ms update

" 补全插件
Plug 'Valloric/YouCompleteMe'

" 代码格式化
Plug 'Chiel92/vim-autoformat'

"auto-format
"F5自动格式化代码并保存
noremap <F5> :Autoformat<CR>:w<CR>
let g:autoformat_verbosemode=1
let g:formatter_yapf_style = 'pep8'


" 语法检查
Plug 'w0rp/ale'
" ale config
" syntastic
let &runtimepath.=',~/.vim/plugged/ale'
let g:ale_sign_column_always = 0 " 一般需要实时检查，默认关闭
let g:ale_lint_on_save = 1 " save file auto check
let g:ale_lint_on_text_changed = 0 " for ale_lint_on_save = 1
let g:ale_lint_on_enter = 0 " for ale_lint_on_save = 1
map <F6> :ALEToggle \| echo 'g:ale_enabled =' g:ale_enabled<CR>
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'



Plug 'heavenshell/vim-pydocstring'
nmap <silent> <C-d> <Plug>(pydocstring)

"花里胡哨的彩虹括号 彩虹图标
Plug 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" vim-go
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
" python 
"Plug 'python-mode/python-mode', { 'branch': 'develop' }

" python-mode 设置
"let g:pymode_python = 'python3'  " Values are `python`, `python3`, `disable`.
"let g:pymode_trim_whitespaces = 1
"let g:pymode_doc=1
"let g:pymode_doc_bind = 'K'
"let g:pymode_rope_goto_definition_bind = "<C-]>"
"let g:pymode_lint = 1
"let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pylint']
"let g:pymode_options_max_line_length = 120

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
"
" for airline
let g:airline_powerline_fonts=1
let g:airline_theme = 'wombat'
let g:airline#extensions#tabline#enabled = 1
function! ArilineInit()
    let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])
    let g:airline_section_b = airline#section#create_left(['ffenc', 'hunks', '%F'])
    "let g:airline_section_c = airline#section#create(['filetype'])
    let g:airline_section_x = airline#section#create(['%P'])
    let g:airline_section_y = airline#section#create(['%B'])
    let g:airline_section_z = airline#section#create_right(['%l', '%c'])
endfunction
autocmd VimEnter * call ArilineInit()

call plug#end()


" YouCompleteMe settings
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 输入第1个字符开始补全 @2018-07-19 改为1，否则移动光标会弹出一堆无意义的提示
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1
" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_filetype_whitelist = { 'python': 1 }
let g:ycm_python_binary_path = 'python3'
map <C-G>  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"  fix .cpp error: ValueError: Still no compile flags, no completions yet.
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" Vim's autocomplete is excruciatingly slow
" http://stackoverflow.com/questions/2169645/vims-autocomplete-is-excruciatingly-slow
set complete-=i
