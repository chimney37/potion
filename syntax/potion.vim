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
syntax keyword potionKeyword class return break continue
syntax keyword potionKeyword and or
highlight link potionKeyword Keyword

" Type
syntax keyword potionType int extern
highlight link potionType Type

" Character constants
"syntax match potionCharacter "\v\\n"
highlight link potionCharacter Character



" Comment
syntax match potionComment "\v#.*$"
highlight link potionComment Comment

" Operator
syntax match potionOperator "\v\*"
syntax match potionOperator "\v/"
syntax match potionOperator "\v\+"
syntax match potionOperator "\v-"
syntax match potionOperator "\v\%"
syntax match potionOperator "\v\?"
syntax match potionOperator "\v\="
syntax match potionOperator "\v\*\="
syntax match potionOperator "\v/\="
syntax match potionOperator "\v\+\="
syntax match potionOperator "\v-\="
syntax match potionOperator "\v!\="
syntax match potionOperator "\v\>"
syntax match potionOperator "\v\<"
syntax match potionOperator "\v\&\&"
highlight link potionOperator Operator

" Number
syntax match potionNumber "\v\W\d+"hs=s+1
syntax match potionNumber "\v[0-9]+\.[0-9]+"
syntax match potionNumber "\v0x[0-9abcdef]+"
syntax match potionNumber "\v[0-9]*\.?[0-9]+e[-\+][0-9]+"
syntax keyword potionNumber true false
highlight link potionNumber Number

" Function and Methods
syntax keyword potionFunction print say join length
syntax keyword potionFunction string integer
syntax keyword potionFunction abs sqrt 
syntax region potionMethod start="\v\w+\s?\(" end="\v\)" contains=potionKeyword,potionNumber,potionOperator,potionQuote,potionParenthesis,potionString,potionFunction,potionMethod keepend
syntax region potionMethodDef start="\v^\w+\s\=\s?\(" end="\v\):" contains=potionOperator,potionParenthesis,potionQuote,potionKeyword,potionNumber,potionCharacter,potionComment keepend
syntax region potionClassDef start="\v^\w+\s\=\s?class\s?\(?" end="\v\)?:" contains=potionOperator,potionParenthesis,potionQuote,potionKeyword,potionNumber,potionCharacter,potionComment keepend
highlight link potionFunction Function
highlight link potionMethodDef Identifier
highlight link potionClassDef Identifier
highlight link potionMethod Identifier

" Quote and Parenthesis
syntax region potionString matchgroup=potionQuote start=+"+ end=+"+
syntax region potionString matchgroup=potionQuote start=+'+ end=+'+

highlight link potionQuote Quote
highlight link potionString String

let b:current_syntax = "potion"
