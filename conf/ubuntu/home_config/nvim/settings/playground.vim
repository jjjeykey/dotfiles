au FocusLost * :wa "save everything on focus lost

" make vim create undo files which make it possible to undo actions even after
" closing the file
"set undofile

" ______________________________________________________________________________ 
"auto save with esc
"map <Esc><Esc> :w<CR>
"save with ctrl -s
nmap <c-s> :w<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s>

" ______________________________________________________________________________ 
"Type 12<Enter> to go to line 12 (12G breaks my wrist)
"Hit Enter to go to end of file.
"Hit Backspace to go to beginning of file.
"nnoremap <CR> G
"nnoremap <BS> gg

" ______________________________________________________________________________ 
" funzt nicht: mapping of special chars
" http://stackoverflow.com/questions/14122573/how-to-map-ctrl-combination-in-vim 

" ______________________________________________________________________________ 
" Paste in new line
":nmap p :pu<CR>  " makes vim paste in new line http://stackoverflow.com/questions/1346737/how-to-paste-in-a-new-line-with-vim

" may want to disable again, show textmate like characters for whitspace
"set list
"set listchars=tab:▸\ ,eol:¬


" ______________________________________________________________________________ 
" Try to open things that do not belong in vim with their respective system
" program
augroup nonvim
   au!
   au BufRead *.png,*.jpg,*.pdf,*.gif,*.xls* sil exe "!xdg-open " . shellescape(expand("%:p")) | bd | let &ft=&ft
   au BufRead *.ppt*,*.doc*,*.rtf let g:output_pdf = shellescape(expand("%:r") . ".pdf")
   au BufRead *.ppt*,*.doc*,*.rtf sil exe "!/usr/local/bin/any2pdf " . shellescape(expand("%:p"))
   au BufRead *.ppt*,*.doc*,*.rtf sil exe "!xdg-open " . g:output_pdf | bd | let &ft=&ft
augroup end

" Reload all files from disk:
" http://stackoverflow.com/questions/1272007/refresh-all-files-in-buffer-from-disk-in-vim
"fun! PullAndRefresh()
  "set noconfirm
  ""!git pull deactivated it because i dunno what it does
  "bufdo e!
  "set confirm
"endfun

"nmap <leader>gr call PullAndRefresh()


" Open pdf function
function! OpenPDF(file,page)
  exec 'silent ! okular --page ' . a:page . ' --unique ' . a:file . ' > /dev/null 2>&1 &'
endfunction

"These are to cancel the default behavior of d, D, c, C
"  to put the text they delete in the default register.
"  Note that this means e.g. "ad won't copy the text into
"  register a anymore.  You have to explicitly yank it.
"nnoremap d "_d
"vnoremap d "_d
"nnoremap D "_D
"vnoremap D "_D
"nnoremap c "_c
"vnoremap c "_c
"nnoremap C "_C
"vnoremap C "_C<Paste>
