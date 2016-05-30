let mapleader=" "  "set Leader key to space

set wildmode=longest:full,list:full "I have a file in one of these folder and I want vim to auto-complete the path just up to the first non-ambiguous match, this is a nice balance
set scrolloff=9999 " curor pos always in the middle of the screen

set textwidth=80
set shiftwidth=4
set softtabstop=4
set tabstop=4

set number "relativenumber "pendant: set number

"" Keep the horizontal cursor position when moving vertically.
set nostartofline
set showmatch "" Show matching braces.
set nowrap "" Do not break long lines.

set timeoutlen=500 "" After this many msecs do not imap.
set showmode "" Show the mode (insert,replace,etc.)
set gcr=a:blinkon0 "" No blinking cursor please.
set wmh=0 "" Do not show any line of minimized windows

" siehe für folgende, https://wiki.ubuntuusers.de/vim
set autoindent
set incsearch
set hlsearch
set smarttab
"" When inserting TABs replace them with the appropriate number of spaces
set expandtab
"" But TABs are needed in Makefiles
au BufNewFile,BufReadPost Makefile se noexpandtab

set splitbelow
set splitright

set smartcase 
set ignorecase
set gdefault " Make %s/A/B/g the default (g not needed anymore)
"Open new split panes to right and bottom, which feels more natural than Vim’s
"default: https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
filetype plugin indent on   " automatic file type detection for ultisnip?

" Latex? (Hannah Bast)
let g:Imap_UsePlaceHolders = 0 "" no placeholders please
let g:Tex_SmartKeyQuote = 0 "" no " conversion please
let g:Tex_UseMakefile = 0 "" don't use Makefile if one is there

set mouse=a
" set drag and drop support (xterm -> xterm2)
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif


" ______________________________________________________________________________ 
" nvim specific
if has('nvim')
    let s:editor_root=expand("~/.config/nvim")
    runtime! plugin/python_setup.vim
else
    let s:editor_root=expand("~/.vim")
endif

" ______________________________________________________________________________ 
" Code features:
" colorize the columns who exceed the length of 81
highlight colorcolumn ctermbg=magenta
call matchadd('Colorcolumn', '\%81v', 100)  " pattern match only the columns that exceed

" ______________________________________________________________________________ 
" Buffers:
" http://stackoverflow.com/questions/26708822/why-do-vim-experts-prefer-buffers-over-tabs
" switch to other buffer without having to save it
" hide buffers when abandoned?
set hidden
" navigate between them
map <F2> :ls<CR>:b<Space>
" save them even after closing vim
:set viminfo^=%
"quit buffer easily, does not work :(
nnoremap <leader>q :bd
"cycle between buffers
nmap gb :bn<CR>
nmap gB :bprevious<CR>

" ______________________________________________________________________________ 
" Appearance
set t_Co=256
"set background=light "dark
colorscheme Tomorrow
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
""colorscheme gruvbox not needed see gui_color_mod
""silent! source $HOME/.gui_color_mode "this also sets colorscheme
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"set background=light " or dark
"colorscheme summerfruit256

" ______________________________________________________________________________ 
" Font section
""set guifont=Liberation\ Mono\ for\ Powerline\ 10 "set guifont=Sauce\ Code\ Powerline\ 10
set guifont=Inconsolata\ for\ Powerline\ 10
"set linespace=12
set guioptions=r


" ______________________________________________________________________________ 
" Hit v to select one character
"Hit vagain to expand selection to word Hit v again to expand to paragraph
"Hit <C-v> go back to previous selection if I went too far
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" ______________________________________________________________________________ 
" vp (visual select and then paste) doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

""""
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/<Paste>
" ______________________________________________________________________________ 
" turn off vims 'horrible' regex search and use normal regexes instead
nnoremap / /\v
vnoremap / /\v
nnoremap <leader>c :noh<cr> " clears the highlighting of search!!!

"" Toggle between .h and .cpp with F4.
function! ToggleBetweenHeaderAndSourceFile()
  let bufname = bufname("%")
  let ext = fnamemodify(bufname, ":e")
  if ext == "hh"
    let ext = "cpp"
  elseif ext == "cpp"
    let ext = "hh"
  else
    return
  endif
  let bufname_new = fnamemodify(bufname, ":r") . "." . ext
  let bufname_alt = bufname("#")
  if bufname_new == bufname_alt
    execute ":e#"
  else
    execute ":e " . bufname_new
  endif
endfunction
map <silent> <F4> :call ToggleBetweenHeaderAndSourceFile()<CR>

"Java compile and debug
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
map <F9> :make<Return>:copen<Return>
map <F10> :cprevious<Return>
map <F11> :cnext<Return>


