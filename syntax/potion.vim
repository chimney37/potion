" the lines at the beginning and end are a convention that prevents the syntax
" from being loaded if syntax highlighting has already been enabled for this buffer
if exists("b:current_syntax")
	finish
endif

" syntax highlighting code will go here
" Basic structure: define syntax in chunks, then link them to highlight
" Keyword
syntax keyword potionKeyword loop to times while
syntax keyword potionKeyword if elsif else
syntax keyword potionKeyword class return
highlight link potionKeyword Keyword

" Character constants
syntax match potionCharacter "\v\\n"
syntax match potionCharacter "\v\."
highlight link potionCharacter Character

" Quote and Parenthesis
syntax region potionString matchgroup=potionQuote start=+"+ end=+"+
syntax region potionArguments matchgroup=potionQuote start=+(+ end=+)+ contains=potionNumber,potionOperator,potionQuote,potionString,potionArguments keepend


highlight link potionQuote Quote
highlight link potionString String

" Function
syntax keyword potionFunction print join string
syntax region potionFunction start="\v^.+\(" end="\v\)" contains=potionNumber,potionOperator,potionQuote,potionString,potionArguments keepend
highlight link potionFunction Function

" Comment
syntax match potionComment "\v#.*$"
highlight link potionComment Comment

" Operator
syntax match potionOperator "\v\*"
syntax match potionOperator "\v/"
syntax match potionOperator "\v\+"
syntax match potionOperator "\v-"
syntax match potionOperator "\v\?"
syntax match potionOperator "\v\="
syntax match potionOperator "\v\*\="
syntax match potionOperator "\v/\="
syntax match potionOperator "\v\+\="
syntax match potionOperator "\v-\="
highlight link potionOperator Operator

" Number
syntax match potionNumber "\v[0-9]+"
syntax match potionNumber "\v[0-9]+\.[0-9]+"
syntax match potionNumber "\v0x[0-9abcdef]+"
syntax match potionNumber "\v[0-9]*\.?[0-9]+e[-\+][0-9]+"
highlight link potionNumber Number

let b:current_syntax = "potion"
