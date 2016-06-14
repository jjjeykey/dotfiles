" by default make the compile verbose
let g:Myvar="noisy"

" function to compile the mainfile, either verbosely or not
function! CompileMainfile()
    if g:Myvar=="noisy"
    :! MakepdfMainfile.sh %
   else
    "echo "quiet"
    :! MakepdfMainfile.sh % noshow
   endif
endfunction

" latex => dvips => ps2pdf
function! DvipsMainfile()
    if g:Myvar=="noisy"
    :! compileMainfile.sh -d %
   else
    "echo "quiet"
    :! compileMainfile.sh -dq %
   endif
endfunction

" pdflatex
function! PdflatexMainfile()
    if g:Myvar=="noisy"
    :! compileMainfile.sh -p %
   else
    "echo "quiet"
    :! compileMainfile.sh -pq %
   endif
endfunction

" just latex
function! Justlatex()
    if g:Myvar=="noisy"
    :! compileMainfile.sh %
   else
    "echo "quiet"
    :! compileMainfile.sh -q %
   endif
endfunction

" function to toggle between Noisy and Quiet
function! ToggleNQ()
    if g:Myvar=="noisy"
     let g:Myvar="quiet"
     echo "Silent mode ON"
    else
     let g:Myvar="noisy"
     echo "Silent mode OFF"
    endif
endfunction

:map f :w<CR>:call Justlatex()<CR>
:map F :w<CR>:call DvipsMainfile()<CR>
:map P :w<CR>:call PdflatexMainfile()<CR>
:map <F4> :! viewMainDVI.sh %<CR>
:map <F6> :! viewMainPDF.sh %<CR>
:map t :call ToggleNQ() <CR>

