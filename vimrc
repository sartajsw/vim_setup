syntax on
set nocompatible

set number
set autoindent
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set nowrap
set smartcase
set incsearch

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" set colorcolumn=80
" highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'dhruvasagar/vim-zoom'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'

call plug#end()

"colorscheme dracula
"colorscheme nord
colorscheme gruvbox
set background=dark

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Airline
"let g:airline_powerline_fonts = 1
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''
"let g:airline_theme = 'nord'

" Lightline
set laststatus=2

let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'component_function': {
    \   'filetype': 'MyFiletype',
    \   'fileformat': 'MyFileformat',
    \   'lineinfo': 'MyLineinfo',
    \ }
    \ }

function! MyLineinfo() abort
    if (winwidth(0) < 70)
        return ''
    endif

  return line('.') . '/' . line('$')
endfunction

function! MyFiletype()
    if (winwidth(0) < 70)
        return ''
    endif
    
    return (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft')
endfunction

function! MyFileformat()
    if winwidth(0) < 70
        return ''
    endif

    return (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol())
endfunction

" We don't need to see things like -- INSERT -- anymore
set noshowmode

" COC config
let g:coc_global_extensions = [
\ 'coc-snippets',
\ 'coc-pairs',
\ 'coc-prettier',
\ 'coc-json',
\ ]
" from readme
" if hidden is not set, TextEdit might fail.
set hidden

" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" run prettier on save

" Move between splits
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l

" Nerd Tree
nmap <C-N> :NERDTreeToggle<cr>
nmap <Esc>n :NERDTreeToggle<cr>
nmap <C-P> :Files<cr>
nmap <C-F> :Rg<cr>
nmap <Esc>f :Rg <C-R><C-W>
nmap <Esc>l :BLines<cr>

" Mirror the NERDTree before showing it. This makes it the same on all tabs.
" nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeFocus<CR>
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Misc
nmap <Esc>p :set paste!<cr>
nmap <Esc>h :set hlsearch!<cr>
nmap <CR> o<Esc>

" Make it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Navigate tabs
nmap <Esc>t :tabnew 
nmap gt :tabn<cr>
nmap gp :tabp<cr>
nmap <Esc>c :tabclose<cr>
" Always show tabs
"set showtabline=2

" For python files
nmap <F6> :! python % <cr>
nmap <F5> :! clear; python % <cr>
