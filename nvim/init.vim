call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

Plug 'aklt/plantuml-syntax'
Plug 'tyru/open-browser.vim'
Plug 'weirongxu/plantuml-previewer.vim'

Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

Plug 'mboughaba/i3config.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug '907th/vim-auto-save'
Plug 'jiangmiao/auto-pairs'

Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" base16 stuff
let base16colorspace=256  " Access colors present in 256 colorspace
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

autocmd BufWritePost Xresources :! xrdb ~/.Xresources

" set global
let maplocalleader = "\\"
set scrolloff=999
set cursorline
set number
set relativenumber
set tabstop=4
set expandtab
set autoindent
set shiftwidth=4
set clipboard+=unnamedplus
set splitbelow splitright
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
set noswapfile
let g:auto_save = 1
let g:auto_save_silent = 1
colorscheme base16-default-dark
let g:airline_powerline_fonts = 1


" keybinds (general)
nnoremap Y y$
map <C-v> "+P
nnoremap oo :call append(line('.'), '')<CR>
nnoremap OO :call append(line('.')-1, '')<CR>

" line moving
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" plugin keybinds
nmap s <Plug>(easymotion-s)
vmap s <Plug>(easymotion-s)
map <space><tab> :NERDTreeToggle<CR>
nnoremap <space>p :PlantumlOpen<CR>

" fzf
nnoremap <space>~ :Files ~<CR>
nnoremap <space>f :Files<CR>
nnoremap <space>b :BLines<CR>
nnoremap <space>l :Lines<CR>
nnoremap <space>c :Commits<CR>
nnoremap <space>s :Snippets<CR>
nnoremap <space><space> :Buffers<CR>


" splits
nnoremap <tab>[ :split<CR>
nnoremap <tab>] :vsplit<CR>
nnoremap <tab>x :q<CR>


" latex
let g:tex_flavor='latex'
let g:vimtex_view_method = 'zathura'
let g:livepreview_previewer = 'zathura'
