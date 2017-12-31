" Custom Folding Plugin for Potion Files -------------------------{{{
" Given a piece of code like:
"  hello = (name):
"    'Hello, ' print
"    name print.
"  hello (chimney37)
" We will fold like:
"  +-  3 lines: hello = ():
"
"  hello (chimney37)
" And not like:
"  +-  4 lines: hello = ():
"  hello('chimney37')
" set folding method to an expression
setlocal foldmethod=expr
" foldexpr is evaluated perline to obtain the foldlevel. It takes a number as
" the foldlevel per line
setlocal foldexpr=GetPotionFold(v:lnum)
"}}}

" Main Folding Function----------------{{{
" this gets the foldlevel given the line number in a custom way
" VIM sets v:lnum to the line number of the line it wants to know about 
function! GetPotionFold(lnum)
    " Handle the Blank lines case
    " =~? case-insensitive match using regexp matching,
    " the exprssion says, at beginning of line, any number of
    " whitespace characters only, end of line
    " getline gets content of current line as string
    " this won't match on non-whitespace characters
    " '-1' means level of line is undefined
    " undefined levels will take on the smallest foldlevel of either of their
    " neighbors (catch: below, we are telling Vim to open a fold level using '>x',
    " instead of x. this means Vim won't set a fold level of x (the neighbor).
    " Exact Vim behavior is not known, but Vim handles this special foldlevel
    " in a special way.
    if getline(a:lnum) =~? '\v^\s*$'
        " echom  a:lnum .' '.  '-1'
        return '-1'
    endif
    
    " Get the indent level of current line and the next non blank line
    let this_indent = IndentLevel(a:lnum)
    let next_indent = IndentLevel(NextNonBlankLine(a:lnum))

    " case 1) next indent level is same
    "   in this case, we return current (this) indent level to fold it as the
    "   expected level. handles special case of last line where is has an
    "   indent level of 0
    if next_indent == this_indent
        return this_indent
    " case 2) next indent level is less
    "   returns this indent level as that is the correct indentation.
    "   handles special case of last line where it has a indent level of > 0
   elseif next_indent < this_indent
        return this_indent
    " case 3) next indent level is more
    "  in this case, we want current (this) indent level to be at the next
    "  level. we return '>x', which tells Vim to open a fold of given level x
    elseif next_indent > this_indent
        return '>' . next_indent
    endif
endfunction
"}}}

" Helper: Get the line number of next non-blank line ------------{{{
function! NextNonBlankLine(lnum)
    " line('$') gets total number of lines in file
    " $ is the last line of buffer
    " line gets the line number of the expr given to it
    let totalnumlines = line('$')
    " set current to the number of next line
    let current = a:lnum + 1

    while current <= totalnumlines
        " if the line matches as regexp for case insensitive, on any character that's not
        " whitespace, means is not a blank line
        " returns current, which points to the next blank line
        if getline(current) =~? '\v\S'
            return current
        endif

        let current += 1
    endwhile
    
    "return an invalid line number in the case where there are no non-blank lines after the current line. -2 because -1 and 0 are special Vim foldlevel strings
    return -2
endfunction
"}}}

" Helper: Calculate indentation level---------{{{
function! IndentLevel(lnum)
    " indent(a:lnum) returns number of spaces at the beginning of the given
    " line number
    " using &shiftwidth allows us to use x-space indentation (if someone
    " prfers to use another x
    return indent(a:lnum) / &shiftwidth
endfunction
"}}}
