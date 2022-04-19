call plug#begin('~/.vim/plugged')"{{{

Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'vim-utils/vim-husk'
Plug 'mboughaba/i3config.vim'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
Plug 'mtdl9/vim-log-highlighting'

call plug#end()"}}}

" MY VIM SETTINGS{{{
set number relativenumber
set mouse=a
let &t_ut=''
set showcmd
set formatoptions-=croF
set foldmethod=marker
autocmd VimLeave * call system("xsel -ib", getreg('+'))
set expandtab ts=4 sw=4 sts=4 ai
set backspace=indent,eol,start
set hidden
set incsearch
set scrolloff=8
let mapleader="\\"
set formatoptions-=cro

hi Normal ctermbg=NONE

highlight Directory ctermfg=Blue
highlight LineNr ctermfg=186 ctermbg=None



hi DiffAdd      cterm=none    ctermfg=232          ctermbg=246
hi DiffChange   cterm=none    ctermfg=232          ctermbg=146
hi DiffDelete   cterm=bold    ctermfg=232          ctermbg=072
hi DiffText     cterm=none    ctermfg=232          ctermbg=217


cnoremap <C-F> <Right>
cnoremap <C-B> <Left>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"Closing brackets
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
" inoremap {      {}<Left>
" inoremap {<CR>  {<CR>}<Esc>O
" inoremap {{     {
" inoremap {}     {}}}}

" COLOR SCHEME{{{
"
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
colorscheme onedark

"}}}



" Emmet Shortcut {{{
let g:user_emmet_mode= 'n' 
let g:user_emmet_leader_key = ','"}}}

" indentLine{{{

let g:indentLine_setColors = 10"}}}

"NERDTree{{{
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

set fillchars+=vert:│"}}}

"airline{{{
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = '❯'
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1"}}}

" NerdCommenter{{{
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
let g:NERDToggleCheckAllLines = 1"}}}

" Syntastic{{{
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
endfunction"}}}

" for Fedora{{{
set clipboard=unnamedplus"}}}
