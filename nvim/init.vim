set scrolloff=999
" set background=dark

" set leaders
let maplocalleader = "\\"
set termguicolors

" latex
let g:vimtex_view_method = 'zathura'

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
if exists('$TMUX')
    let &t_SI .= "\ePtmux;\e\e[=1c\e\\"
    let &t_EI .= "\ePtmux;\e\e[=2c\e\\"
 else
    let &t_SI .= "\e[=1c"
    let &t_EI .= "\e[=2c"
 endif

" indentation
set autoindent
set tabstop=4
set shiftwidth=4

" numbers
set number
set relativenumber

" tabs
set tabstop=4
set expandtab

" reasonable copy paste
vnoremap <C-c> "+y
map <C-v> "+P
set clipboard+=unnamedplus

" reasonable bindings
nnoremap Y y$

" moving lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" reasonable split
set splitbelow splitright

" consistant split navigations
map <C-h> <C-w>h
map <C-k> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" latex stuff
let g:tex_flavor='latex'

" auto-save
let g:auto_save = 1
let g:auto_save_silent = 1
set noswapfile

" Run xrdb whenever Xresources are updated
autocmd BufWritePost ~/.Xresources !xrdb %

" easy motion
nmap s <Plug>(easymotion-s)
vmap s <Plug>(easymotion-s)

" add blank lines
nnoremap oo :call append(line('.'), '')<CR>
nnoremap OO :call append(line('.')-1, '')<CR>

" highlight
" nnoremap <CR> :noh<CR>

" latex preview
let g:livepreview_previewer = 'zathura'

if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
endif

" Go down    Tab
inoremap <silent><expr><tab>  pumvisible() ? "\<C-n>" : "\<tab>"
" Go up      Shift-Tab
inoremap <silent><expr><s-tab> pumvisible() ? "\<C-p>" : "\<s-tab>"

call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lilydjwg/colorizer'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'joshdick/onedark.vim'
Plug '907th/vim-auto-save'
Plug 'easymotion/vim-easymotion'
Plug 'mboughaba/i3config.vim'
Plug 'lervag/vimtex'
Plug 'Shougo/deoplete.nvim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'taigacute/gruvbox9'
Plug 'Shougo/echodoc.vim'
Plug 'SirVer/ultisnips'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'metakirby5/codi.vim'
call plug#end()

" deoplete
let g:deoplete#enable_at_startup = 1

let g:airline_theme='onedark'
colorscheme onedark

"echodoc
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'
highlight link EchoDocFloat Pmenu

" cursorline
set cursorline

" fzf
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

nnoremap cd :Files ~<CR>
nnoremap dc :ProjectFiles<CR>
nnoremap cx :BLines<CR>
nnoremap dx :Lines<CR>
nnoremap <space><space> :Buffers<CR>
nnoremap zc :Commands<CR>
nnoremap cz :Snippets<CR>
nnoremap cq :Commits<CR>

nnoremap <tab>[ :split<CR>
nnoremap <tab>] :vsplit<CR>

" snippets
set rtp+=~/dotfiles
let g:UltiSnipsExpandTrigger="<F2>"
let g:UltiSnipsSnippetsDir = "~/dotfiles/UltiSnips"
