" basic syntax highlighting
syntax on

" required by some plugins
filetype plugin indent on

" smaller indentation
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4

"relative line numbering
set relativenumber

" encoding
set encoding=utf-8

" quit when pressing q on command mode
map q :quit<CR>

" no need to press return to search
set incsearch

" better help menu
set wildmenu

" better bar with file info
set laststatus=2

" title for dwm bar
set title

" better forcing
set confirm

" save with ctrl + s
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>

" terminal shortcut
nmap <c-t> :vert term<CR>

" tabbing visual selection
vmap <Tab> >gv
vmap <S-Tab> <gv

" clipboard copy has xclip as dependency
set clipboard=unnamedplus

" check flake8 on python write
autocmd BufWritePost *.py call flake8#Flake8()

" python source
let g:python3_host_prog='/usr/bin/python3'

call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'alvan/vim-closetag'
Plug 'lervag/vimtex'
Plug 'mattn/emmet-vim'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'amadeus/vim-css'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'nvie/vim-flake8'
Plug 'neovimhaskell/haskell-vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'nvim-lualine/lualine.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'davidhalter/jedi-vim'
Plug 'wlangstroth/vim-racket'
Plug 'clojure-vim/clojure.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'Olical/conjure'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'tpope/vim-commentary' 
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'rhysd/vim-clang-format'
Plug 'arcticicestudio/nord-vim'
Plug 'preservim/nerdtree'
Plug 'OmniSharp/omnisharp-vim'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sainnhe/everforest'
Plug 'sainnhe/gruvbox-material'
Plug 'sheerun/vim-polyglot'
Plug 'psf/black'
Plug 'yaegassy/coc-tailwindcss3'
call plug#end()

" coc extensions
let g:coc_global_extensions = ['coc-snippets', 'coc-pairs', 'coc-html', 'coc-tsserver', 'coc-rust-analyzer', 'coc-json', 'coc-vimtex', 'coc-css', 'coc-lua', 'coc-python', 'coc-java', 'coc-java-debug', 'coc-solargraph', 'coc-vetur', 'coc-svelte', 'coc-go']

" coc config
source $HOME/.config/nvim/plug-config/coc.vim	
" fixing popups
" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>""    inoremap <silent><expr> <c-space> coc#refresh()
" coc vetur (vueJS)
" the following command needs to be ran in the project root
" npm i eslint eslint-plugin-vue -D

" theme
" colorscheme nord 
" colorscheme dracula
" colorscheme onedark 
" autocmd vimenter * ++nested colorscheme gruvbox
autocmd vimenter * ++nested colorscheme gruvbox-material
"autocmd vimenter * ++nested colorscheme everforest 
" set bg=dark
" autocmd vimenter * ++nested colorscheme nord 

" explorer
" :nmap <space>e <Cmd>CocCommand explorer<CR>
:nmap <space>e <Cmd>NERDTree<CR>

" coc-pairs to comply with closetag
autocmd FileType html let b:coc_pairs_disabled = ['<']

" close tag on go tmpl files
autocmd BufNewFile,BufRead *.tmpl set filetype=html
autocmd BufNewFile,BufRead *.gohtml set filetype=html
autocmd BufNewFile,BufRead *.jet set filetype=html

" coc go 
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

command! -nargs=0 OR :silent call CocAction('runCommand', 'editor.action.organizeImport')

" vim tex
let g:vimtex_view_method = 'zathura'

" vim tex dependencies
" biber, texmk (texlive-most)

" rust
let g:rustfmt_autosave = 1

" better closetag behaviour on react
let g:closetag_xhtml_filetypes = 'xhtml,jsx, tsx'

" dependencies
" python3 -m pip install pynvim
" pip install flake8
" bear for clang correct autocompletion of third party libraries

lua << END
require('lualine').setup {
  options = {
    icons_enabled = true,
	theme = 'gruvbox',
--	theme = 'dracula',
--    theme = 'nord',
--  theme = 'custom_gruvbox',
--	section_separators = '', 
--	component_separators = '',
	component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
diff_color = {
  added = {
    fg = "#fe8019",
  },
  modified = {
    fg = "#fe8019",
  },
  removed = {
    fg = "#cc241d",
  }
}  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
END

" disable jedi completions for coc-python
let g:jedi#completions_enabled = 0

" conjure
map ee :ConjureEval<CR>

" rainbow parentheses
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END
