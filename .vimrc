call plug#begin('~/.vim/plugged')

Plug 'mattn/emmet-vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'ycm-core/YouCompleteMe'
Plug 'vim-utils/vim-husk'
Plug 'freitass/todo.txt-vim'
Plug 'mboughaba/i3config.vim'
Plug 'preservim/nerdcommenter'
Plug 'francoiscabrol/ranger.vim'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'

call plug#end()


" Emmet Shortcut 
let g:user_emmet_mode= 'n' 
let g:user_emmet_leader_key = ','

"-------------
set number relativenumber
let &t_ut=''
colorscheme molokai
set mouse=a
set showcmd
set formatoptions-=croF
autocmd VimLeave * call system("xsel -ib", getreg('+'))

"Closing brackets
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
" inoremap {      {}<Left>
" inoremap {<CR>  {<CR>}<Esc>O
" inoremap {{     {
" inoremap {}     {}


" indentLine

let g:indentLine_setColors = 10

"NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

set fillchars+=vert:│


"airline
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = '❯'
let g:airline_theme='wombat'
let g:airline_powerline_fonts = 1


highlight Directory ctermfg=Blue
highlight LineNr ctermfg=186 ctermbg=000



hi DiffAdd      cterm=none    ctermfg=232          ctermbg=246
hi DiffChange   cterm=none    ctermfg=232          ctermbg=146
hi DiffDelete   cterm=bold    ctermfg=232          ctermbg=072
hi DiffText     cterm=none    ctermfg=232          ctermbg=217


cnoremap <C-F> <Right
cnoremap <C-B> <Left>

set expandtab ts=4 sw=4 sts=4 ai
set backspace=indent,eol,start
set hidden
set incsearch
set scrolloff=8


let mapleader="\\"


" NerdCommenter
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

nnoremap <leader>s :call SyntasticToggle()<CR>


let g:syntastic_is_open = 0
function! SyntasticToggle()
if g:syntastic_is_open == 1
    lclose
    let g:syntastic_is_open = 0
else
    Errors
    let g:syntastic_is_open = 1
endif
endfunction

