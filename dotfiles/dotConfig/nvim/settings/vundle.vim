" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'   " Plugin manager
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'Valloric/YouCompleteMe' " autocompletition
Plugin 'terryma/vim-expand-region' " use for a keybinding see above
let g:ycm_confirm_extra_conf = 0
Plugin 'Shougo/neocomplete.vim'  " autocomplete
"source $HOME/.vim/config_neocomplete.vim
Plugin 'scrooloose/nerdtree.git' " file browser
Plugin 'easymotion/vim-easymotion'  " new motion with <leader><leader>w
Plugin 'ctrlpvim/ctrlp.vim'         " search files, tags
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'      " without the mixed you start in files mode
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
"if executable('ag')
  "" Use Ag over Grep
  "set grepprg=ag\ --nogroup\ --nocolor

  "" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"endif
Plugin 'bling/vim-airline'      " new statusbar
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1 " enable buffer tab-like view
let g:airline_theme = "hybrid"
Plugin 'scrooloose/nerdcommenter'
Plugin 'christoomey/vim-tmux-navigator' " vim navigation in tmux
Plugin 'vimoutliner/vimoutliner' " simple, fast authoring
Plugin 'tpope/vim-surround.git'
Plugin 'jiangmiao/auto-pairs.git' "auto brackets?
Plugin 'flazz/vim-colorschemes' "color schemes
Plugin 'chriskempson/tomorrow-theme.git' "nice light color scheme
Plugin 'terryma/vim-multiple-cursors' "multiple line insert/yank
"Plugin 'adragomir/javacomplete' " java code completition
"alternative: AutoComplPop or Vim JDE

"snipmate and all the packages that belong to it: 
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets' "optional

" Plugin 'KevinGoodsell/vim-csexact.git'
" needed to combine ycm and ultisnips
Plugin 'ervandew/supertab'

Plugin 'freitass/todo.txt-vim.git'
" fzf (fuzzy)
Plugin 'junegunn/fzf'

"Plugin 'https://bitbucket.org/ns9tks/vim-autocomplpop/'

" mksession on steroids
Plugin 'xolox/vim-session.git'
Plugin 'xolox/vim-misc.git' "needed for above
:let g:session_autoload = 'no'
" use DeleteSession to delete your session
" RestartSession may come in handy too

Plugin 'scrooloose/syntastic.git' " syntax checking hacks, don't see a big difference to
" YouCompleteMe

Plugin 'godlygeek/tabular.git' " make things line up 

Plugin 'majutsushi/tagbar.git'
nmap <F8> :TagbarToggle<CR>


"Plugin 'vim-scripts/YankRing.vim.git' " use ctrl-p to cycle between pasted, and makes a shared yank history for all open instances
"let g:yankring_replace_n_pkey = '<alt>>'
"let g:yankring_replace_n_nkey = '<Char-174>'

"Plugin 'maxbrunsfeld/vim-yankstack.git' " lightweight alternative to yankring 
" standard: use <meta>-p and <meta>-<shift>-p to cycle forth and back, remap:
"nmap <leader>p <Plug>yankstack_substitute_older_paste
"nmap <leader>P <Plug>yankstack_substitute_newer_paste

Plugin 'mileszs/ack.vim.git' " 'far better than grep, optimized for programmers' 
" see https://github.com/mileszs/ack.vim

" increment numbers with ctrl-v ctrl-a
Plugin 'triglav/vim-visual-increment.git'

" Track the engine. ULTISNIPS
Plugin 'SirVer/ultisnips'
" " Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'        " I used this but all snippets were
"duplicated forcing the options dialog to show
" " Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsSnippetDirectories=["UltiSnips"] "~/.vim/bundle/vim-snippets/UltiSnips/] search for snippets in dirs, disable to use third-party...
" make ycm compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"according ycm config for ultisnip integration: http://stackoverflow.com/questions/27390285/vim-ultisnips-not-working-with-ycm
let g:ycm_complete_in_comments = 1 
let g:ycm_seed_identifiers_with_syntax = 1 
let g:ycm_collect_identifiers_from_comments_and_strings = 1 

"tmux navigator settings
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
"nnoremap <silent> <C-P> :TmuxNavigatePrevious<cr>
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required

syntax on
