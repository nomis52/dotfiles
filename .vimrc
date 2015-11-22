" I am in no way a vim guru, but this is a collection of options I've gathered
" over the years.

" Recognize filetypes & enable syntax highlighting.
filetype on
filetype indent on
syntax on

" See http://vim.wikia.com/wiki/Indenting_source_code
set expandtab
set shiftwidth=2
set softtabstop=2

" Wrap everything to 80 characters and highlight everything over 80 in red.
set textwidth=79
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" 'Simple' C indenting, don't use the fancy cindent mode
set autoindent
set smartindent
set nocindent

" Highligh trailing whitespace
set list
set listchars=tab:\ \ ,trail:\ ,extends:?,precedes:?
highlight SpecialKey ctermbg=Yellow guibg=Yellow

" Auto complete multiline comments
set fo+=r

" Highlight the line with the cursor
set cul

" Comments in magenta, since it's easier to read than the default dark blue.
hi Comment ctermfg=darkmagenta

" Turn off that annoying visualbell
set visualbell t_vb=".

" http://www.vim.org/scripts/script.php?script_id=2654
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino

" Use doxygen syntax for .dox files
au BufNewFile,BufRead *.dox set filetype=doxygen
au BufNewFile,BufRead *.json set ft=javascript                                                                                         

" Set screen title to match the buffer 
" Use Control-V ESC for the special characters
set t_ts=^[k
set t_fs=^[\
auto BufEnter * :set title | let &titlestring = expand('%')
auto VimLeave * :set t_ts=^[kbash^[\
