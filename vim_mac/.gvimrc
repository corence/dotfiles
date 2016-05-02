set ch=2		" Make command line two lines high
set mousehide		" Hide the mouse when typing text

" Only do this for Vim version 5.0 and later.
if version >= 500

  " I like highlighting strings inside C comments
  let c_comment_strings=1

  " Switch on syntax highlighting if it wasn't on yet.
  if !exists("syntax_on")
    syntax on
  endif

  " Switch on search pattern highlighting.
  set hlsearch

  " set guifont=Courier
  " set guifont=Triskweline:h10:cANSI

  set guioptions-=T

  highlight Normal guifg=#BBBBBB guibg=#000010
  highlight Search guifg=#EEEEEE guibg=#004839
  highlight Visual guifg=#000040 guibg=#ccccff
  highlight Cursor guifg=#000000 guibg=#bbccff
  
  " Set nice colors
  " background for normal text is light grey
  " Text below the last line is darker grey
  " Cursor is green, Cyan when ":lmap" mappings are active
  " Constants are not underlined but have a slightly lighter background
  " highlight Normal guibg=grey90
  " highlight Cursor guibg=Green guifg=NONE
  " highlight lCursor guibg=Cyan guifg=NONE
  " highlight NonText guibg=grey80
  " highlight Constant gui=NONE guibg=grey95
  " highlight Special gui=NONE guibg=grey95

endif
