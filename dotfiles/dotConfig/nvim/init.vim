set runtimepath+=~/.config/nvim/settings

runtime general.vim " ~/.config/nvim/settings/general.vim
runtime functions.vim  " ~/.config/nvim/settings/functions.vim
runtime playground.vim " ~/.config/nvim/settings/playground.vim
runtime vundle.vim " ~/.config/nvim/settings/vundle.vim
runtime bindings.vim " ~/.config/nvim/settings/bindings.vim

" Things to remember - old new verision in vimwiki directory 
" ==========================================================
" use gf to follow a file path like in my init.vim
" use verbose map <keybinding> to show where it was assigned
" use '. to jump to the last changed line
" use tmux-prefix + z to maximize / restore previous state
" use //e to put curor to end of a search match, or use /regex/e to do so in the
" first place
" t/T is the pendant to f/F, but befor the character
" make folds with zf
" subistiute command %s can be repeated with &
" [{ or ]} jump to the outer brackets
" use jump lists
" show them with :jumps, use ctrl-O to jump back and ctrl-I to jump forth
" use Jump commands:
" " returns to before last jump command
" HML Top, Middle, Bottom of Screen
" use cgn for replace search patterns several times
" http://vimcasts.org/episodes/operating-on-search-matches-using-gn/
" use ab, aB, ib, iB in visual mode to select blocks
" use :verbose map and :redir to see which keybindings are bound
" use q: (or q/) for vim command line window
" use ZZ to save and close
" use f in combination with v, d etc. AND use / for the same over multiple lines
" combine f with ; and , which repeats the search back and forth
" use E, ge/E to go forward/backward to the _End_ of the word
" use SaveSession Plugin
" use surround Plugin:
"   ysiwx:  you surround it with x
"   ds:     delete surroundings
"   csxy:   clear x surroundings (with) y
"   yssx:   surround whole line with x
"   Shift-S: surround in visual mode
" use vip to select an visual inner paragraph
"Make things happen in insert mode
"   CTRL-W    delete word to the left of cursor
"   CTRL-O D  delete everything to the right of cursor
"   CTRL-U    delete everything to the left of cursor
"   CTRL-H    backspace/delete
"   CTRL-J    insert newline (easier than reaching for the return key)
"   CTRL-T    indent current line
"   CTRL-D    un-indent current line
"   for more: :help ex-edit-index
"How to use registers: macros: http://stackoverflow.com/questions/1497958/how-do-i-use-vim-registers
"   :reg to see all registers
"   @m start makro m
"   0 register is last yanked line
"   1 register is last deleted line
"   qaq clear register a
"   c-R * paste register * ??
" Use my shortcuts:
"   alt+jklh in insert mode to move
" Tabularize Plugin: Use Select Test + :Tabularize (or Tab) /PATTERN to tabularize e.g. equoations by
" setting PATTERN to =
" ______________________________________________________________________________ 
" use jj to go pack to normal mode
" ______________________________________________________________________________ 
" Easy Motion short cuts:
    "Default Mapping      | Details
    "---------------------|----------------------------------------------
    "<Leader>f{char}      | Find {char} to the right. See |f|.
    "<Leader>F{char}      | Find {char} to the left. See |F|.
    "<Leader>t{char}      | Till before the {char} to the right. See |t|.
    "<Leader>T{char}      | Till after the {char} to the left. See |T|.
    "<Leader>w            | Beginning of word forward. See |w|.
    "<Leader>W            | Beginning of WORD forward. See |W|.
    "<Leader>b            | Beginning of word backward. See |b|.
    "<Leader>B            | Beginning of WORD backward. See |B|.
    "<Leader>e            | End of word forward. See |e|.
    "<Leader>E            | End of WORD forward. See |E|.
    "<Leader>ge           | End of word backward. See |ge|.
    "<Leader>gE           | End of WORD backward. See |gE|.
    "<Leader>j            | Line downward. See |j|.
    "<Leader>k            | Line upward. See |k|.
    "<Leader>n            | Jump to latest "/" or "?" forward. See |n|.
    "<Leader>N            | Jump to latest "/" or "?" backward. See |N|.
    "<Leader>s            | Find(Search) {char} forward and backward.
                         "| See |f| and |F|.
                         "
 " :?foo?t.                        
" What :m, :t and :d do is explained in their relative :help :command parts.
" :M and :T are certainly custom commands which probably massage the manipulated lines in some way.
" '' is the "last position before last jump" mark.
" Because forward search and backward search are jumps, '' can be used as address for the Ex commands above:
" place cursor on some line, we will call it "origin",
" search for foo, a few lines below,
" hit <CR> when you have found your target,
" '' now corresponds to that "origin" line from before,
" we copy the current line to just below the "origin" line with :t''
" The command-line mode mappings I suggested to jollybobbyroger turn this two steps action into a single step action.
