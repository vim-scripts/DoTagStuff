" -----------------------------------------------------------------------------

" Ctags doesn't distinguish between static/external functions in perl; they're
" all external as far as ctags is concerned; but we'd like to highlight them as
" static (local to the file).
"
hi	perlStaticFunction					guifg=#C00000
"hi	perlExternalFunction		gui=bold		guifg=#C00000
hi link perlExternalFunction		perlStaticFunction

" -----------------------------------------------------------------------------

" Get function names from tags file.
call DoTagStuff("Functions")

" =============================================================================
