set clipboard=unnamed

au GUIEnter * simalt ~x
syntax on
set rnu
colorscheme codedark
set mouse=a
set backspace=indent,eol,start
set number
set shiftwidth=4
set tabstop=4
set smarttab
set smartindent
set nowrap
set expandtab
set hlsearch
set hls
set is
set showmatch
set wildmenu
set laststatus=2

cd D:\code
map <F2> :NERDTreeToggle<CR>
map <Leader>nt :NERDTree %:p:h<CR>

" autocmd filetype cpp nnoremap <F4> :!g++ % -o %:r <CR>
" autocmd filetype c nnoremap <F4> :!gcc % -o %:r <CR>
" autocmd filetype java nnoremap <F4> :!javac % <CR>
" autocmd filetype python nnoremap <F4> :w <bar> !python %<CR>
" autocmd filetype cpp nnoremap <F5> :!%:r <CR>
" autocmd filetype c nnoremap <F5> :!%:r <CR>
" autocmd filetype java nnoremap <F5> :!java -cp %:p:h %:t:r <CR>

map <F4> :call CompileGcc()<CR>
func! CompileGcc()
exec "w"
if &filetype == 'c'
exec "!gcc % -o %<"
elseif &filetype == 'cpp'
exec "!g++ % -o %<"
elseif &filetype == 'java'
exec "!javac %"
elseif &filetype == 'sh'
exec "!bash %"
elseif &filetype == 'python'
exec "!python %"
elseif &filetype == 'html'
exec "!firefox % &"
elseif &filetype == 'go'
exec "!go build %<"
elseif &filetype == 'mkd'
exec "!~/.vim/markdown.pl % > %.html &"
endif
endfunc

map <F5> :call RunGcc()<CR>
func! RunGcc()
exec "w"
if &filetype == 'c'
exec "!%<"
elseif &filetype == 'cpp'
exec "!%<"
elseif &filetype == 'java'
exec "!java -cp %:p:h %:t:r"
elseif &filetype == 'go'
exec "!go run %"
elseif &filetype == 'mkd'
exec "!firefox %.html &"
endif
endfunc

imap <C-BS> <C-W>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-f> :NERDTreeFind<CR>
autocmd VimEnter * NERDTree | wincmd p
" Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = 'v'
nnoremap <C-S-tab> :bprevious<CR>
nnoremap <C-tab>   :bnext<CR>
nnoremap <C-x>     :bdelete<CR>
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='wombat'

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab'
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jmcantrell/vim-virtualenv'
Plug 'dense-analysis/ale'
Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()

set guifont=Consolas:h15

inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}
