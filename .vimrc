set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
"set rtp+=/usr/local/lib/python3.6/site-packages/powerline/bindings/vim/
"set laststatus=2
"set t_Co=256

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" all plugin

" For Autocompletion
Plugin 'Valloric/YouCompleteMe'
"Syntax checker
Plugin 'vim-syntastic/syntastic'
"Language formatter for python
Plugin 'google/yapf'
"PowerLine
Plugin 'powerline/powerline'

Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
"Nerd Tree for directory
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'Raimondi/delimitMate'
Plugin 'morhetz/gruvbox'
"This is magic
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'Yggdroot/indentLine'

Plugin 'preservim/nerdcommenter'
" All of your Plugins must be added before the following line
call vundle#end()            " required
call glaive#Install()        " enable this line after the installation of glaive
filetype plugin indent on    " required
set tabstop=4
" when indenting with '>' , use 4 spaces width

filetype plugin on
"My maps
"
:map <C-n> :NERDTree





set shiftwidth=4
" on pressing tab, insert 4 spaces
" set expandtab

" custom setting
set mouse=a
set number
set encoding=utf-8
set backspace=indent,eol,start
set cursorline
set guioptions=
syntax on

" indent for global
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent

" indent for special file
autocmd FileType c,cpp setlocal expandtab shiftwidth=4 softtabstop=4 cindent 
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 autoindent

" setup for ycm
let g:ycm_global_ycm_extra_conf = '/Users/ling/.ycm_global_ycm_extra_conf'
let g:ycm_python_binary_path = 'python'
let g:ycm_complete_in_comments = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_semantic_triggers =  {
  \ 'c' : ['re!\w{2}'],
  \ 'cpp' : ['re!\w{2}'],
  \ 'python' : ['re!\w{2}'],
  \ }
"
" setup for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
"
" autoformat
augroup autoformat_settings
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType python AutoFormatBuffer yapf
augroup END
   
" use google style for clang-format
Glaive codefmt clang_format_style='google'
"
" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p 
	\ | ene | endif
"
" setup for gruvbox
set t_Co=256
set background=dark
colorscheme gruvbox
" let g:gruvbox_contrast_dark = 'soft'
"
" setup for ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" setup for tagbar
nmap <F8> :TagbarToggle<CR>

" setup for indent line
let g:indentLine_char = '│'



"setup for nerd commenter
"add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
