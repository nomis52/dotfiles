" I am in no way a vim guru, but this is a collection of options I've gathered
" over the years.

" Enable filetype detection; enable ft plugins & indent.
filetype plugin indent on

" Turn syntax highlighting on
syntax on

" By default, expand tabs to 2 spaces
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

" Make backspace work correctly in v6
set backspace=2
" set backspace=indent,eol,start

" Wrap everything to 80 characters and highlight everything over 80 in red.
set textwidth=79
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" 'Simple' C indenting, don't use the fancy cindent mode
set autoindent
set smartindent
set nocindent

" Highlight trailing whitespace
set list
set listchars=tab:\ \ ,trail:\ ,extends:?,precedes:?
highlight SpecialKey ctermbg=Yellow guibg=Yellow

" Auto complete multiline comments
set fo+=r

" Highlight the line with the cursor
set cul

" Enable ruler (row, col co-ordinates)
set ruler

" Comments in magenta, since it's easier to read than the default dark blue.
hi Comment ctermfg=darkmagenta

" Turn off that annoying visualbell
set visualbell t_vb=".

" Dumb { closing
inoremap {<CR> {<CR>}<C-o>O

" Leader is space
let mapleader = "\<Space>"

" Move through the quickfix list
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Save files when running make, useful for :GoRun / :GoBuild
set autowrite

" Set screen title to match the buffer, but only if we're in screen.
" let term=$TERM
" if term == 'screen'
" set titleold=
" set t_ts=^[k
" set t_fs=^[\
" auto BufEnter * :set title | let &titlestring = expand('%')
" auto VimLeave * :set t_ts=^[kbash^[\
" endif

" Filetype detection
au BufNewFile,BufRead *.dox set filetype=doxygen
au BufNewFile,BufRead *.json set filetype=javascript
au BufNewFile,BufRead *.thrift setlocal filetype=thrift
" http://www.vim.org/scripts/script.php?script_id=2654
au BufNewFile,BufRead *.\(pde|ino\) setlocal ft=arduino

" Plugins, with vim-plug
call plug#begin()
Plug 'fatih/vim-go'
Plug 'jeetsukumaran/vim-buffergator'
"Plug 'errormarker.vim'
call plug#end()

" Buffer management
let g:buffergator_suppress_keymaps = 1
let g:buffergator_show_full_directory_path = 0
nnoremap <leader>d :BuffergatorToggle<cr>
nmap <leader>j :BuffergatorMruCyclePrev<cr>
nmap <leader>k :BuffergatorMruCycleNext<cr>
nmap <leader>s :b#<cr>

" # Go specific config
" Go mappings
au FileType go setlocal noexpandtab nolist
au FileType go nmap <Leader>r <Plug>(go-rename)
au FileType go nmap <leader>t  <Plug>(go-test)
au FileType go nmap <leader>f  <Plug>(go-test-func)
au FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
au FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

" Go plugin settings
let g:go_metalinter_autosave=0
let g:go_echo_command_info=0
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

set autowrite

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Comments in yellow, since it's easier to read than the default dark blue.
hi Comment ctermfg=3

" Leader-e edits files in the current directory.
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>

" Change netrw dir colors.
:hi link netrwDir Statement
