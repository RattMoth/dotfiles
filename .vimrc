" ~/.vimrc
"Remove Dumb GUI Stuff In GVim
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar
"""""""""""""""""""""""""""""""""""""""""""""
" UTF8 Support
set encoding=utf-8
"""""""""""""""""""""""""""""""""""""""""""""
" Set Default Working Directory
" cd /home/matt/Documents/vimDocs
"""""""""""""""""""""""""""""""""""""""""""""
" Key (Re)Mapings

" jj to replace <Esc>  
inoremap jj <Esc>

" :w!! to edit a readonly file
ca w!! w !sudo tee "%"

" Copy to system clipboard
"nnoremap <leader>y "+y

" Copy entire document to system clipboard
nnoremap <leader>y ggVG"+y

" Paste from yank register shortcut
nnoremap  <leader>p "0p
nnoremap  <leader>P "0P

" Paste from system clipboard register shortcut
nnoremap  <leader>v "+p
nnoremap  <leader>V "+P

" Spellcheck toggle with F4
function! ToggleSpellCheck()
  set spell!
  if &spell
    echo "Spellcheck ON"
  else
    echo "Spellcheck OFF"
  endif
endfunction

nnoremap <silent> <F4> :call ToggleSpellCheck()<CR>

" Spell Check Key bindings
nmap <leader>e [s
nmap <leader>r ]s
nmap <leader>t 1z=

"Pencil (Softwrapping) Toggle
map <F5> :SoftPencil <CR>
map <F6> :NoPencil <CR>

" Cursorline toggle with F3
function! ToggleCursorLine()
  set cursorline!
" if &cursorline
"   echo "CursorLine ON"
" else
"   echo "CursorLine OFF"
" endif
endfunction

nnoremap <silent> <F3> :call ToggleCursorLine()<CR>

" Add Emphasis to Word (Markdown)
nmap <leader>B ysiw*

" Add Emphasis to EOL
nmap <leader>b ys$*
""""""""""""""""""""""""""""""""""""""""""""
" Better Search
set ignorecase
set smartcase
set incsearch
"""""""""""""""""""""""""""""""""""""""""""""
"Word Processor Mode (Outdated)

"func! WordProcessorMode() 
"        colorscheme seoul256  
"        setlocal formatoptions=1 
"        setlocal noexpandtab 
"        map j gj 
"        map k gk
"        setlocal spell spelllang=en_us 
"        "set thesaurus+=/home/matt/.vim/thesaurus/mthesaur.txt
"        "set complete+=s
"        "set formatprg=par
"        setlocal wrap 
"        setlocal linebreak 
"endfu 
"com! WP call WordProcessorMode()
"""""""""""""""""""""""""""""""""""""""""""""
"Python Stuff

" Run current buffer with F7
"autocmd FileType python nnoremap <buffer> <F7> :exec '!python3' shellescape(@%, 1)<cr>
"
" Begin python files with #!/usr/bin/python3
autocmd BufNewFile *.py call append(0,'#!/usr/bin/python3')
"
" Make files executable with F6
"nmap <F6> :w<CR>:silent !chmod 755 %<CR>
" enable syntax highlighting
syntax enable

" " show line numbers
set number
"
" " set tabs to have 2 spaces
set ts=2
"
" " indent when moving to the next line while writing code
set autoindent
"
" " expand tabs into spaces
set expandtab
"
" " when using the >> or << commands, shift lines by 2 spaces
set shiftwidth=2
"
" " show a visual line under the cursor's current line
"set cursorline
"
" " show the matching part of the pair for [] {} and ()
"set showmatch
"
" " enable all Python syntax highlighting features
let python_highlight_all = 1
"
" no vi compat
set nocompatible

" filetype func on
filetype on
"""""""""""""""""""""""""""""""""""""""""""""
"Plugin Managment

" initialize vundle
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" start- all plugins below

Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'ron89/thesaurus_query.vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'reedes/vim-pencil'
Plugin 'plasticboy/vim-markdown'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'tpope/vim-surround'
Plugin 'justinmk/vim-sneak'
"Plugin 'morhetz/gruvbox'
"Plugin 'junegunn/seoul256.vim'
"Plugin 'reedes/vim-colors-pencil'
"Plugin 'dbeniamine/todo.txt-vim.git'
"Snipmate and Dependencies

" stop - all plugins above
call vundle#end()

" filetype func on
filetype plugin indent on

" Set Markdown Filetype
au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,*.md  setf markdown


" Lightline Fix
set laststatus=2
set noshowmode
set ttimeoutlen=50
"
" Pencil Options
augroup pencil
    autocmd!
    autocmd FileType markdown,mkd call pencil#init({'wrap': 'soft'})
    autocmd FileType text         call pencil#init({'wrap': 'soft'})
augroup END

" Markdown Compatible Tables
let g:table_mode_corner='|'

" Vim Markdown Options
"
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_no_default_key_mappings = 1
set conceallevel=2

" Automatically insert bullets
" augroup format
"     autocmd FileType mkd,markdown set formatoptions+=tcrnqj
" augroup END
" Disable Markdown Folding
set formatoptions+=tcrnqj 
let g:vim_markdown_folding_disabled = 1
set foldenable
"
" AutoCap Bullets and Sentence Beginnings
"
augroup SENTENCES
  au!
  autocmd InsertCharPre * if search('\v(%^|[*.!?]\_s)\_s*%#', 'bcnw') != 0 | let v:char = toupper(v:char) | endif
augroup END

"-----To Do-----
" Set Color
"if has('gui_running') 

"        colorscheme default 
"    else 
"        colorscheme pencil 
"    endif 
"
"""""""""""""""""""""""""""""""""""""""""""""
" NERDTree shortcuts
map <C-n> :NERDTreeToggle<CR>
        "split navagation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"""""""""""""""""""""""""""""""""""""""""""""
" Fold Settings
        " Save Folds on Exit
au BufWinLeave ?* mkview 1
au BufWinEnter ?* silent loadview 1
        " Toggle Foldcolumn
nnoremap <leader>f :call FoldColumnToggle()<cr>

function! FoldColumnToggle()
    if &foldcolumn
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=4
    endif
endfunction
"""""""""""""""""""""""""""""""""""""""""""""
