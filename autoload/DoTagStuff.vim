" $Header: /usr/home/common/vim/autoload/RCS/DoTagStuff.vim,v 1.2 2002/11/04 20:38:00 gary Exp $

" Create and/or locate .vim* files (generated from tags files), and source them
" to set syntax highlighting for tags.
"
function! DoTagStuff(token_list)
     let tag_files   = "'" . substitute(&tags, ",", "' '", "g") . "'"
     let tag_scripts = system('find_tagstuff -c --types ' . a:token_list . ' --files ' . tag_files)
     exe substitute(tag_scripts, "VIM_SCRIPT_FILE:", "source ", "g")
endfunction
