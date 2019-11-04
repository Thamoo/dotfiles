call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'joshdick/onedark.vim'
Plug '907th/vim-auto-save'
Plug 'easymotion/vim-easymotion'
Plug 'mboughaba/i3config.vim'
Plug 'lervag/vimtex'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc-python'
" Plug 'Shougo/deoplete.nvim'
" Plug 'deoplete-plugins/deoplete-jedi'
" Plug 'dense-analysis/ale'
" Plug 'taigacute/gruvbox9'
" Plug 'Shougo/echodoc.vim'
" Plug 'SirVer/ultisnips'
" Plug 'sheerun/vim-polyglot'
" Plug 'tpope/vim-fugitive'
" Plug 'metakirby5/codi.vim'
call plug#end()

autocmd CursorHold * silent call CocActionAsync('highlight')


" set global
let maplocalleader = "\\"
set scrolloff=999
set termguicolors
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
let g:auto_save = 1
let g:auto_save_silent = 1
set noswapfile
let g:airline_theme='onedark'
colorscheme onedark


let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
if exists('$TMUX')
    let &t_SI .= "\ePtmux;\e\e[=1c\e\\"
    let &t_EI .= "\ePtmux;\e\e[=2c\e\\"
 else
    let &t_SI .= "\e[=1c"
    let &t_EI .= "\e[=2c"
 endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap cn <Plug>(coc-rename)
xmap dq  <Plug>(coc-format-selected)
nmap dq  <Plug>(coc-format-selected)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <space>a  <Plug>(coc-codeaction-selected)
nmap <space>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
nmap <space>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <space>f  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)


set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


" keybinds
nnoremap Y y$
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
vnoremap <C-c> "+y
map <C-v> "+P
map <C-h> <C-w>h
map <C-k> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nmap s <Plug>(easymotion-s)
vmap s <Plug>(easymotion-s)
nnoremap oo :call append(line('.'), '')<CR>
nnoremap OO :call append(line('.')-1, '')<CR>
" inoremap <silent><expr><tab>  pumvisible() ? "\<C-n>" : "\<tab>"
" inoremap <silent><expr><s-tab> pumvisible() ? "\<C-p>" : "\<s-tab>"

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
nnoremap gs :CocCommand snippets.editSnippets<CR>
nnoremap cq :Commits<CR>

nnoremap <tab>[ :split<CR>
nnoremap <tab>] :vsplit<CR>

" latex
let g:tex_flavor='latex'
let g:vimtex_view_method = 'zathura'
let g:livepreview_previewer = 'zathura'

