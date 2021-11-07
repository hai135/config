call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'davidhalter/jedi-vim'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'jiangmiao/auto-pairs'
Plug 'sbdchd/neoformat'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'voldikss/vim-floaterm'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

autocmd VimEnter * NERDTree
map <silent> <F5> :NERDTreeToggle<CR>
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>

augroup exe_code
        autocmd!
        " run python
        autocmd FileType python map <silent> <F9> :w<CR> :FloatermNew --autoclose=0 --position=topright python3 % <CR>
        autocmd FileType c map <silent> <F9> :w<CR> :FloatermNew --autoclose=0 --position=topright gcc % -o %< && ./%< <CR>
        autocmd FileType javascript map <silent> <F9> :w<CR> :FloatermNew --autoclose=0 --position=topright node % <CR>

augroup END

" config floaterm
nnoremap   <silent>   <F7>    :FloatermNew --position=topright<CR>
nnoremap   <silent>   <F6>    :FloatermPrev <CR>
nnoremap   <silent>   <F8>    :FloatermNext <CR>
tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNew --position=topright<CR>
tnoremap   <silent>   <F6>    <C-\><C-n>:FloatermPrev <CR>
tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermNext <CR>
nnoremap   <silent>   <F12>   :FloatermToggle <CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle <CR>
let g:python3_host_prog=expand('/usr/bin/python3')
"theme
packadd! dracula
colorscheme dracula
set relativenumber
set packpath=/usr/local/share/nvim/runtime,~/.local/share/nvim/site
syntax on
set splitbelow
" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
let g:deoplete#enable_at_startup = 1

