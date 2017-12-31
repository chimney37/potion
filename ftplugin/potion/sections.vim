" Section Movement in Potion Files
" In a Potion section:
"   1. Any line following a blank line that contains non-whitespace as the
"   first character, or the first line in the file.
"   2. Any line that contains non-whitespace as the first character, an equal
"   sign somewhere inside the line, and ends with a colon.
function! s:NextSection(type, backwards, visual)
    " gv restores visual selection.
    " Running in Ex mode will clear visual selection.
    if a:visual
        normal! gv
    endif

    if a:type == 1
        " 1st match group represents a blank line.
        " 2nd match group, %^ is a Vim regex atom means beginning of file
        let pattern = '\v(\n\n^\S|%^)'
        " flag is to make sure the cursor is put at the end of the match, the right place
        let flags = 'e'
    elseif a:type == 2
        " pattern represents a function pattern of Potion
        let pattern = '\v^\S.*\=.*:$'
        let flags = ''
    endif

    if a:backwards
        let dir = '?'
    else
        let dir = '/'
    endif

    execute 'silent normal! ' . dir . pattern . dir . flags . "\r"
endfunction

" noremap : make this work for normal, visual and operator pending 
noremap <script> <buffer> <silent> ]] 
            \ :call <SID>NextSection(1, 0, 0)<cr>
noremap <script> <buffer> <silent> [[ 
            \ :call <SID>NextSection(1, 1, 0)<cr>

noremap <script> <buffer> <silent> [] 
            \ :call <SID>NextSection(2, 0, 0)<cr>
noremap <script> <buffer> <silent> ][ 
            \ :call <SID>NextSection(2, 1, 0)<cr>

"<c-u> to clear the editing field of the range in visual mode
" separate maps from noremap to feed in a flag for visual (see last argument
" of NextSection)
vnoremap <script> <buffer> <silent> ]] 
            \ :<c-u>call <SID>NextSection(1, 0, 1)<cr>
vnoremap <script> <buffer> <silent> [[ 
            \ :<c-u>call <SID>NextSection(1, 1, 1)<cr>

vnoremap <script> <buffer> <silent> [] 
            \ :<c-u>call <SID>NextSection(2, 0, 1)<cr>
vnoremap <script> <buffer> <silent> ][ 
            \ :<c-u>call <SID>NextSection(2, 1, 1)<cr>
