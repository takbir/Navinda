set nocompatible " be iMproved, required
filetype off " required
syntax on
set nu
set clipboard=unnamed
set fileformat=unix
set showmatch
set fenc=utf-8
set mouse=a
set cursorline
set cursorcolumn
set backspace=indent,eol,start
set autoread
set guifont=Fira\ Code:h14
set list                     " 显示Tab符，使用一高亮竖线代替
set listchars=tab:\|\        " 显示Tab符，使用一高亮竖线代替
set helplang=cn             ""中文文档
set nobackup                ""关闭备份
set noswapfile              ""关闭.swp
filetype plugin on          " 针对不同的文件类型加载对应的插件

 ""窗口启动时自动最大化
 ""窗口设置
if has('gui_running')
    " set guioptions=mr       "c去掉"
    set guioptions=         ""隐藏全部
    set guioptions-=m       " 隐藏菜单栏
    set guioptions-=T       " 隐藏工具栏
    set guioptions-=L       " 隐藏左侧滚动条
    set guioptions-=r       " 隐藏右侧滚动条
    set guioptions-=b     " 隐藏底部滚动条
    " set showtabline-=0    " 隐藏Tab栏
endif


" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'plasticboy/vim-markdown'
Plug 'elzr/vim-json'
Plug 'davidhalter/jedi-vim'
Plug 'lokaltog/vim-powerline'
Plug 'vim-scripts/indentpython.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'nvie/vim-flake8'
Plug 'easymotion/vim-easymotion'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'jiangmiao/auto-pairs'
Plug 'dyng/ctrlsf.vim'
Plug 'solarnz/thrift.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'jmcantrell/vim-virtualenv'

" Initialize plugin system
call plug#end()

" Plugin configuration

set background=dark
set termguicolors
colorscheme quantum

" IndentGuides
" let g:indent_guides_enable_on_vim_startup = 1

let g:ctrlp_funky_syntax_highlight = 1

let python_highlight_all=1
let NERDTreeIgnore=['\.pyc$','\.svn$','\.tmp$','\.bak$','\~$']
let NERDTreeShowBookmarks=1 " 默认显示书签"
let NERDTreeChDirMode=2

let g:flake8_show_in_gutter=0

"incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

""superTab
let g:SuperTabCrMapping=1 "回车不换行

""markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" CtrlSF
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_case_sensitive = 'no'

" NerdCommenter
" 注释的时候自动加个空格, 强迫症必配
let g:NERDSpaceDelims=1


" Key Mapping

let mapleader=';'

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Focus tags
nnoremap <Leader><space> gt

" CtrlSF
nnoremap <Leader>ff :CtrlSF 

:map <F9> :set paste<CR>
:map <F10> :set nopaste<CR>

nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
map <C-n> :NERDTreeToggle<CR>

map <Leader> <Plug>(easymotion-prefix)

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" VIRTUALENV setup
:python << EOF 
import os 
virtualenv = os.environ.get('VIRTUAL_ENV') 
if virtualenv: 
  activate_this = os.path.join(virtualenv, 'bin', 'activate_this.py') 
  if os.path.exists(activate_this): 
    execfile(activate_this, dict(__file__=activate_this)) 

EOF

