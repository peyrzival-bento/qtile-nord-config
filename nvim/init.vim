" color for terminal
set t_co=256
syntax on
" let g:gruvbox_contrast_dark = 'medium'
" let g:gruvbox_termcolors = 256

" mouse options
set mouse=a
set mousef

" tabs and indenting
set ts=4
set sw=4

" some misc set-s
set number
set backspace=indent,eol,start
set ruler
set title
set encoding=utf-8
filetype plugin on
filetype indent on
set updatetime=100
set shortmess+=c
set signcolumn=yes
set hls is 
set wildmenu

" themes
" autocmd vimenter * ++nested colorscheme gruvbox
autocmd vimenter * ++nested colorscheme tokyonight
" set background=dark
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif


set background=dark " for the dark version
" set background=light " for the light version
" colorscheme one


" Plugins (vim-plug) -------------------------------
call plug#begin()

" colorschemes or personalization
Plug 'arcticicestudio/nord-vim', {'on': 'NERDTreeToggle'}
Plug 'ghifarit53/tokyonight-vim'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-signify'

" autocompletion, highlighting
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-python'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'python-mode/python-mode'
Plug 'dense-analysis/ale'
Plug 'gko/vim-coloresque'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'thaerkh/vim-indentguides'
Plug 'cohama/lexima.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'davidhalter/jedi-vim', { 'do': 'pip install jedi' }
Plug 'zchee/deoplete-jedi'


call plug#end()

" tokyonight configuration
let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1

" configuracoes nerdtree
nnoremap <C-o> :NERDTreeToggle<CR>

"configuracao airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#excludes = ['branches', 'index']
let g:airline#extensions#tabline#buffer_idx_mode = 1
" let g:airline_theme='nord-vim'
let g:airline_powerline_fonts = 1

" Configurações do CoC.nvim

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Fim das configurações do CoC.nvim

" Configurações do Vim IndentGuides

let g:indentguides_spacechar = '▏'
let g:indentguides_tabchar = '▏'

" Fim das configurações do Vim IndentGuides

" Configurações do lexima.vim

let g:indentguides_spacechar = '▏'
let g:indentguides_tabchar = '▏'

" Fim das configurações do lexima.vim

" configuracao ale
let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'ruby': ['standardrb', 'rubocop'],
      \   'javascript': ['eslint'],
      \}
let g:ale_fixers = {
      \    'python': ['yapf'],
      \}
nmap <F10> :ALEFix<CR>
let g:ale_fix_on_save = 1
function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}

" disabling bell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif
