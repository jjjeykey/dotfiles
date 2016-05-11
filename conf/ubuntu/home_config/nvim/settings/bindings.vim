imap jj <Esc>
"vmap jk <Esc>

" use ctrl-j to insert newline in command mode like in insert mode
" does not work
nmap <C-j> o<Esc>

nn <s-enter> :echo 'senter'<cr>
nn <enter> :echo 'enter'<cr>
nn <c-s-enter> :echo 'csenter'<cr>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :qa<CR>
nnoremap <Leader>o :CtrlP<CR>

" accumulate selections: 
"   V '"'a then y, then '"'A for appending, pa for paste from a
nnoremap <Leader>j \"Jyy      "append to register j

" ______________________________________________________________________________ 
" PASTING AND YANKING
" use <C-R> + <Register> (e.g. " or *) to print that register:
" http://stackoverflow.com/questions/2861627/paste-in-insert-mode
" paste from *vim reg* in insert mode
inoremap <C-v> <C-r>0
"paste from clipboard in command mode
nnoremap <leader>p o<C-r>+<esc>
" yank a line to clipboard when not selecting anything
nnoremap <C-c> <S-v>"+y
" copy/paste to *system clipboard* in visual mode
vnoremap <C-c> "+y
vnoremap <C-S-v> "+p
" paste from non-delete buffer
vnoremap <C-v> "0p

" ______________________________________________________________________________ 
" make a new vsp and switch to it
nnoremap <leader>w <C-w>v<C-w>l
"make separation lines, should invoke my ultisnippet
nnoremap <leader>- 0i-- <esc>:call UltiSnips#ExpandSnippet()<cr><esc>
nnoremap <leader>" 0i"" <esc>:call UltiSnips#ExpandSnippet()<cr><esc>

 
"make my short cuts 
"make newline easily: conflicts with vim command history
"nmap <S-Enter> <CR>
"nmap <CR> o<Esc>

" Map Ctrl-Backspace to delete the previous word in insert mode, does not work?
imap <C-BS> <C-W>

" ______________________________________________________________________________ 
" Cucumber Tables
" Tabularize Plugin + Cucumber Tables with this script
" Cucumber tables are tables seperated by |
" see ~/jakobwild@gmail.com/Optimierung/vimrcs/cucumberTablesWithTabularPluginAutomation.vim
" and nvim plugin directory .config/nvim/plugins/ where files get automatically
" sourced

" ______________________________________________________________________________ 
" Change of Vim basics
" move by line on screen, not by line of file
" http://stackoverflow.com/questions/9713967/how-can-i-intuitively-move-cursor-in-vimnot-by-line
:map j gj
:map k gk

" provide hjkl movements in Insert mode and Command-line mode via the <Alt> modifier key
noremap! <A-h> <Left>
noremap! <A-j> <Down>
noremap! <A-k> <Up>
noremap! <A-l> <Right>

" get rid of help key that you might accidentally hit while trying to reach ESC
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Strip all trailing whitespaces
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" re-hardwrap two soft wrapped lines
nnoremap <leader>q gqip
" select text just pasted
nnoremap <leader>v V`]`

"" Make it easy to update/reload _vimrc.
nmap ,s :source $HOME/.config/nvim/init.vim
nmap ,v :vsp $HOME/.config/nvim/init.vim 
nmap ,u :vsp $HOME/.vimrc/Bundle/vim-snippets/UltiSnips/java.snippets

"Eclim shortcuts
nmap <Leader><Leader>cr :JavaCorrect
nmap <Leader><Leader>cn :JavaCorrect

"nmap <C-M> :tabnext<CR>
"nmap <C-N> :tabprev<CR>

" Key bindings for split-view navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set sw=2

"" Next / previous error with Tab / Shift+Tab.
map <silent> <Tab> :cn<CR>
map <silent> <S+Tab> :cp<CR>
map <silent> <BS><Tab> :cp<CR>

"" Umlaut mappings for US keyboard.
imap "a ä
imap "o ö
imap "u ü
imap "s ß
imap "A Ä
imap "O Ö
imap "U Ü
